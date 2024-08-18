@echo off
setlocal enabledelayedexpansion

:: Define file paths
set "recentFile=recent_sites.txt"
set "favoritesFile=favorites.txt"
set "savedSitesFile=saved_sites.txt"
set "readmeFile=README.txt"
set "personalLinksFile=personal_links.txt"
set "usernameFile=username.txt"

:: Define backup folder
set "backupFolder=backup_files"

:: Define browser paths (adjust these paths as needed for your system)
set "chromePath=C:\Program Files\Google\Chrome\Application\chrome.exe"
set "bravePath=C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe"
set "edgePath=C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"

:: Define webhook URL
set "webhookURL=https://discord.com/api/webhooks/1274485077044105307/miAgrrs1RZ0cHFajLHefPj1D0Pa0d-PICs59lHHVCtyhhcIHehcXvgniR_b6xAP8xnq7"

:: Check for username
if not exist "%usernameFile%" (
    cls
    echo ========================================
    echo         Enter Your Username
    echo ========================================
    set /p username=Please enter your username: 
    echo %username% > "%usernameFile%"
) else (
    set /p username=<"%usernameFile%"
)

:: Display new updates
color 5F
cls
echo ========================================
echo         NEW UPDATE LIST
echo ========================================
echo.
echo Welcome %username%! :D
echo.
echo EXPLANATION: This script helps you manage and access your favorite websites.
echo.
echo FIXED GMAIL: You can now directly open Gmail to send a message. It’s easier than ever to get in touch! :D
echo.
echo PERSONAL LINKS: You can add personal links with a name and URL. It’s like having your own safe little box for important links! :)
echo.
echo BACKUP FILE: You can now back up all your files to a backup folder. This helps you keep a copy of your data!
echo.
echo SUGGESTIONS: Send your suggestions, bug reports, or feature requests to the Discord webhook. We value your feedback! :D
echo.
pause

:: Ensure files exist
echo. > "%recentFile%"
echo. > "%favoritesFile%"
echo. > "%savedSitesFile%"
echo. > "%personalLinksFile%"

:: Create README.txt if it does not exist
if not exist "%readmeFile%" (
    (
        echo README
        echo.
        echo Created by Nox
        echo I hope you enjoy :)
    ) > "%readmeFile%"
)

:: Welcome GUI
cls
echo ========================================
echo         Welcome to Nox's URL Tool       
echo ========================================
echo.
echo This tool helps you manage and access your favorite websites.
echo You can search URLs, view recent sites, and manage your favorites.
echo.
echo For issues or bugs, message me at:
echo nixpicksloveshead2004@duck.com
echo.
pause

:menu
cls
echo 0. Explanation
echo 1. Search a URL
echo 2. View recent sites
echo 3. View favorites
echo 4. Add to favorites
echo 5. Save sites to a file
echo 6. Exit
echo 7. Open Discord Login
echo 8. Contact me via Gmail
echo 9. Personal Links
echo 7000. Backup Files
echo 1000. Suggestions
echo 01. My GitHub Page/Project :D
echo 999. Shutdown PC
echo 0000. Restart PC
set /p choice=Choose an option (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 7000, 1000, 01, 999, or 0000): 

if "%choice%"=="0" goto explanation
if "%choice%"=="1" goto search
if "%choice%"=="2" goto view_recent
if "%choice%"=="3" goto view_favorites
if "%choice%"=="4" goto add_favorite
if "%choice%"=="5" goto save_sites
if "%choice%"=="6" exit /b
if "%choice%"=="7" goto open_discord
if "%choice%"=="8" goto contact_me
if "%choice%"=="9" goto personal_links
if "%choice%"=="7000" goto backup_files
if "%choice%"=="1000" goto suggestions
if "%choice%"=="01" goto github_page
if "%choice%"=="999" goto shutdown_pc
if "%choice%"=="0000" goto restart_pc

goto menu

:explanation
cls
echo Explanation of the options:
echo.
echo 0. Explanation - Displays this help message explaining what each number does.
echo.
echo 1. Search a URL - Opens a prompt for you to enter a URL. You can choose a browser to open the URL in, or use the default browser.
echo.
echo 2. View recent sites - Displays a list of URLs you've recently accessed. This helps you quickly revisit sites you've been to.
echo.
echo 3. View favorites - Shows a list of your favorite URLs.
echo.
echo 4. Add to favorites - Adds a new URL to your favorites list.
echo.
echo 5. Save sites to a file - Combines recent and favorite sites into a single file.
echo.
echo 6. Exit - Closes the tool and ends the script.
echo.
echo 7. Open Discord Login - Opens the Discord login page.
echo.
echo 8. Contact me via Gmail - Opens Gmail to send an email to me.
echo.
echo 9. Personal Links - Provides a list of personal links you can quickly access.
echo.
echo 7000. Backup Files - Backs up all your text files to a backup folder.
echo.
echo 1000. Suggestions - Allows you to send a suggestion to me via a Discord webhook.
echo.
echo 01. My GitHub Page/Project :D - Opens my GitHub page/project in your default browser.
echo.
echo 999. Shutdown PC - Shuts down your PC after confirmation.
echo.
echo 0000. Restart PC - Restarts your PC after confirmation.
echo.
pause
goto menu

