
		                 GnuCOBOL
		http://sourceforge.net/projects/open-cobol/

		http://opencobol.add1tocobol.com/gnucobol
		         http://www.opencobol.org/

GnuCOBOL is a free COBOL compiler, which translates COBOL
programs to C code and compiles it using a native C compiler.

Although many have participated, most development thanks go to

    Roger While
    Keisuke Nishida

This package (MinGW based) is intended for testing purposes on Windows systems
and has everything needed to run the compiler and runtime, including GCC 4.8.1
as C compiler.
Other components are BDB 6.1.23, PDcurses 3.4, MPIR 2.7.0 (gmpcompat, without
any processor optimization).

It is NOT optimized and has some minor bugs other binaries created from the
source tarball don't have.

Important: See BUGS.txt for known issues in this distribution!

For running GnuCOBOL simply open a command prompt and call set_env.cmd in this
folder once. You can use cobc/cobcrun in the command prompt afterwards.
