/*
 * Vibro.h
 *
 *  Created on: 26 но€б. 2015 г.
 *      Author: Kreyl
 */

#ifndef VIBRO_H_
#define VIBRO_H_

#include "stm32f042x6.h"
#include "stm32f0xx_hal.h"
#include "kl_lib.h"

class Vibro_t {
private:
    GPIO_TypeDef *PGpio;
    uint16_t Pin;
    uint32_t IDelayVar = 0, IDelay = 0;
    uint32_t SeqIndx = 0; // Sequence indx
    bool IsOn = false;
    void On() { PinSet(PGpio, Pin); }
    void Off() { PinClear(PGpio, Pin); }
public:
    void Init(GPIO_TypeDef *APGpio, uint16_t APin);
    void Task();
};

#endif /* VIBRO_H_ */
