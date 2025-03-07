#include "main.h"
#include "txChain.h"
#include "errorHandling.h"
#include "max2871.h"
#include "debug.h"
#include "dwt_stm32_delay.h"
#include "usbd_cdc_if.h"
#include <string.h>
#include <stdlib.h>
#include <math.h>

struct txStruct txStatus;
extern SDADC_HandleTypeDef hsdadc1;

// Sweeps through frequency as if measuring S-Params
// Optional param sweepTime to add delays in for human viewing pleasure. Set to 0 for no injected delays
void sweep(float lowerFreq, float higherFreq, float numSteps, float power, float sweepTime, struct MAX2871Struct *max2871Status, struct txStruct *txStatus)
{
	statusThinking();
	float stepSize = ((higherFreq - lowerFreq) / numSteps);
	uint32_t delay = sweepTime * 1000000 / numSteps; 	// Delay is in uS

	float currentFrequency = lowerFreq;

	while (currentFrequency <= higherFreq)
	{
		sigGen(currentFrequency, power, max2871Status, txStatus);
		DWT_Delay_us(delay);
		currentFrequency += stepSize;

	}
	statusNominal();
}

// Sets up output for given frequency and power level
void sigGen(float frequency, float power, struct MAX2871Struct *max2871Status, struct txStruct *txStatus)
{
	setFrequency(frequency, max2871Status, txStatus);

	while (!max2871CheckLD(max2871Status));
	// Don't go any further until PLL has lock

	setOutputPower(power, max2871Status, txStatus);
}

// Configures output for required frequency
void setFrequency(float frequency, struct MAX2871Struct *max2871Status, struct txStruct *txStatus)
{
	txStatus->filter = setFilter(frequency);
	max2871SetFrequency(frequency,FRAC_N,max2871Status);
}

void txChainInit(struct MAX2871Struct *max2871Status, struct txStruct *txStatus)
{
	disablePA(txStatus);
	// Init attenuator LE high
	HAL_GPIO_WritePin(ATTEN_LE_GPIO_Port,ATTEN_LE_Pin,1);
	setAttenuation(MAX_ATTENUATION,txStatus);
	max2871Setup(max2871Status);
	txStatus->filter = setFilter(1);
	enablePA(txStatus);
	max2871RFEnable(max2871Status);
}

// Output filters to remove harmonics
// Pass in either the frequency desired or the exact filter number (1-4)
int8_t setFilter(float frequency)
{
	if (((frequency > 23.5) && (frequency < 105)) || (frequency == 1))
	{
		HAL_GPIO_WritePin(FILTER_SW_1_GPIO_Port, FILTER_SW_1_Pin, 0);
		HAL_GPIO_WritePin(FILTER_SW_2_GPIO_Port, FILTER_SW_2_Pin, 0);
		return 1;
	}
	else if (((frequency >= 105) && (frequency < 225))  || (frequency == 2))
	{
		HAL_GPIO_WritePin(FILTER_SW_1_GPIO_Port, FILTER_SW_1_Pin, 0);
		HAL_GPIO_WritePin(FILTER_SW_2_GPIO_Port, FILTER_SW_2_Pin, 1);
		return 2;
	}
	else if (((frequency >= 225) && (frequency < 600))  || (frequency == 3))
	{
		HAL_GPIO_WritePin(FILTER_SW_1_GPIO_Port, FILTER_SW_1_Pin, 1);
		HAL_GPIO_WritePin(FILTER_SW_2_GPIO_Port, FILTER_SW_2_Pin, 0);
		return 3;
	}
	else if (((frequency >= 600) && (frequency <= 1250))  || (frequency == 4))
	{
		HAL_GPIO_WritePin(FILTER_SW_1_GPIO_Port, FILTER_SW_1_Pin, 1);
		HAL_GPIO_WritePin(FILTER_SW_2_GPIO_Port, FILTER_SW_2_Pin, 1);
		return 4;
	}
	else
	{
		logError((char *) "> Bad input frequency to setFilter\r\n");
		return -1;
	}
}

