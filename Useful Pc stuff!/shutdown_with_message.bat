@echo off
:: Create a temporary VBScript file to show a message box
echo Set objShell = CreateObject("WScript.Shell") > "%temp%\shutdown_warning.vbs"
echo intAnswer = objShell.Popup("Warning: This will turn off your PC. Press Yes to continue, No to cancel.", 0, "Shutdown Warning", 4 + 32) >> "%temp%\shutdown_warning.vbs"

:: Run the VBScript and capture the result
cscript //nologo "%temp%\shutdown_warning.vbs"

:: Check the exit code and proceed based on user's choice
if %errorlevel% == 6 (
    :: 6 means Yes was clicked
    shutdown /s /f /t 0
) else (
    :: Any other value means No was clicked or dialog was closed
    echo Shutdown cancelled.
)

:: Clean up the temporary VBScript file
del "%temp%\shutdown_warning.vbs"
