/*
 * main.cpp
 *
 *  Created on: 20 февр. 2014 г.
 *      Author: g.kruglov
 */

#include "main.h"
#include "Sequences.h"
#include "led.h"

App_t App;
LedSmoothMany_t Leds;

int main(void) {
    // ==== Setup clock frequency ====
//    Clk.SetupFlashLatency(2);  // Setup Flash Latency for clock in MHz
//    Clk.SetupBusDividers(ahbDiv4, apbDiv1);
    Clk.UpdateFreqValues();

    // Init OS
    halInit();
    chSysInit();

    // ==== Init hardware ====
    PinSetupOut(GPIOB, 1, omPushPull);
    PinSetupOut(GPIOA, 6, omPushPull);
    PinSet(GPIOA, 6);
    PinSetupOut(GPIOA, 7, omPushPull);
    PinSet(GPIOA, 7);

    Uart.Init(115200, UART_GPIO, UART_TX_PIN);
    Uart.Printf("\r%S %S\r", APP_NAME, APP_VERSION);
//    Uart.PrintfNow("\rogo");
//    Clk.PrintFreqs();

//    App.InitThread();
    // LEDs
//    Leds.Ch[0].Init(LED0_GPIO, LED0_PIN, TIM_LED0, TIMC_LED0);
//    Leds.Ch[1].Init(LED1_GPIO, LED1_PIN, TIM_LED1, TIMC_LED1);
//    Leds.Ch[2].Init(LED2_GPIO, LED2_PIN, TIM_LED2, TIMC_LED2);
//
//    Leds.Ch[0].Set(1);
//    Leds.Ch[1].Set(4);
//    Leds.Ch[2].Set(7);


    // Main cycle
    App.ITask();
}

__attribute__ ((__noreturn__))
void App_t::ITask() {
    while(true) {
//        chThdSleepMilliseconds(900);
        PinToggle(GPIOA, 6);
//        Uart.PrintfNow("Aga\r");
//        uint32_t EvtMsk = chEvtWaitAny(ALL_EVENTS);
//        if(EvtMsk & EVTMSK_UART_NEW_CMD) {
//            OnCmd((Shell_t*)&Uart);
//            Uart.SignalCmdProcessed();
//        }

    } // while true
}

#if 0 // ======================= Command processing ============================
void App_t::OnCmd(Shell_t *PShell) {
	Cmd_t *PCmd = &PShell->Cmd;
    __attribute__((unused)) int32_t dw32 = 0;  // May be unused in some configurations
    Uart.Printf("\r%S\r", PCmd->Name);
    // Handle command
    if(PCmd->NameIs("Ping")) PShell->Ack(OK);

    else PShell->Ack(CMD_UNKNOWN);
}

#endif
