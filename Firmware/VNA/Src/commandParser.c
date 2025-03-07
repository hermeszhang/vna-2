#include "main.h"
#include "commandParser.h"
#include "usbd_cdc_if.h"
#include "dwt_stm32_delay.h"
#include "debug.h"
#include "errorHandling.h"
#include "max2871.h"
#include "txChain.h"
#include "receiver.h"
#include "measure.h"
#include <stdio.h>
#include <string.h>

char txStr[128] = "";

void commandParser(struct MAX2871Struct *max2871Status, struct txStruct *txStatus, struct receiverStruct *receiverStatus)
{
	#define BUF_SIZE 128
	#define CMD_SIZE 32
	#define NUM_ARGS 6

	char usrMsg[BUF_SIZE];
	char command[CMD_SIZE] = "";
	char args[NUM_ARGS][16];
	uint8_t argNum = 0;
	// Get whatever the user has sent
	scanUSB((uint8_t *) usrMsg, BUF_SIZE);

	// Split on delim
	for (uint8_t i = 0; i < FIFO_SIZE; i++)
	{
		if ((usrMsg[i] == '(') || (usrMsg[i] == ')') || (usrMsg[i] == ','))
			usrMsg[i] = '\0';
	}

	// Determine the command word
	uint8_t i = 0;
	while (usrMsg[i] != '\0')
	{
		command[i] = usrMsg[i];
		i++;
	}

	// Find arguments
	while (i < FIFO_SIZE)
	{
		// If null term, (was delim) skip
		if (usrMsg[i] == '\0')
			i++;
		else
		{
			// Otherwise, copy arguments into their own strings
			uint8_t j = 0;
			while (usrMsg[i] != '\0')
			{
				args[argNum][j] = '\0';
				args[argNum][j++] = usrMsg[i];
				i++;
			}
			args[argNum][j] = '\0';
			argNum++;
		}

	}

	// Find command based on command word, and call function

	if (strncmp("sigGen", command, 6) == 0)
	{
		sigGen(atof(args[0]), atof(args[1]), max2871Status, txStatus);

		sprintf((char *)txStr, "> Signal Generator: Frequency = %0.2f MHz, Power = %0.2f dBm\n", max2871Status->frequency, txStatus->measOutputPower);
		printUSB(txStr);
	}

	else if (strncmp("sweep", command, 5) == 0)
	{
		sprintf((char *)txStr, "> Sweep: Start = %0.2f MHz, fFinish = %0.2f dBm Power = %0.2f dBm\n", atof(args[0]), atof(args[1]), atof(args[2]));
		printUSB(txStr);

		sweep(atof(args[0]), atof(args[1]), atof(args[2]), atof(args[3]), atof(args[4]), max2871Status, txStatus);
	}

	else if (strncmp("measure", command, 7) == 0)
	{
		sprintf((char *)txStr, "> Measure: S%d, fStart = %0.2f MHz, fStop = %0.2f MHz, numSteps = %d, Power = %0.2f dBm\n", atoi(args[0]), atof(args[1]), atof(args[2]), atoi(args[3]), atof(args[4]));
		printUSB(txStr);

		measure(atoi(args[0]), atof(args[1]), atof(args[2]), atoi(args[3]), atof(args[4]), max2871Status, txStatus, receiverStatus);
	}

	else if (strncmp("setCal", command, 6) == 0)
		{
				if (strncmp("short", args[0], 4) == 0)
				{
					setEcal(SHORT);
					sprintf((char *)txStr, "> ECal set to short\n");
				}
				else if (strncmp("open", args[0], 4) == 0)
				{
					setEcal(OPEN);
					sprintf((char *)txStr, "> ECal set to open\n");
				}
				else if (strncmp("load", args[0], 4) == 0)
				{
					setEcal(LOAD);
					sprintf((char *)txStr, "> ECal set to load\n");
				}
				else if (strncmp("thru", args[0], 4) == 0)
				{
					setEcal(THRU);
					sprintf((char *)txStr, "> ECal set to through\n");
				}
				args[0][0] = (int32_t) "";

				printUSB(txStr);
		}



	else if (strncmp("setFilter", command, 9) == 0)
	{
		txStatus->filter = setFilter(atof(args[0]));
		sprintf((char *)txStr, "> Filter set to: %d\n", txStatus->filter);
		printUSB(txStr);
	}

	else if (strncmp("setMaxPower", command, 11) == 0)
	{
		max2871SetPower(atoi(args[0]), max2871Status);
		int8_t powerArray[4] = {-4, -1, 2, 5};
		sprintf((char *)txStr, "> Power set to: %d dBm\n", powerArray[max2871Status->rfPower]);
		printUSB(txStr);
	}

	else if (strncmp("setAttenuation", command, 14) == 0)
	{
		setAttenuation(atof(args[0]), txStatus);
		sprintf((char *)txStr, "> Attenuation set to: %0.2f dB\n", txStatus->attenuation);
		printUSB(txStr);
	}

	else if (strncmp("enableRF", command, 8) == 0)
	{
		max2871RFEnable(max2871Status);
		printUSB("> RF Enabled \r\n");
	}

	else if (strncmp("disableRF", command, 8) == 0)
	{
		max2871RFDisable(max2871Status);
		printUSB("> RF Disabled \r\n");
	}

	else if (strncmp("enablePA", command, 8) == 0)
	{
		enablePA(txStatus);
		printUSB("> PA Enabled \r\n");
	}

	else if (strncmp("disablePA", command, 8) == 0)
	{
		disablePA(txStatus);
		printUSB("> PA Disabled \r\n");
	}

	else if (strncmp("status", command, 6) == 0)
	{
		if (strncmp("verbose", args[0], 7) == 0)
		{
			args[0][0] = (int32_t) "";
			max2871PrintStatus(VERBOSE,max2871Status);
		}
		else
			max2871PrintStatus(nVERBOSE,max2871Status);

		txChainPrintStatus(txStatus);

		readAD8302vRef(receiverStatus);
		sprintf((char *)txStr, "> AD8302 VREF = %0.3f, VDELTA = %0.3f\n", receiverStatus->refVoltage, receiverStatus->refDelta);
		printUSB(txStr);

	}

	else if (strcmp("outputLevelTest", command) == 0)
	{
		outputLevelTest(atof(args[0]), atof(args[1]), atof(args[2]), &max2871Status, &txStatus);
	}

	else if (strcmp("powerDetectorCal", command) == 0)
	{
		powerDetectorCal(atof(args[0]), &max2871Status, &txStatus);
	}

	else if (strncmp("inputSwitch", command, 11) == 0)
	{
		if (strncmp("off", args[0], 3) == 0)
		{
			setInputSwitch(SWITCH_OFF, &receiverStatus);
		}
		else if (strncmp("thru", args[0], 4) == 0)
		{

			setInputSwitch(SWITCH_THROUGH, &receiverStatus);
		}
		else if (strncmp("rev", args[0], 3) == 0)
		{

			setInputSwitch(SWITCH_REV, &receiverStatus);
		}
		args[0][0] = (int32_t) "";
	}

	else if (strncmp("WHOAMI", command, 6) == 0)
	{
		printUSB("> Josh's VNA\r\n");
	}

	else if ((strncmp("ls", command, 2) == 0) || (strncmp("help", command, 4) == 0))
	{
		printUSB((char *)"> --  Available Commands  --\r\n");
		printUSB((char *)"> sigGen(frequency, power)\r\n");
		printUSB((char *)"> sweep(startFreq, stopFreq, numSteps, power, time)\r\n");
		printUSB((char *)"> measure(Sxx,startFreq,stopFreq,numSteps,power)\r\n");
		printUSB((char *)"> setEcal({short,open,load,thru}\r\n");
		printUSB((char *)"> status(verbose)\r\n");
		printUSB((char *)"> WHOAMI\r\n");
		printUSB((char *)"> Use the below at your own risk:\r\n");
		printUSB((char *)"> setFilter(filterNum OR frequency)\r\n");
		printUSB((char *)"> setMaxPower(power(dBm))\r\n");
		printUSB((char *)"> setAttenuation(atten(dB))\r\n");
		printUSB((char *)"> enableRF\r\n");
		printUSB((char *)"> disableRF\r\n");
		printUSB((char *)"> enablePA\r\n");
		printUSB((char *)"> disablePA\r\n");
		printUSB((char *)"> inputSwitch({off,thru,rev})\r\n");
	}
	else
	{
		printUSB("> Not found, try again\r\n");
		sprintf((char *)txStr, "> %s\n", command);
		printUSB(txStr);

	}

}
