/*
 * Module: ptw32_errno.h
 *
 * Purpose:
 *      Provides a replacement for <errno.h>, with supplementary
 *      definitions for platforms which already provide their own
 *      implementation, or a complete substitute for WinCE.
 *
 * --------------------------------------------------------------------------
 *
 *      Pthreads-win32 - POSIX Threads Library for Win32
 *      Copyright(C) 1998 John E. Bossom
 *      Copyright(C) 1999-2012, 2016, Pthreads-win32 contributors
 *
 *      Homepage1: http://sourceware.org/pthreads-win32/
 *      Homepage2: http://sourceforge.net/projects/pthreads4w/
 *
 *      The current list of contributors is contained
 *      in the file CONTRIBUTORS included with the source
 *      code distribution. The list can also be seen at the
 *      following World Wide Web location:
 *      http://sources.redhat.com/pthreads-win32/contributors.html
 *
 *      This library is free software; you can redistribute it and/or
 *      modify it under the terms of the GNU Lesser General Public
 *      License as published by the Free Software Foundation; either
 *      version 2 of the License, or (at your option) any later version.
 *
 *      This library is distributed in the hope that it will be useful,
 *      but WITHOUT ANY WARRANTY; without even the implied warranty of
 *      MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *      Lesser General Public License for more details.
 *
 *      You should have received a copy of the GNU Lesser General Public
 *      License along with this library in the file COPYING.LIB;
 *      if not, write to the Free Software Foundation, Inc.,
 *      59 Temple Place - Suite 330, Boston, MA 02111-1307, USA
 *
 */
#ifndef _PTW32_ERRNO_H
#define _PTW32_ERRNO_H

/* We must ensure that the core pthreads-win32 definitions are
 * read in.
 */
#include <_ptw32.h>

#if HAVE_ERRNO_H || !(defined(_WIN32_WCE) || defined(UNDER_CE))
/* Most Win32 platforms, except for WinCE, provide their own <errno.h>,
 * so, when not compiling for WinCE, or its presence has been explicitly
 * detected during project configuration, use it.
 */
# include <errno.h>

#else
/* Compiling for WinCE: we must furnish a replacement; these error codes
 * are abstracted from MinGW.org's <errno.h>
 */
#define EPERM		1	/* Operation not permitted */
#define ENOFILE 	2	/* No such file or directory */
#define ENOENT		2
#define ESRCH		3	/* No such process */
#define EINTR		4	/* Interrupted function call */
#define EIO		5	/* Input/output error */
#define ENXIO		6	/* No such device or address */
#define E2BIG		7	/* Arg list too long */
#define ENOEXEC 	8	/* Exec format error */
#define EBADF		9	/* Bad file descriptor */
#define ECHILD		10	/* No child processes */
#define EAGAIN		11	/* Resource temporarily unavailable */
#define ENOMEM		12	/* Not enough space */
#define EACCES		13	/* Permission denied */
#define EFAULT		14	/* Bad address */
/* 15 - Unknown Error */
#define EBUSY		16	/* strerror reports "Resource device" */
#define EEXIST		17	/* File exists */
#define EXDEV		18	/* Improper link (cross-device link?) */
#define ENODEV		19	/* No such device */
#define ENOTDIR 	20	/* Not a directory */
#define EISDIR		21	/* Is a directory */
#define EINVAL		22	/* Invalid argument */
#define ENFILE		23	/* Too many open files in system */
#define EMFILE		24	/* Too many open files */
#define ENOTTY		25	/* Inappropriate I/O control operation */
/* 26 - Unknown Error */
#define EFBIG		27	/* File too large */
#define ENOSPC		28	/* No space left on device */
#define ESPIPE		29	/* Invalid seek (seek on a pipe?) */
#define EROFS		30	/* Read-only file system */
#define EMLINK		31	/* Too many links */
#define EPIPE		32	/* Broken pipe */
#define EDOM		33	/* Domain error (math functions) */
#define ERANGE		34	/* Result too large (possibly too small) */
/* 35 - Unknown Error */
#define EDEADLOCK	36	/* Resource deadlock avoided (non-Cyg) */
#define EDEADLK 	36
/* 37 - Unknown Error */
#define ENAMETOOLONG	38	/* Filename too long (91 in Cyg?) */
#define ENOLCK		39	/* No locks available (46 in Cyg?) */
#define ENOSYS		40	/* Function not implemented (88 in Cyg?) */
#define ENOTEMPTY	41	/* Directory not empty (90 in Cyg?) */
#define EILSEQ		42	/* Illegal byte sequence */

