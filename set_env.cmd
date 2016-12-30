@echo off

echo.
echo Setting environment for GnuCOBOL 2.0 RC-2 with MinGW binaries
echo (GCC 5.3.0, PDcurses 3.4, GMP 6.1.1, BDB 6.2.23.NC)

:: Check if called already
:: if yes, check if called from here - exit, in any other case 
:: raise warning and reset env vars
if not "%COB_MAIN_DIR%" == "" (
	echo.
	if "%COB_MAIN_DIR%" == "%~dp0" (
	   echo Information: batch was called already from "%COB_MAIN_DIR%"
	   echo              skipping environment setting...
	   goto :cobcver
	) else (
	   echo Warning: batch was called before from "%COB_MAIN_DIR%"
	   echo          resetting COB_CFLAGS, COB_LDFLAGS 
	   set COB_CFLAGS=
	   set COB_LDLAGS=
	)
)

:: Get the main dir from the batch's position 
:: (only works in Windows NT environments or higher)
set COB_MAIN_DIR=%~dp0

:: settings for cobc
set COB_CONFIG_DIR=%COB_MAIN_DIR%config
set COB_COPY_DIR=%COB_MAIN_DIR%copy
set COB_CFLAGS=-I"%COB_MAIN_DIR%include" %COB_CFLAGS%
set COB_LDFLAGS=-L"%COB_MAIN_DIR%lib" %COB_LDFLAGS%

:: settings for libcob
rem the following won't work in GnuCOBOL 2.0 if there are spaces in COB_MAIN_DIR
set COB_LIBRARY_PATH=%COB_MAIN_DIR%extras

:: Add the bin path of GnuCOBOL (including GCC) to PATH for further references
set PATH=%COB_MAIN_DIR%bin;%PATH%

:: Compiler version output
:cobcver
echo.
cobc --version
