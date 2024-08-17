@echo off
:: Create a temporary VBScript file to show the restart warning
echo Set objShell = CreateObject("WScript.Shell") > "%temp%\restart_warning.vbs"
echo intAnswer = objShell.Popup("Warning: This will restart your PC. Press Yes to continue, No to cancel.", 0, "Restart Warning", 4 + 32) >> "%temp%\restart_warning.vbs"

:: Run the VBScript and capture the result
cscript //nologo "%temp%\restart_warning.vbs"

:: Check the exit code and proceed based on user's choice
if %errorlevel% == 6 (
    :: 6 means Yes was clicked
    shutdown /r /f /t 0
) else (
    :: Any other value means No was clicked or dialog was closed
    echo Restart cancelled.
    
    :: Create a temporary text file with the message
    echo I love you n gawd damn that phat ass talk shii ima have to fuck it:) > "%temp%\love_message.txt"
    
    :: Open the text file with Notepad
    start notepad "%temp%\love_message.txt"
    
    :: Wait for 5 seconds
    timeout /t 5 /nobreak >nul
    
    :: Forcefully close Notepad using taskkill
    taskkill /IM notepad.exe /F
    
    :: Clean up the temporary files
    del "%temp%\love_message.txt"
)

:: Clean up the temporary VBScript file
del "%temp%\restart_warning.vbs"
