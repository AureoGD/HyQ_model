/*
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

#ifndef STOPWATCH_HPP_
#define STOPWATCH_HPP_

#include <SystemTimer.hpp>


class Stopwatch
{
private:
	SystemTimer::TimeStamp_t		_ts1;
	SystemTimer::TimeStamp_t		_ts2;
	SystemTimer::TimeInterval_t		_interval;

	typedef enum 
	{
		STOPPED,
		STARTED
	} TIMER_STATE;

public:
	Stopwatch()  : _ts1(0), _ts2(0), _interval(0)
	{
		// empty
//#ifdef __XENO__
//		printf("using Xenomai timers.\n");
//#else
//		printf("using posix timers.\n");
//#endif
	}


	~Stopwatch() 
	{
		// empty
	}


	/**
	 * Starts measuring time.
	 */
	void start()
	{
		_ts1 = SystemTimer::value();
	}


	/**
	 * Stops the measurement of time.
	 * 
	 * @return			The amount of time passed.
	 */
	SystemTimer::TimeInterval_t stop()
	{
		// save stamp
		_ts2 = SystemTimer::value();
		// calc time measured untill now
		_interval += (_ts2 - _ts1);
		// return it
		return _interval;
	}


	/**
	 * @return			The amount of time passed.
	 */
	SystemTimer::TimeInterval_t elapsed()
	{
		return _interval;
	}


	/**
	 * Returns stopwatch to its initial state.
	 */
	void reset()
	{
		// clear everything
		_ts1 = 0;
		_ts2 = 0;
		_interval = 0;
	}


	/**
	 * Returns the current value of the stopwatch. the stopwatch should be started at this point
	 */
	SystemTimer::TimeStamp_t value()
	{
		return _interval + (SystemTimer::value() - _ts1);
	}


	/**
	 * @return			The amount of time between the given timestamp and the current time.
	 */
	static SystemTimer::TimeInterval_t since(const SystemTimer::TimeStamp_t& stamp)
	{
		return static_cast<SystemTimer::TimeInterval_t>(SystemTimer::value() - stamp);
	}

};

#endif /*ISTOPWATCH_H_*/
