/*
 *    Copyright (C) 2012 Erik Schuitema (DBL)
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

#ifndef STATISTICS_HPP_
#define STATISTICS_HPP_

#include <sstream>

// Simple statistics class to calculate minimum, maximum, average, variance and standard deviation of doubles
class CSimpleStat
{
	protected:
		// Window filtering
		double		*mSampleBuffer;
		int			mBufLength;
		int			mBufPos;
		double		mAvgSum;
		double		mSqrSum;
		double		mMin;
		double		mMax;
		bool		mHasWrapped;	// Indicates whether we filled the buffer completely at least once yet

		// To avoid the build-up of numerical errors, every 'cycle' (wrap) of the buffer,
		// we keep shadow sums of every new cycle of the buffer.
		// When the buffer wraps, the current sums are replaced by the fresh shadow sums
		double		mAvgSumShd;
		double		mSqrSumShd;

	public:
		CSimpleStat();
		CSimpleStat(const int bufferlength);
		~CSimpleStat();
		void		setBufferLength(const int length);
		void		clear();
		void		addValue(double value);
		double		getVariance() const;
		double		getAverage() const;
		double		getStdev() const;
		double		getMinimum() const;
		double		getMaximum() const;
		void		getHistogram(int *bins, int numBins, double minVal, double maxVal) const;

		double		getBufVal(int index);	// Mainly for debugging purposes
		int			getLength() const;
		int			getNumValues() const;	// Returns the number of added values. This cannot be larger than mBufLength.
		std::string	toStr(const std::string& unitString) const;	// You can pass the units (e.g. us, ms, kg) as string

		void		resetMinMax();
};


#endif /* STATISTICS_HPP_ */
