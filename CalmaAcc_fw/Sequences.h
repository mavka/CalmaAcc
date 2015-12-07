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
            union {
                uint32_t Smooth;
                uint32_t Tag;
            };
        };
        uint32_t Indx;
        uint32_t Time_ms;
    };
    VibroState_t VibroState;
};

#define SMOOTH_VAR  9
#define TAG_NONE    0
#define TAG_ACC     999

static const Seq_t Seq[] = {
        {stSet, 100,   SMOOTH_VAR, VibroOn},
        {stSet, 0,     SMOOTH_VAR, VibroOff},
        {stWait, 180,  TAG_ACC},
        {stSet, 100,   SMOOTH_VAR, VibroOn},
        {stSet, 0,     SMOOTH_VAR, VibroOff},
        {stWait, 1800, TAG_NONE},
        {stGoto, 0}
};

// ================================= Setup =====================================
#define ACC_TOLERANCE   5400
#define ACC_G           504

struct AccSeq_t {
    int16_t a[3];
};

static const AccSeq_t SwitchSeq[] = {
        {ACC_G, 0,     0},
        {0,     ACC_G, 0},
        {ACC_G, 0,     0},
};
#define SWITCH_SEQ_LEN  3

#endif /* SEQUENCES_H_ */
