@echo off
REM script to set hardlink for EGS config files
IF [%1] EQU [-h] GOTO HELP
IF [%1] EQU [-H] GOTO HELP
SetLocal EnableDelayedExpansion

:DEFAULT
SET msg=
FOR /f "delims=" %%G in (files_link.txt) DO (
	for /f "skip=1 delims=" %%i in ('fsutil hardlink list %%G') do (set "msg=%%G ==> %%i" & echo !msg!)
)
REM FOR /f "delims=" %%G in (files_link.txt) DO for /f "skip=1 delims=" %%i in ('fsutil hardlink list %%G') do "%%G ==> %%i"
goto DONE

:HELP
echo "Hardlink Link reader script"
echo "Parameters : -h = help"
goto DONE
:DONE
