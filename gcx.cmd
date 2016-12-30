@ECHO OFF
rem CLS 
echo.
echo ************************************************************************
echo * Compile a GnuCOBOL program - by Arnold Trembley, 2016-08-25.         *
echo * This .CMD file will install non-persistent GnuCOBOL Environment      *
echo * Variables and PATH for Windows XP and higher.  Then compile the      *
echo * COBOL source program passed as the initial parameter:  "gcx bintest" *
echo * NOTE:  This .CMD file can only be executed in the directory where    *
echo * the GnuCOBOL compiler is installed.  An .EXE file will be created.   *
echo ************************************************************************
if exist %temp%\%1.exe erase %temp%\%1.exe 
if exist %temp%\%1.lst erase %temp%\%1.lst

REM pause 
echo call %~dp0\set_env.cmd
call %~dp0\set_env.cmd

if exist .\%1.COB goto COMPILECOB
if exist .\%1.CBL goto COMPILECBL
echo.
echo COBOL source code file "%1.cob" or "%1.cbl" 
echo not found in this directory.  
echo No compilation will occur. 
exit /b 1 

goto ALLDONE

:COMPILECOB
echo.
echo Compile the fixed-format "%1" program as executable main program (-x),
echo enable most warnings (-W), with no binary truncation (-fnotrunc) 
echo. 
echo cobc -x -W -fnotrunc -t %temp%\%1.lst -o %temp%\%1.exe %1.cob 
echo. 
cobc -x -W -fnotrunc -t %temp%\%1.lst -o %temp%\%1.exe %1.cob  
echo.
echo GnuCOBOL Compile Returncode = %errorlevel%
GOTO ALLDONE

:COMPILECBL
echo.
echo Compile the fixed-format "%1" program as executable main program (-x),
echo enable most warnings (-W), with no binary truncation (-fnotrunc) 
echo. 
echo cobc -x -W -fnotrunc -t %temp%\%1.lst -o %temp%\%1.exe %1.cbl 
echo. 
cobc -x -W -fnotrunc -t %temp%\%1.lst -o %temp%\%1.exe %1.cbl  
echo.
echo GnuCOBOL Compile Returncode = %errorlevel%
GOTO ALLDONE

:ALLDONE
if exist %temp%\%1.exe copy %temp%\%1.exe .\
if exist %temp%\%1.lst copy %temp%\%1.lst .\
if exist %temp%\%1.exe erase %temp%\%1.exe 
if exist %temp%\%1.lst erase %temp%\%1.lst

echo.