// Sets attenuation for a SKY12347 attenuator
void setAttenuation(float atten, struct txStruct *txStatus)
{
	// Convert given attenuation value to the 8 bits which SKY12347 wants
	txStatus->attenuation = atten;
	uint8_t bitSequence = (atten * 4);
	bitSequence = ~bitSequence;

	// Begin by bringing LE low
	HAL_GPIO_WritePin(ATTEN_LE_GPIO_Port, ATTEN_LE_Pin, 0);
	DWT_Delay_us(1);

	// Transfer the bits
	for (uint8_t i = 6; i > 0 ; i--)
	{
		HAL_GPIO_WritePin(ATTEN_MOSI_GPIO_Port, ATTEN_MOSI_Pin, bitSequence & (1 << i));
		DWT_Delay_us(1);
		HAL_GPIO_WritePin(ATTEN_CLK_GPIO_Port, ATTEN_CLK_Pin, 1);
		DWT_Delay_us(1);
		HAL_GPIO_WritePin(ATTEN_CLK_GPIO_Port, ATTEN_CLK_Pin, 0);
	}
	HAL_GPIO_WritePin(ATTEN_MOSI_GPIO_Port, ATTEN_MOSI_Pin, 0);
	// Shift data in by bringing LE high
	DWT_Delay_us(1);
	HAL_GPIO_WritePin(ATTEN_LE_GPIO_Port, ATTEN_LE_Pin, 1);
}

// Very simple control of attenuator to set desired output power.
// Changes attenuation until AD8319 reads correct value or runs out of attenuation.
void setOutputPower(float setPower, struct MAX2871Struct *max2871Status, struct txStruct *txStatus)
{
	if (setPower >= 0)
		max2871SetPower(5, max2871Status);
	else
		max2871SetPower(-4, max2871Status);

	txStatus->setOutputPower = setPower;
	readAD8319(txStatus);

	// If power too high
	if (txStatus->measOutputPower > txStatus->setOutputPower)
	{
		// While power too high
		while (txStatus->measOutputPower > (txStatus->setOutputPower + STEP_ATTENUATION))
		{
			if (txStatus->attenuation < MAX_ATTENUATION)
			{
				setAttenuation(txStatus->attenuation += STEP_ATTENUATION, txStatus);
				HAL_Delay(10);	// Delay to allow for propagation of new signal
				readAD8319(txStatus);
			}
			else
			{
				logError((char *) "> Ran out of attenuation!\r\n");
				break;
			}
		}
	}
	// If power too low
	else if (txStatus->measOutputPower < txStatus->setOutputPower)
	{
		// While power too low
		while (txStatus->measOutputPower < (txStatus->setOutputPower - STEP_ATTENUATION))
		{
			if (txStatus->attenuation > MIN_ATTENUATION)
			{
				setAttenuation(txStatus->attenuation -= STEP_ATTENUATION, txStatus);
				HAL_Delay(10);	// Delay to allow for propagation of new signal
				readAD8319(txStatus);
			}
			else
			{
				logError((char *) "> Ran out of attenuation!\r\n");
				break;
			}
		}
	}

}

