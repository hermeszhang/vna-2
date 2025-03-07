#include "main.h"
#include "ad8319.h"
#include "gainBlock.h"
#include "dwt_stm32_delay.h"
#include <string.h>
#include <stdlib.h>
#include "usb_device.h"
#include "usbd_cdc_if.h"

extern ADC_HandleTypeDef hadc1;

void printPower(struct gainStruct *gainStatus)
{
	gainStatus->measOutputPower = readAD8319();

	int8_t str1[64] = "";
	sprintf((char *)str1, "Power = %0.2f dBm\n", gainStatus->measOutputPower);
	printUSB(str1);
}

float adcToVolts(uint32_t adcValue, uint32_t resolution)
{
	float result = (3.0F * adcValue) / (float) resolution; // 3.0F is the Vadc voltage
	return result;
}

float readAD8319(void)
{
	uint32_t adcValue = 0;
	float voltage;

	// Get a 128 sample average of the ADC data
	for (uint8_t i = 128; i > 0; i--)
	{
		while(HAL_ADC_PollForConversion(&hadc1, 1000) != HAL_OK)
		{
			// Wait
		}

		if(HAL_ADC_PollForConversion(&hadc1, 1000) == HAL_OK)
		{
			adcValue += HAL_ADC_GetValue(&hadc1);
		}
		DWT_Delay_us(1);
	}

	adcValue = adcValue >> 7; // Divide by 128 to get average value

	voltage = adcToVolts(adcValue, 4096);

	return ((voltage - 0.33) / (-0.022)); // Vout -> P (dBm) for Ad8317
}
