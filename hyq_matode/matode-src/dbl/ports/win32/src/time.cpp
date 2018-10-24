/*
 * Source: http://social.msdn.microsoft.com/Forums/en-US/vcgeneral/thread/430449b3-f6dd-4e18-84de-eebd26a8d668/
 */

#include < time.h >
#include <windows.h> //I've ommited this line.

#include "win32_compat.h"

#if defined(_MSC_VER) || defined(_MSC_EXTENSIONS)
  #define DELTA_EPOCH_IN_MICROSECS  11644473600000000Ui64
#else
  #define DELTA_EPOCH_IN_MICROSECS  11644473600000000ULL
#endif
 
int gettimeofday(struct timeval *tv, struct timezone *tz)
{
  FILETIME ft;
  unsigned __int64 tmpres = 0;
  static int tzflag;
 
  if (NULL != tv)
  {
    GetSystemTimeAsFileTime(&ft);
 
    tmpres |= ft.dwHighDateTime;
    tmpres <<= 32;
    tmpres |= ft.dwLowDateTime;
 
    tmpres /= 10;  /*convert into microseconds*/

	/*converting file time to unix epoch*/
    tmpres -= DELTA_EPOCH_IN_MICROSECS; 
    tv->tv_sec = (long)(tmpres / 1000000UL);
    tv->tv_usec = (long)(tmpres % 1000000UL);
  }
 
  if (NULL != tz)
  {
    if (!tzflag)
    {
      _tzset();
      tzflag++;
    }
    tz->tz_minuteswest = _timezone / 60;
    tz->tz_dsttime = _daylight;
  }
 
  return 0;
}

int clock_gettime(clockid_t clk_id, struct timespec *tp)
{
	struct timeval tv;
	int ret;

	if ((ret = gettimeofday(&tv, NULL)))
		return ret;

	tp->tv_sec = tv.tv_sec;
	tp->tv_nsec = tv.tv_usec * 1000;

	return 0;
}

void usleep(int useconds)
{
	Sleep(useconds / 1000);
}
