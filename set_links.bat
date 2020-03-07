@echo off
REM script to set hardlink for EGS config files
IF [%1] EQU [-h] GOTO HELP
IF [%1] EQU [-H] GOTO HELP
IF [%1] EQU [] GOTO DEFAULT
IF [%1] EQU [-v] GOTO DEFAULT
IF [%1] EQU [-V] GOTO DEFAULT
:SOMENAME
echo "We will now set the config to point to %1"
SET TARGET=%1
FOR /f "delims=" %%G in (files_link.txt) DO echo "makelink for %TARGET%\%%G" & del %%G & mklink /H %%G %TARGET%\%%G
goto DONE

:DEFAULT
echo "We will now set the config to point to default/vanilla"
SET TARGET=VANILLA
FOR /f "delims=" %%G in (files_link.txt) DO echo "makelink for %TARGET%\%%G" & del %%G & mklink /H %%G %TARGET%\%%G
goto DONE

:HELP
echo "Link setting script"
echo "Parameters : -h = help"
echo "             -v = (default) set vanilla configuration (run this and then check files/update)
echo "             <somename> = point to files in the <somename> folder"
goto DONE
:DONE
