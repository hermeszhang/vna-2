#ifndef MAX2871_H
#define MAX2871_H

typedef struct MAX2871Struct{
	uint8_t CHIP_EN;
	uint8_t	ldState;
	float 	frequency;
	uint8_t RFA_EN;
	uint8_t RF_CHIP_EN;
	uint8_t rfPower;
	uint8_t intN_nFracN;
}MAX2871Struct;

extern void max2871Setup(struct MAX2871Struct *max2871Status);
extern void max2871SpiWrite(uint32_t r);
extern uint32_t max2871SpiRead(void);
extern void max2871WriteRegisters(void);
extern float max2871SetFrequency(float mhz, uint8_t intN, struct MAX2871Struct *max2871Status);
extern void max2871ChipEnable(struct MAX2871Struct *max2871Status);
extern void max2871ChipDisable(struct MAX2871Struct *max2871Status);
extern void max2871RFEnable(struct MAX2871Struct *max2871Status);
extern void max2871RFDisable(struct MAX2871Struct *max2871Status);
extern int8_t max2871SetPower(int8_t dbm, struct MAX2871Struct *max2871Status);
extern void max2871PrintRegisters(void);
extern void max2871CheckLD(struct MAX2871Struct *max2871Status);
extern void max2871PrintStatus(struct MAX2871Struct *max2871Status);
extern void setFrequncyUSB(struct MAX2871Struct *max2871Status);
extern void setIntFracUSB(struct MAX2871Struct *max2871Status);
extern void setMaxPowerUSB(struct MAX2871Struct *max2871Status);
extern void rfEnableDisableUSB(struct MAX2871Struct *max2871Status);
extern void max2871Sweep(float startFreq, float endFreq, float numSteps, float sweepTime, uint8_t rampUp, struct MAX2871Struct *max2871Status);
extern void max2871SweepUSB(struct MAX2871Struct *max2871Status);

#endif
