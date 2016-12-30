@ECHO OFF
CLS 
echo.
echo ************************************************************************
echo * VERIFY GnuCOBOL 2.0 install - by Arnold Trembley, 2016-08-25.        *
echo * This .CMD file will install non-persistent GnuCOBOL Environment      *
echo * Variables and PATH for Windows XP and higher.  Then the TESTFUNC.COB *
echo * program will be compiled and executed.                               *
echo * NOTE:  This .CMD file can only be executed in the directory where    *
echo * the GnuCOBOL compiler is installed.                                  *
echo ************************************************************************

if exist %temp%\testfunc.exe erase %temp%\testfunc.exe
if exist %temp%\testfunc.lst erase %temp%\testfunc.lst
REM pause 

echo.
echo current directory = %~dp0
echo call "%~dp0set_env.cmd"
call "%~dp0set_env.cmd"

echo Compile the "TESTFUNC.COB" program as executable main program (-x),
echo enable all warnings (-W), with no binary truncation (-fnotrunc) 
echo. 
echo cobc -x -W -fnotrunc -t %temp%\testfunc.lst -o %temp%\testfunc.exe testfunc.cob 
echo. 
cobc -x -Wall -fnotrunc -t %temp%\testfunc.lst -o %temp%\testfunc.exe testfunc.cob 
echo.
echo GnuCOBOL 2.0 Compile Returncode = %errorlevel%
if %errorlevel%==1 goto ALLDONE

echo.
echo Now run the "TESTFUNC.EXE" program
echo.
%temp%\TESTFUNC
echo.  
pause

:ALLDONE
if exist %temp%\testfunc.exe erase %temp%\testfunc.exe
if exist %temp%\testfunc.lst erase %temp%\testfunc.lst
echo.
