/*
 * Vibro.cpp
 *
 *  Created on: 26 но€б. 2015 г.
 *      Author: Kreyl
 */

#include <Vibro.h>
#include "kl_lib.h"
#include "Sequences.h"

void Vibro_t::Init(GPIO_TypeDef *APGpio, uint16_t APin) {
    PGpio = APGpio;
    Pin = APin;
    PinSetupOut(APGpio, APin, omPushPull);
}

//void Vibro_t::Task() {
//    if(IsOn) {
//        if(TimeElapsed(&IDelayVar, Seq[SeqIndx].OnTime)) {
//            // Time to Off
//            Off();
//            IsOn = false;
//        }
//    }
//    else { // Is off
//        if(TimeElapsed(&IDelayVar, Seq[SeqIndx].OffTime)) {
//            // Time to On
//            On();
//            IsOn = true;
//            // move to next chunk
//            SeqIndx++;
//            if(SeqIndx >= SEQ_CNT) SeqIndx = 0;
//        }
//    }
//}
