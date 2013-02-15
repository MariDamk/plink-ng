#ifndef __WDIST_CALC_H__
#define __WDIST_CALC_H__

#include "wdist_common.h"

double chiprob_p(double xx, double df);

double fisher22(uint32_t m11, uint32_t m12, uint32_t m21, uint32_t m22);

double fisher23(uint32_t m11, uint32_t m12, uint32_t m13, uint32_t m21, uint32_t m22, uint32_t m23);

#endif
