/*
 * Sequences.h
 *
 *  Created on: 26 но€б. 2015 г.
 *      Author: Kreyl
 */

#ifndef SEQUENCES_H_
#define SEQUENCES_H_

enum SeqType_t {stSet, stWait, stGoto};
enum VibroState_t {VibroOn, VibroOff};

struct Seq_t {
    SeqType_t Type;
    union {
        struct {
            uint32_t Brightness;
            uint32_t Smooth;
        };
        uint32_t Indx;
        uint32_t Time_ms;
    };
    VibroState_t VibroOn;
};

#define SMOOTH_VAR  18

static const Seq_t Seq[] = {
        {stSet, 100, SMOOTH_VAR, VibroOn},
        {stSet, 0,   SMOOTH_VAR, VibroOff},
        {stWait, 200},
        {stSet, 100, SMOOTH_VAR, VibroOn},
        {stSet, 0,   SMOOTH_VAR, VibroOff},
        {stWait, 1800},
        {stGoto, 0}
};



#endif /* SEQUENCES_H_ */
