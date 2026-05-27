@echo off
setlocal enabledelayedexpansion
set "savesdir=TR_SAVE"
echo What slot to backup the current save into?
echo type 0 to make a new slot
echo.
for /d %%a in ("%savesdir%\*") do echo %%~nxa
echo.
echo reminder: type the slot name EXACTLY as is written above
set /p "choice=type your choice now: "
echo.
if "%choice%"=="0" goto :makenew
set "selected=%savesdir%\%choice%"
if not exist "%selected%" (
    echo The slot %choice% is not valid. if you wanted to make this slot,create one with this name in the main menu by typing 0
    pause
    exit /b
)
echo backing up save into %selected% now
copy "*.dat" "%selected%\" >nul
echo.
echo.
echo The current save has been backed up in the slot %selected%
echo your save does not automatically back up once you make more progress
echo if you want an updated backup: please remember to backup each time you play
pause
exit /b



:makenew
echo Please type the name of the slot you want to create. do not use invalid chars
set /p "newname=type new slot's name: "
if "%newname%"=="" (
    echo Incorrect name:%newname%
    pause
    exit /b
)
set "newfolder=%savesdir%\%newname%"
if exist "%newfolder%" (
    echo This slot already extists: %newname%
    pause
    exit /b
)
mkdir "%newfolder%"
copy "*.dat" "%newfolder%\" >nul
echo new slot was created, it is named %newname%
echo To back up your save into the new slot, open Savedata-BackUp again
pause
exit /b