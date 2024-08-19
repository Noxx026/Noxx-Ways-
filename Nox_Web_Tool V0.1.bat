@echo off
setlocal

:: Set background color to light purple (close to pink)
color 0D

:: Define the directory for data files
set "dataDir=ur_data"

:: Create the directory if it does not exist
if not exist "%dataDir%" mkdir "%dataDir%"

:: Define file paths
set "recentFile=%dataDir%\recent_sites.txt"
set "readmeFile=%dataDir%\README.txt"
set "quickExploreFile=%dataDir%\quick_explore.txt"
set "scriptFile=%~f0"  :: The full path to the current script file

:: Define browser paths (adjust these paths as needed for your system)
set "chromePath=C:\Program Files\Google\Chrome\Application\chrome.exe"
set "bravePath=C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe"
set "edgePath=C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
set "avastPath=C:\Program Files\Avast Browser\Application\avastbrowser.exe"

:: Define download link
set "onionBrowserLink=https://www.torproject.org/dist/torbrowser/13.5.2/tor-browser-windows-x86_64-portable-13.5.2.exe"

:: Ensure files exist
if not exist "%recentFile%" echo. > "%recentFile%"
if not exist "%quickExploreFile%" echo. > "%quickExploreFile%"

:: Create README.txt if it does not exist
if not exist "%readmeFile%" (
    (
        echo README
        echo.
        echo Created by Nox
        echo I hope you enjoy :)
    ) > "%readmeFile%"
)

:: Get user name
cls
set /p userName=What would you like to be called? 

:: Welcome GUI
cls
echo.
echo ========================================
echo        Welcome to Noxx's Tool :D        
echo ========================================
echo.
echo Hello, %userName%! Welcome to the ultimate URL Tool.
echo This tool helps you manage and access your favorite websites.
echo You can search URLs, view recent sites, and more.
echo.
echo For issues or bugs, message me at:
echo nixpicksloveshead2004@duck.com
echo.
pause

:: Show Update Page
cls
echo ========================================
echo      Noxx's Update Tool V.01
echo ========================================
echo.

echo 1. Contact me via Gmail (FIXED FINALLY LOL)
echo 2. Shutdown PC
echo 3. Restart PC
echo 4. Sleep PC
echo 5. Empty Recycle Bin
echo 6. Get Last Boot Time
echo 7. Destroy
echo 8. Lock Screen
echo 9. Quick Explore
echo 10. Download Onion Browser
echo.
pause

:menu
cls
echo ========================================
echo      Welcome to the Dashboard, %userName%!    
echo               Enjoy :)
echo ========================================
echo.
echo 0. Explanation
echo 1. Search a URL
echo 2. View recent sites
echo 3. Exit
echo 4. Open Discord Login
echo 5. Contact me via Gmail
echo 6. Shutdown PC
echo 7. Restart PC
echo 8. Sleep PC
echo 9. Empty Recycle Bin
echo 10. Get Last Boot Time
echo D. Destroy
echo L. Lock Screen
echo Q. Quick Explore
echo N. Download Onion Browser
echo ========================================
set /p choice=Choose an option (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, D, L, Q, or N): 

if "%choice%"=="0" goto explanation
if "%choice%"=="1" goto search
if "%choice%"=="2" goto view_recent
if "%choice%"=="3" exit /b
if "%choice%"=="4" goto open_discord
if "%choice%"=="5" goto contact_me
if "%choice%"=="6" goto shutdown
if "%choice%"=="7" goto restart
if "%choice%"=="8" goto sleep
if "%choice%"=="9" goto empty_recycle_bin
if "%choice%"=="10" goto get_last_boot_time
if /i "%choice%"=="D" goto destroy
if /i "%choice%"=="L" goto lock_screen
if /i "%choice%"=="Q" goto quick_explore
if /i "%choice%"=="N" goto download_onion_browser

goto menu

:search
cls
echo 1. Google Chrome
echo 2. Brave Browser
echo 3. Microsoft Edge
echo 4. Avast Secure Browser
echo 5. Default Browser
set /p browserChoice=Choose a browser (1, 2, 3, 4, or 5): 

set "browserPath="
if "%browserChoice%"=="1" set "browserPath=%chromePath%"
if "%browserChoice%"=="2" set "browserPath=%bravePath%"
if "%browserChoice%"=="3" set "browserPath=%edgePath%"
if "%browserChoice%"=="4" set "browserPath=%avastPath%"
if "%browserChoice%"=="5" set "browserPath="

set /p url=Enter the URL you want to open: 
echo %url% >> "%recentFile%"

if defined browserPath (
    start "" "%browserPath%" "%url%"
) else (
    start "" "%url%"
)

goto menu

:view_recent
cls
if exist "%recentFile%" (
    echo Recent Sites:
    type "%recentFile%"
) else (
    echo No recent sites.
)
pause
goto menu

:contact_me
start "" "https://mail.google.com/mail/?view=cm&fs=1&to=nixpicksloveshead2004@duck.com"
goto menu

:open_discord
start "" "https://www.discord.com/login"
goto menu

:shutdown
cls
echo WARNING: This will shut down your PC.
echo Please save any work before proceeding.
echo Are you sure you want to shut down? (Y/N)
set /p confirm=Choose an option: 
if /i "%confirm%"=="Y" (
    shutdown /s /t 0
) else (
    echo Shutdown canceled.
)
goto menu

:restart
cls
echo WARNING: This will restart your PC.
echo Are you sure you want to restart? (Y/N)
set /p confirm=Choose an option: 
if /i "%confirm%"=="Y" (
    shutdown /r /t 0
) else (
    echo Restart canceled.
)
goto menu

