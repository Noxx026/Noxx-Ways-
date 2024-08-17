@echo off
setlocal

:: Set your password here
set "PASSWORD=DaddyHasABigDick"

:: Prompt for password
set /p "USERPASS=Enter password to prevent sleep: "

:: Check if password is correct
if "%USERPASS%"=="%PASSWORD%" (
    echo Password correct. Sleep command will not be executed.
    exit /b 0
) else (
    echo Incorrect password. The system will go to sleep now.
    :: Wait a few seconds to show the message
    timeout /t 5 /nobreak >nul
    :: Execute the sleep command
    rundll32.exe powrprof.dll,SetSuspendState Sleep
)