#ifndef RC_INVOKED

__PTW32_BEGIN_C_DECLS
/* Definition of errno.  For _doserrno, sys_nerr, and * sys_errlist,
 * see stdlib.h.  (FIXME: this represents the implementation which is
 * provided by MSVCRT.DLL, on all regular Windows Desktop and Server
 * platforms; we may need to provide a replacement implementation,
 * which will be suitable for WinCE).
 */
__declspec(dllimport) int __cdecl *_errno(void);
#define errno (*_errno())

__PTW32_END_C_DECLS

#endif	/* ! RC_INVOKED */
#endif	/* ! HAVE_ERRNO_H */

/* Regardless of whether or not the target platform provides its own
 * <errno.h>, we depend on several error codes which may not have been
 * defined; ensure that we provide fall-back definitions.
 */
#define __PTW32_DEFINE_ERRNO(__CODE__)  (__PTW32_ERRNO_BASE__+__CODE__)

#if __PTW32_VERSION_MAJOR > 2
# define __PTW32_ERRNO_BASE__	   (1000 - 42)
#else
/* FIXME: This matches the original pthreads-win32 v2 definitions,
 * but creates a conflict between EOWNERDEAD and EILSEQ.
 */
# define __PTW32_ERRNO_BASE__	   0
#endif

/* POSIX.1-2008 robust mutex support.
 */
#define __PTW32_EOWNERDEAD	 __PTW32_DEFINE_ERRNO( 42 )
#define __PTW32_ENOTRECOVERABLE  __PTW32_DEFINE_ERRNO( 43 )

#ifndef EOWNERDEAD
#define EOWNERDEAD		 __PTW32_EOWNERDEAD
#endif

#ifndef ENOTRECOVERABLE
#define ENOTRECOVERABLE 	 __PTW32_ENOTRECOVERABLE
#endif

#if !defined(EDEADLK)
/* This is the standard name, prescribed by POSIX.1.  MinGW.org's
 * <errno.h> already defines it, but some other platforms may not.
 */
# if defined(EDEADLOCK)
#  define EDEADLK  EDEADLOCK	/* Some older MS tools defined it thus... */
# else
#  define EDEADLK  36		/* ...while MinGW.org defines both thus. */
# endif
#endif

#if !defined(ENOTSUP)
# define ENOTSUP   48		/* This is the value in Solaris. */
#endif

#if !defined(ENOSYS)
# define ENOSYS   140		/* Semi-arbitrary value */
#endif

#if !defined(ETIMEDOUT)
/* Not normally defined in Win32 <errno.h>, but at one time it may
 * have been defined in <winsock.h>; this seems to be no longer the
 * case, but WSAETIMEDOUT may offer a suitable substitute.
 *
 * FIXME: this may be incompatible with any application which wants
 * to use <winsock2.h>
 */
# include <winsock.h>
# if !defined(ETIMEDOUT)
#  if defined(WSAETIMEDOUT)
#   define ETIMEDOUT  WSAETIMEDOUT
#  else
#   define ETIMEDOUT  10060	/* This is the value of WSAETIMEDOUT in winsock.h. */
#  endif
# endif
#endif

#endif	/* ! _PTW32_ERRNO_H_ */
