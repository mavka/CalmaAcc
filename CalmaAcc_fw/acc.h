/*
 * acc.h
 *
 *  Created on: 02.03.2013
 *      Author: kreyl
 */

#ifndef ACC_H_
#define ACC_H_

#include "kl_lib.h"

#define ACC_ADDR    0x1C

class i2c_t {
private:
    GPIO_TypeDef *GPIO;
    uint16_t Scl, Sda;
    // Pin operations
    void SclHi()    { PinSet  (GPIO, Scl); }
    void SclLo()    { PinClear(GPIO, Scl); }
    void SdaHi()    { PinSet  (GPIO, Sda); }
    void SdaLo()    { PinClear(GPIO, Sda); }
    bool SclIsHi()  { return PinIsSet(GPIO, Scl); }
    bool SdaIsHi()  { return PinIsSet(GPIO, Sda); }
    // Delay
    void ILoop(volatile uint32_t lp) { while(lp--); }
    void IDelay() { ILoop(2); }
    // i2c operations
    uint8_t Start();
    void Stop();
    void WriteByte(uint8_t b);
    bool IsAcked();
    uint8_t ReadByte();
    void Ack();
    void Nack();
public:
    void Init(GPIO_TypeDef *PGPIO, uint16_t AScl, uint16_t ASda);
    uint8_t WriteBuf(uint8_t Addr, uint8_t *PW, uint16_t SzW);
    uint8_t WriteReadBuf(uint8_t Addr, uint8_t *PW, uint16_t SzW, uint8_t *PR, uint16_t SzR);
};

class SingleAcc_t {
private:
    i2c_t i2c;
    GPIO_TypeDef *GPIO;
    uint16_t Scl, Sda, Irq;
public:
    bool IsOperational;
    int16_t a[3];
    void SetPortAndPins(GPIO_TypeDef *PGPIO, uint16_t AScl, uint16_t ASda, uint16_t AIrq) {
        GPIO = PGPIO;
        Scl = AScl;
        Sda = ASda;
        Irq = AIrq;
    }
    void Init();
    void ReadAccelerations();
};

#define ACC_CNT     6

// Registers addresses
#define ACC_REG_STATUS          0x00
#define ACC_REG_OUT_X_MSB       0x01
#define ACC_REG_XYZ_DATA_CFG    0x0E
#define ACC_FF_MT_CFG           0x15
#define ACC_FF_MT_SRC           0x16
#define ACC_FF_MT_THS           0x17
#define ACC_REG_CONTROL1        0x2A

void AccInit();

extern SingleAcc_t Acc;

#endif /* ACC_H_ */