// Sets power value in the txStatus struct
// Accounts for losses before AD8319, however need to confirm through measurements
// Returns voltage measured from the AD8319
float readAD8319(struct txStruct *txStatus)
{
	float voltage, power;
	uint32_t adcValue = 0;
	uint32_t ch;
	uint16_t retVal;


	// Get a 8 sample average of the ADC data
	uint8_t i = 0;
	while (i < 8)
	{
		while(HAL_SDADC_PollForInjectedConversion(&hsdadc1, 100) != HAL_OK)
		{
			// Wait until SDADC is ready
		}

		if(HAL_SDADC_PollForInjectedConversion(&hsdadc1, 100) == HAL_OK)
		{
			retVal = HAL_SDADC_InjectedGetValue(&hsdadc1, &ch);
			// As we can't choose what channel to sample, only store value if it is channel 5 (AD8319)
			if (ch ==  5)
			{
				adcValue += retVal;
				i++;
			}
		}
		DWT_Delay_us(10);
	}

	adcValue /= 8; // Divide by 8 to get average value

	voltage = (VREF * adcValue) / NUM_STATES_16_BIT;	// Convert to voltage

	power = -44.4 * voltage + 40; 				// Convert voltage to dBm for AD8317, check matlab script for numbers

	txStatus->measOutputPower = power;

	return voltage;
}

void enablePA(struct txStruct *txStatus)
{
	HAL_GPIO_WritePin(PA_PWRDN_GPIO_Port,PA_PWRDN_Pin,0);
	txStatus->pa_pdwn = 0;
}

void disablePA(struct txStruct *txStatus)
{
	HAL_GPIO_WritePin(PA_PWRDN_GPIO_Port,PA_PWRDN_Pin,1);
	txStatus->pa_pdwn = 1;
}


void txChainPrintStatus(struct txStruct *txStatus)
{

	char str1[128] = "";

	printUSB((char *)"> ----  TX Chain  ----\n");

	sprintf((char *)str1, "> Filter = %d\n", txStatus->filter);
	printUSB(str1);

	sprintf((char *)str1, "> Attenuation = %0.1f dB\n", txStatus->attenuation);
	printUSB(str1);

	sprintf((char *)str1, "> PA Powerdown = %d\n", txStatus->pa_pdwn);
	printUSB(str1);

	sprintf((char *)str1, "> Set Output Power= %0.2f dBm\n", txStatus->setOutputPower);
	printUSB(str1);

	readAD8319(txStatus);

	sprintf((char *)str1, "> Measured Output Power = %0.2f dBm\n", txStatus->measOutputPower);
	printUSB(str1);

	sprintf((char *)str1, "> Measured Voltage= %0.2f V\n", readAD8319(txStatus));
	printUSB(str1);
}

void outputLevelTest(float startFreq, float stopFreq, float numSteps, struct MAX2871Struct *max2871Status, struct txStruct *txStatus)
{
	statusThinking();
	setAttenuation(0,txStatus);
	float stepSize = ((stopFreq - startFreq) / numSteps);

	float currentFrequency = startFreq;
	while (currentFrequency <= stopFreq)
	{
		max2871SetFrequency(currentFrequency, FRAC_N, max2871Status);
		currentFrequency += stepSize;

		char str1[128] = "";
		sprintf((char *)str1, "%0.0f %0.2f %0.2f\n", max2871Status->frequency, readAD8319(txStatus),txStatus->measOutputPower);
		printUSB(str1);

		while(HAL_GPIO_ReadPin(SW_1_GPIO_Port,SW_1_Pin) == 0); // Wait for the button to be pressed
		HAL_Delay(200);
	}
	statusNominal();
}

void powerDetectorCal(float deltaAtten, struct MAX2871Struct *max2871Status, struct txStruct *txStatus)
{
	statusThinking();
	max2871SetFrequency(50,FRAC_N, max2871Status);


	for(txStatus->attenuation = 0; txStatus->attenuation <= 31.5; txStatus->attenuation += deltaAtten)
	{
		setAttenuation(txStatus->attenuation, txStatus);

		char str1[128] = "";
		sprintf((char *)str1, "%0.1f %0.2f %0.2f\n", txStatus->attenuation, readAD8319(txStatus),txStatus->measOutputPower);
		printUSB(str1);

		while(HAL_GPIO_ReadPin(SW_1_GPIO_Port,SW_1_Pin) == 0); // Wait for the button to be pressed
		HAL_Delay(200);
	}
	statusNominal();
}
