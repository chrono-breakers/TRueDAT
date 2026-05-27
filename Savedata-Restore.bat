@echo off
setlocal enabledelayedexpansion
set "base=%~dp0"
set "savesdir=%base%TR_SAVE"
echo REMINDER: YOU MAY WANT TO BACKUP YOUR CURRENT SAVE BEFORE RESTORING ANOTHER BACKUP
echo.
echo.
echo restoring save backup from slot
if exist "%savesdir%" (
    echo.
) else (
    echo You do not have the correct folder for backups!
    pause
    exit /b
)
echo.
for /d %%a in (%savesdir%\*) do echo %%~nxa
echo.
echo reminder: type the slot name EXACTLY as is written above
set /p "choice=type your choice now: "
set "selected=%savesdir%\%choice%"
if not exist "%selected%" (
    echo The slot %choice% is not valid. if you wanted to make this slot,create one with this name in Savedata-BackUp by typing 0
    pause
    exit /b
)
echo making backups of the current save
for %%f in ("%base%*.dat") do (
    copy /Y "%%~f" "%%~f.bak" >nul
)
echo restoring %choice%
copy /Y "%selected%\*.dat" "%base%" >nul
echo Savedata was restored, there are copies of your previous savedata Files
echo named with the .bak extension in case you forgot to back it up
pause
exit /b