/*
 * Module: _ptw32.h
 *
 * Purpose:
 *      Pthreads-win32 internal macros, to be shared by other headers
 *      comprising the pthreads-win32 package.
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
#ifndef __PTW32_H
#define __PTW32_H

/* See the README file for an explanation of the pthreads-win32
 * version numbering scheme and how the DLL is named etc.
 */
#define __PTW32_VERSION_MAJOR	   2
#define __PTW32_VERSION_MINOR	  10
#define __PTW32_VERSION_MICRO	   0
#define __PTW32_VERSION_BUILD	   0
#define __PTW32_VERSION 	2,10,0,0
#define __PTW32_VERSION_STRING "2, 10, 0, 0\0"

#if defined(__GNUC__)
# pragma GCC system_header
# if ! defined __declspec
#  error "Please upgrade your GNU compiler to one that supports __declspec."
# endif
#endif

#if defined (__cplusplus)
# define __PTW32_BEGIN_C_DECLS  extern "C" {
# define __PTW32_END_C_DECLS    }
#else
# define __PTW32_BEGIN_C_DECLS
# define __PTW32_END_C_DECLS
#endif

/* When building the library, __PTW32_BUILD should be defined, so that the
 * variables/functions are exported correctly.  When using the library, you
 * should NOT define __PTW32_BUILD, thus ensuring that variables/functions
 * will be imported correctly, via an appropriate __PTW32_DECLSPEC.
 */
#undef __PTW32_DECLSPEC
#undef __PTW32_USE_DLLIMPORT_DECORATION

#if defined PTW32_STATIC_LIB
/* Upstream pthreads-win32 uses this user-specified feature test to declare
 * explicitly that the pthreads library is to be linked statically; this is
 * contrary to POSIX.1's mandate that feature test names should begin with
 * an underscore character.
 */
# warning "PTW32_STATIC_LIB is deprecated; use _PTW32_STATIC_LIB."
# ifndef  _PTW32_STATIC_LIB
#  define _PTW32_STATIC_LIB  1
# endif
# undef PTW32_STATIC_LIB
#endif

#ifndef _PTW32_STATIC_LIB
/* When the intention is NOT to link statically...
 */
# if defined __PTW32_BUILD
  /* ...and when actually implementing the pthreads library, then we want
   * to explicitly identify those entities which are to be exported from
   * the pthreads DLL, which is being built.
   */
#  define __PTW32_DECLSPEC  __declspec(dllexport) __PTW32_CDECL

# elif defined _MSC_VER || defined _DLLIMPORT_DECORATED
  /* ...but, when NOT building the pthreads library, just signal that we
   * want to decorate the declarations of imported entities, either when
   * using MSVC, or the user explicitly requested it; in this case, we
   * will complete the __PTW32_DECLSPEC definition below.
   */
#  define __USE_DLLIMPORT_DECORATION  1
# endif
#endif

#ifndef __PTW32_DECLSPEC
/* We still need to complete this definition...
 */
# if __PTW32_USE_DLLIMPORT_DECORATION
  /* ...either for a pthreads DLL client which explicitly wants to, (or
   * needs to), link via explicitly decorated entity declarations...
   */
#  define __PTW32_DECLSPEC  __declspec(dllimport) __PTW32_CDECL
# else
  /* ...or for a statically linked client, (or indeed, a client which
   * wishes to support a choice between static linking, or alternatively,
   * dynamic linking via an import library).
   */
#  define __PTW32_DECLSPEC  __PTW32_CDECL
# endif
#endif

#ifndef __PTW32_CDECL
/* Nominally, we prefer to use __cdecl calling convention for all our
 * functions, but we map it through this macro alias to facilitate the
 * possible choice of alternatives; for example:
 */
# ifdef _OPEN_WATCOM_SOURCE
  /* The Open Watcom C/C++ compiler uses a non-standard default calling
   * convention, (similar to __fastcall), which passes function arguments
   * in registers, unless the __cdecl convention is explicitly specified
   * in exposed function prototypes.
   *
   * Our preference is to specify the __cdecl convention for all calls,
   * even though this could slow Watcom code down slightly.  If you know
   * that the Watcom compiler will be used to build both the DLL and your
   * application, then you may #define _OPEN_WATCOM_SOURCE, so disabling
   * the forced specification of __cdecl for all function declarations;
   * remember that this must be defined consistently, for both the DLL
   * build, and the application build.
   */
#  define __PTW32_CDECL
# else
#  define __PTW32_CDECL __cdecl
# endif
#endif

/* If the user has previously included <errno.h>, as witnessed by the
 * prior definition of EDOM, (which is chosen because it is one of only
 * three error codes required by ISO-C), then we must ensure that those
 * non-Windows error codes required by pthreads-win32, and witnessed by
 * definition of _PTW32_ERRNO_H, are also defined.
 */
#if defined EDOM && ! defined _PTW32_ERRNO_H
# include "ptw32_errno.h"
#endif

#endif	/* !__PTW32_H */