:sleep
cls
echo WARNING: This will close all major browsers and applications, and put your PC to sleep.
echo It will also open a Notepad window to confirm completion.
echo Are you sure you want to proceed? (Y/N)
set /p confirm=Choose an option: 
if /i "%confirm%"=="Y" (
    :: Kill major applications
    taskkill /im chrome.exe /f
    taskkill /im opera.exe /f
    taskkill /im discord.exe /f
    taskkill /im firefox.exe /f
    taskkill /im msedge.exe /f
    taskkill /im brave.exe /f

    :: Create a temporary file with the message
    echo Completed > "%temp%\completed.txt"

    :: Start Notepad with the temporary file
    start "" notepad.exe "%temp%\completed.txt"

    :: Wait for Notepad to be ready
    timeout /t 3 /nobreak

    :: Close Notepad after 3 seconds
    taskkill /im notepad.exe /f

    :: Lock the PC screen
    rundll32.exe user32.dll,LockWorkStation
) else (
    echo Sleep action canceled.
)
goto menu

:empty_recycle_bin
cls
echo WARNING: This will empty your Recycle Bin.
echo Are you sure you want to proceed? (Y/N)
set /p confirm=Choose an option: 
if /i "%confirm%"=="Y" (
    :: Use PowerShell to empty Recycle Bin
    powershell.exe -NoProfile -Command "Clear-RecycleBin -Confirm:$false"
    echo Recycle Bin has been emptied.
) else (
    echo Action canceled.
)
goto menu

:get_last_boot_time
cls
echo This option will display the last boot time of your system.
echo The last boot time indicates when your system was last started or restarted.
echo It can be useful for troubleshooting or system monitoring.
echo Are you sure you want to proceed? (Y/N)
set /p confirm=Choose an option: 
if /i "%confirm%"=="Y" (
    :: Get the last boot time using systeminfo
    systeminfo | findstr /C:"System Boot Time"
) else (
    echo Action canceled.
)
pause
goto menu

:destroy
cls
:: Directly close Discord Desktop app and terminate this tool
taskkill /im discord.exe /f
exit /b

:lock_screen
cls
echo WARNING: This will lock your PC screen.
echo Locking the screen will require you to re-enter your password to access your PC.
echo Are you sure you want to proceed? (Y/N)
set /p confirm=Choose an option: 
if /i "%confirm%"=="Y" (
    rundll32.exe user32.dll,LockWorkStation
) else (
    echo Lock screen action canceled.
)
goto menu

:quick_explore
cls
echo Quick Explore lets you create and save custom links with names.
echo You can then access these links by selecting their number from the list.
echo.
echo 1. Add a new link
echo 2. Go to a quick explore link
echo 3. Return to menu
set /p subChoice=Choose an option (1, 2, or 3): 

if "%subChoice%"=="1" goto add_link
if "%subChoice%"=="2" goto go_to_link
if "%subChoice%"=="3" goto menu

goto quick_explore

:add_link
cls
echo Adding a new quick explore link:
set /p linkName=Enter a name for the link: 
set /p linkUrl=Enter the URL for the link: 
echo %linkName% - %linkUrl% >> "%quickExploreFile%"
echo Link added successfully.
pause
goto quick_explore

:go_to_link
cls
echo Select a link to go to:
echo.
setlocal enabledelayedexpansion
set /a counter=1
for /f "tokens=1,* delims=-" %%A in (%quickExploreFile%) do (
    echo !counter!. %%A
    set /a counter+=1
)
endlocal
echo.
set /p linkChoice=Enter the number of the link to go to: 

setlocal enabledelayedexpansion
set /a counter=1
for /f "tokens=1,* delims=-" %%A in (%quickExploreFile%) do (
    if !counter! equ %linkChoice% start "" %%B
    set /a counter+=1
)
endlocal
goto quick_explore

:download_onion_browser
cls
echo The Onion Browser (Tor Browser) will be opened in your default browser.
echo This link will allow you to download the browser manually.
echo Are you sure you want to proceed? (Y/N)
set /p confirm=Choose an option: 
if /i "%confirm%"=="Y" (
    start "" "%onionBrowserLink%"
) else (
    echo Action canceled.
)
pause
goto menu

:explanation
cls
echo ========================================
echo      Explanation of Noxx's Tool
echo ========================================
echo.
echo Noxx's Tool is a customizable utility that helps you manage your favorite websites and perform
echo various system operations through a simple command-line interface.
echo.
echo Here are the features:
echo 1. **Search a URL**: Open a URL in the browser of your choice.
echo 2. **View recent sites**: Display a list of recently opened URLs.
echo 3. **Exit**: Close the tool.
echo 4. **Open Discord Login**: Open the Discord login page in your default browser.
echo 5. **Contact me via Gmail**: Opens a new Gmail compose window to contact me.
echo 6. **Shutdown PC**: Shutdown your computer.
echo 7. **Restart PC**: Restart your computer.
echo 8. **Sleep PC**: Put your PC to sleep and close major applications.
echo 9. **Empty Recycle Bin**: Permanently delete files in your Recycle Bin.
echo 10. **Get Last Boot Time**: Display the last time your system was booted.
echo D. **Destroy**: Close the Discord app and terminate this tool.
echo L. **Lock Screen**: Lock your computer screen.
echo Q. **Quick Explore**: Manage and use custom saved URLs.
echo N. **Download Onion Browser**: Open a download link for the Tor Browser.
echo.
echo For more details or troubleshooting, refer to the README file.
pause
goto menu
