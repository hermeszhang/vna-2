#ifndef TXCHAIN_H_
#define TXCHAIN_H_

// SDADC values
#define VREF 				3.3 * 2 // Attenuating the signal by 2, so double VREF
#define NUM_STATES_16_BIT	65536

// Attenuator
#define MAX_ATTENUATION 	31.5
#define MIN_ATTENUATION 	0
#define STEP_ATTENUATION	0.5

extern struct MAX2871Struct max2871Status;

typedef struct txStruct{
	float measOutputPower;
	float setOutputPower;
	float attenuation;
	uint8_t filter;
	uint8_t pa_pdwn;
}txStruct;

void sweep(float lowerFreq, float higherFreq, float numSteps, float power, float sweepTime, struct MAX2871Struct *max2871Status, struct txStruct *txStatus);
void setFrequency(float frequency, struct MAX2871Struct *max2871Status, struct txStruct *txStatus);
void sigGen(float frequency, float power, struct MAX2871Struct *max2871Status, struct txStruct *txStatus);
void setOutputPower(float setPower, struct MAX2871Struct *max2871Status, struct txStruct *txStatus);
void txChainInit(struct MAX2871Struct *max2871Status, struct txStruct *txStatus);
int8_t setFilter(float frequency);
void setAttenuation(float atten, struct txStruct *txStatus);
float readAD8319(struct txStruct *txStatus);
void enablePA(struct txStruct *txStatus);
void disablePA(struct txStruct *txStatus);
void txChainPrintStatus(struct txStruct *txStatus);
void outputLevelTest(float startFreq, float stopFreq, float numSteps, struct MAX2871Struct *max2871Status, struct txStruct *txStatus);
void powerDetectorCal(float deltaAtten, struct MAX2871Struct *max2871Status, struct txStruct *txStatus);

#endif
