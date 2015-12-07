/*
 * Comparator.cpp
 *
 *  Created on: 8 дек. 2015 г.
 *      Author: Kreyl
 */

#include "Comparator.h"
#include "Sequences.h"
#include "acc.h"
#include "uart.h"

Result_t Comparator_t::ProcessData() {
    // Check Timeout
    if(TimeElapsed(&IDelayVar, COMP_TIMEOUT)) {
        Stage = 0;
//        Uart.PrintfNow("1Stage=%u\r", Stage);
    }
    // Check if expected accs received
    if(IsAccAlike()) {
        Stage++;
        ResetDelayVar(&IDelayVar);
//        Uart.PrintfNow("2Stage=%u\r", Stage);
        // Check if detection done
        if(Stage >= SWITCH_SEQ_LEN) {
            Stage = 0;
            return rsltDetected;
        }
    }
    return rsltNone;
}

bool Comparator_t::IsAccAlike() {
    int32_t Sum = 0;
    for(int i=0; i < 3; i++) {
        int32_t Dif = Acc.a[i] - SwitchSeq[Stage].a[i];
        Sum += Dif * Dif;
    }
//    Uart.PrintfNow("Sum=%u\r", Sum);
    return (Sum < ACC_TOLERANCE);
}
