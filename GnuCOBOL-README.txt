
		                 GnuCOBOL
		https://sourceforge.net/projects/open-cobol
		https://savannah.gnu.org/projects/gnucobol

GnuCOBOL is a free (like both in "free speech" and in "free beer")
COBOL compiler, formerly known as OpenCOBOL.
It implements a substantial part of the COBOL 85, COBOL 2002 and
COBOL 2014 standards, as well as many extensions.

GnuCOBOL translates COBOL into C and compiles the translated code
using the native C compiler on various platforms, including Unix/Linux,
Mac OS X, and Microsoft Windows. 

Although many have participated, most development thanks go to

    Roger While
    Keisuke Nishida

This package contains the following sub-directories:

    bin         GnuCOBOL driver programs and Runtime library
    config      GnuCOBOL Configuration files
    copy	COBOL copybooks
    extras	Sample COBOL programs 
    include	C header files for the GnuCOBOL compiler
    lib         The MinGW GnuCOBOL Compiler routines
    libexec     The MinGW GnuCOBOL install routines

All programs except those in lib and libexec are distributed under
the GNU General Public License.  See COPYING.txt for details.

Programs in lib and libexec are distributed under the GNU Lesser
General Public License.  See COPYING_LESSER.txt for details.

See AUTHORS for the author of each file.

This MinGW GnuCOBOL 2.0 Release Candidate 2 package was built with 
the following components as a ready to run Windows install: 

MinGW/MSYS - Minimalist GNU for Windows (GCC 5.3.0)
GNU Multiple-Precision Arithmetic package (gmplib 6.1.1)
PDCurses 3.4 - used for screen read and write.
Berkeley Database (BDB) db-6.2.23.NC from Oracle 
GnuCOBOL 2.0 Release Candidate 2 (06-Nov-2016) source code from the 
    OpenCOBOL project on Sourceforge.net

GnuCOBOL runs in a CMD.EXE window and translates COBOL source code into
C code, which is then compiled by the GCC compiler.  

There is a free OpenCOBOLIDE Graphical User Interface (GUI) for compiling 
GnuCOBOL programs in Windows.  The OpenCOBOLIDE install package can 
be downloaded from this site:

https://launchpad.net/cobcide/4.0/4.7.4/+download/OpenCobolIDE-4.7.4_Setup.exe

Additional information about the OpenCOBOLIDE Graphical User Interface 
for GnuCOBOL can be found here:

http://opencobolide.readthedocs.io/en/latest/download.html

OpenCOBOLIDE for Windows includes an embedded copy of GnuCOBOL 1.1, 
but the user can change the Preferences to point to a different 
GnuCOBOL compiler.  OpenCOBOLIDE can be set to use GnuCOBOL 2.0 
Release Candidate 2 installed on the same Windows computer. 

If you prefer to compile COBOL programs in a CMD.EXE window, you can 
refer to "gcx.cmd" and "testGC.cmd" for examples.  The "set_env.cmd" 
file is used to allocate temporary environment variables and update the 
Windows PATH for GnuCOBOL compiles.    

The "GnuCOBOL 2.0 Manual.pdf" included in this package is also available 
from the GnuCOBOL sourceforge website:

http://open-cobol.sourceforge.net/doc/gnucobol.pdf

There is a very large GnuCOBOL 2.0 Programmer's guide (640 pages) 
which can be downloaded from the "GnuCOBOL Guides" page on the 
GnuCOBOL sourceforge website:

http://open-cobol.sourceforge.net/

There are several different manuals available at the link above, 
in both A4 or USA formats, and new manuals will be published to 
the same address.  

This README.txt file was last updated on Sunday, 04 December 2016,
by Arnold J. Trembley.

    arnold.trembley@att.net