:search
cls
echo 1. Google Chrome
echo 2. Brave Browser
echo 3. Microsoft Edge
echo 4. Default Browser
set /p browserChoice=Choose a browser (1, 2, 3, or 4): 

set "browserPath="
if "%browserChoice%"=="1" set "browserPath=%chromePath%"
if "%browserChoice%"=="2" set "browserPath=%bravePath%"
if "%browserChoice%"=="3" set "browserPath=%edgePath%"
if "%browserChoice%"=="4" set "browserPath="

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

:view_favorites
cls
if exist "%favoritesFile%" (
    echo Favorite Sites:
    type "%favoritesFile%"
) else (
    echo No favorite sites.
)
pause
goto menu

:add_favorite
cls
set /p url=Enter the URL to add to favorites: 
echo %url% >> "%favoritesFile%"
echo %url% added to favorites.
pause
goto menu

:save_sites
cls
:: Combine recent sites and favorites into a saved file
(
    echo Recent Sites:
    type "%recentFile%"
    echo.
    echo Favorite Sites:
    type "%favoritesFile%"
) > "%savedSitesFile%"

echo Sites saved to "%savedSitesFile%".
pause
goto menu

:contact_me
start "" "https://mail.google.com/mail/?view=cm&fs=1&to=nixpicksloveshead2004@duck.com"
goto menu

:open_discord
start "" "https://www.discord.com/login"
goto menu

:personal_links
cls
echo 1. View personal links
echo 2. Add a personal link
echo 3. Delete a personal link
echo 4. Go to a personal link
echo 5. Go back
set /p personalChoice=Choose an option (1, 2, 3, 4, or 5): 

if "%personalChoice%"=="1" goto view_personal_links
if "%personalChoice%"=="2" goto add_personal_link
if "%personalChoice%"=="3" goto delete_personal_link
if "%personalChoice%"=="4" goto go_to_personal_link
if "%personalChoice%"=="5" goto menu

goto menu

:view_personal_links
cls
if exist "%personalLinksFile%" (
    echo Personal Links:
    type "%personalLinksFile%"
) else (
    echo No personal links.
)
pause
goto personal_links

:add_personal_link
cls
set /p linkName=Enter a name for the link: 
set /p linkURL=Enter the URL for the link: 

echo %linkName%=%linkURL% >> "%personalLinksFile%"
echo Personal link added.
pause
goto personal_links

:delete_personal_link
cls
set /p linkNameToDelete=Enter the name of the link to delete: 

findstr /v /c:"%linkNameToDelete%=" "%personalLinksFile%" > temp_links.txt
move /Y temp_links.txt "%personalLinksFile%"

echo Personal link deleted.
pause
goto personal_links

:go_to_personal_link
cls
echo Select a personal link to open:
echo.

:: List personal links with numbering
setlocal enabledelayedexpansion
set /a count=1
for /f "tokens=1,2 delims==" %%A in (%personalLinksFile%) do (
    echo !count!. %%A
    set /a count+=1
)
endlocal

set /p linkChoice=Choose a link number: 
set /a linkNumber=%linkChoice% - 1

setlocal enabledelayedexpansion
set /a count=0
for /f "tokens=1,2 delims==" %%A in (%personalLinksFile%) do (
    if !count! equ %linkNumber% (
        start "" "%%B"
    )
    set /a count+=1
)
endlocal

pause
goto personal_links

:backup_files
cls
echo Backing up files...
if not exist "%backupFolder%" mkdir "%backupFolder%"
xcopy /s /y "%recentFile%" "%backupFolder%"
xcopy /s /y "%favoritesFile%" "%backupFolder%"
xcopy /s /y "%savedSitesFile%" "%backupFolder%"
xcopy /s /y "%readmeFile%" "%backupFolder%"
xcopy /s /y "%personalLinksFile%" "%backupFolder%"
echo Backup complete.
pause
goto menu

:suggestions
cls
set /p suggestion=Enter your suggestion or feedback: 
curl -X POST -H "Content-Type: application/json" -d "{\"content\":\"%suggestion%\"}" "%webhookURL%"
echo Thank you for your suggestion!
pause
goto menu

:github_page
cls
echo Opening My GitHub Page/Project :D
start "" "https://github.com/Noxx026/Noxx-Ways-"
goto menu

:shutdown_pc
cls
echo Are you sure you want to shut down your PC? (Y/N)
set /p confirm=Enter choice: 
if /I "%confirm%"=="Y" (
    shutdown /s /t 0
) else (
    echo Shutdown canceled.
)
pause
goto menu

:restart_pc
cls
echo Are you sure you want to restart your PC? (Y/N)
set /p confirm=Enter choice: 
if /I "%confirm%"=="Y" (
    shutdown /r /t 0
) else (
    echo Restart canceled.
)
pause
goto menu
