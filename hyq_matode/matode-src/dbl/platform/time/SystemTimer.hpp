/*
 *    Timing services. Depending on defines this compiles for Xenomai or Posix.
 *    
 *    Copyright (C) 2012 G.A. vd. Hoorn
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

#ifndef SYSTEMTIMER_HPP_
#define SYSTEMTIMER_HPP_

#include <stdint.h>

#ifdef __XENO__
#include <native/timer.h>
#else
#include <time.h>
#endif

class SystemTimer
{
public:
	/**
	 * Type that stores a certain point in time. Unsigned, since we don't expect
	 * to deal with negative time.
	 */
	typedef uint64_t TimeStamp_t;


	/**
	 * Type that stores a certain 'quantity' of time. Signed, since by subtracting
	 * two timestamps, it is possible to end up with negative results.
	 */
	typedef int64_t TimeInterval_t;


protected:
	SystemTimer() {}


public:
	virtual ~SystemTimer() {}


	/**
	 * NB: on platforms where there is no clock with a nanosecond resolution
	 * this returns whatever resolution is available, scaled to nanoseconds.
	 * For instance: microsecond resolution available -> return current_value * 1000.
	 * 
	 * @todo in the case of xenomai, we should make sure the timer is in aperiodic mode
	 * 
	 * @return	Current value of the timer in nanoseconds.
	 */
	static TimeStamp_t value()
	{
		TimeStamp_t stamp = 0;
#ifdef __XENO__
		stamp = rt_timer_read();
#else
		// do clock_gettime magic
		struct timespec tstamp;
		clock_gettime(CLOCK_REALTIME, &tstamp);
		// convert to nanos
		stamp = static_cast<TimeStamp_t>((tstamp.tv_sec * 1e9) + tstamp.tv_nsec);
#endif
		return stamp;
	}


	/**
	 * Note: this method uses SystemTimer::value() so it is limited to the
	 * precision of the clock that SystemTimer::value() uses.
	 * 
	 * @return		The current global system time in nanoseconds.
	 */
	static double nanos()
	{
		return static_cast<double>(SystemTimer::value());
	}


	/**
	 * Note: this method uses SystemTimer::value() so it is limited to the
	 * precision of the clock that SystemTimer::value() uses.
	 * 
	 * @return		The current global system time in microseconds.
	 */
	static double micros()
	{
		return static_cast<double>(SystemTimer::value() / 1e3);
	}


	/**
	 * Note: this method uses SystemTimer::value() so it is limited to the
	 * precision of the clock that SystemTimer::value() uses.
	 * 
	 * @return		The current global system time in milliseconds.
	 */
	static double millis()
	{
		return static_cast<double>(SystemTimer::value() / 1e6);
	}


	/**
	 * Note: this method uses SystemTimer::value() so it is limited to the
	 * precision of the clock that SystemTimer::value() uses.
	 * 
	 * @return		The current global system time in seconds.
	 */
	static double seconds()
	{
		return static_cast<double>(SystemTimer::value() / 1e9);
	}
};

#endif /*SYSTEMTIMER_HPP_*/