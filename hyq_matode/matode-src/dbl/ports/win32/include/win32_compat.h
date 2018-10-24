/*
 *    DBL repository win32 compatibility wrapper
 *    Copyright (C) 2012 Wouter Caarls
 *
 *    This program is free software: you can redistribute it and/or modify
 *    it under the terms of the GNU Lesser General Public License as published by
 *    the Free Software Foundation, either version 3 of the License, or
 *    (at your option) any later version.
 *
 *    This program is distributed in the hope that it will be useful,
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *    GNU Lesser General Public License for more details.
 *
 *    You should have received a copy of the GNU Lesser General Public License
 *    along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#pragma once

#define NOMINMAX

#include <pthread.h>

typedef int clockid_t;

#define CLOCK_REALTIME 0

struct timezone 
{
  int  tz_minuteswest; /* minutes W of Greenwich */
  int  tz_dsttime;     /* type of dst correction */
};
 
int gettimeofday(struct timeval *tv, struct timezone *tz);
int clock_gettime(clockid_t clk_id, struct timespec *tp);
void usleep(int useconds);

#define snprintf _snprintf
#ifndef strcasecmp
#define strcasecmp _strcmpi
#endif

#ifndef M_PI
	#define M_PI 3.14159265358979323846
#endif

#define __glibcxx_function_requires(...)
#define __glibcxx_class_requires(_a,_b)
#define __glibcxx_class_requires2(_a,_b,_c)
#define __glibcxx_class_requires3(_a,_b,_c,_d)
#define __glibcxx_class_requires4(_a,_b,_c,_d,_e)
#define _GLIBCXX_DEBUG_ASSERT(_Condition)
#define _GLIBCXX_DEBUG_PEDASSERT(_Condition)
#define _GLIBCXX_DEBUG_ONLY(_Statement) ;
#define __glibcxx_requires_cond(_Cond,_Msg)
#define __glibcxx_requires_valid_range(_First,_Last)
#define __glibcxx_requires_sorted(_First,_Last)
#define __glibcxx_requires_sorted_pred(_First,_Last,_Pred)
#define __glibcxx_requires_partitioned(_First,_Last,_Value)
#define __glibcxx_requires_partitioned_pred(_First,_Last,_Value,_Pred)
#define __glibcxx_requires_heap(_First,_Last)
#define __glibcxx_requires_heap_pred(_First,_Last,_Pred)
#define __glibcxx_requires_nonempty()
#define __glibcxx_requires_string(_String)
#define __glibcxx_requires_string_len(_String,_Len)
#define __glibcxx_requires_subscript(_N)

# define __ASSERT_FUNCTION __FUNCTION__

#ifdef DEBUG
#define __assert_fail(assertion, file, line, function) _wassert(_CRT_WIDE(assertion), _CRT_WIDE(file), line)
#else
#define __assert_fail(assertion, file, line, function)
#endif

