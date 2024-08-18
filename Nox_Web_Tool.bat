@echo off
setlocal

:: Define file paths
set "recentFile=recent_sites.txt"
set "favoritesFile=favorites.txt"
set "savedSitesFile=saved_sites.txt"
set "readmeFile=README.txt"

:: Define browser paths (adjust these paths as needed for your system)
set "chromePath=C:\Program Files\Google\Chrome\Application\chrome.exe"
set "bravePath=C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe"
set "edgePath=C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
set "avastPath=C:\Program Files\Avast Browser\Application\avastbrowser.exe"

:: Ensure files exist
if not exist "%recentFile%" echo. > "%recentFile%"
if not exist "%favoritesFile%" echo. > "%favoritesFile%"
if not exist "%savedSitesFile%" echo. > "%savedSitesFile%"

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
echo 1. Search a URL
echo 2. View recent sites
echo 3. View favorites
echo 4. Add to favorites
echo 5. Save sites to a file
echo 6. Exit
echo 7. Open Discord Login
echo 8. Contact me via Gmail
set /p choice=Choose an option (1, 2, 3, 4, 5, 6, 7, or 8): 

if "%choice%"=="1" goto search
if "%choice%"=="2" goto view_recent
if "%choice%"=="3" goto view_favorites
if "%choice%"=="4" goto add_favorite
if "%choice%"=="5" goto save_sites
if "%choice%"=="6" exit /b
if "%choice%"=="7" goto open_discord
if "%choice%"=="8" goto contact_me

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
start "" "https://mail.google.com/"
goto menu

:open_discord
start "" "https://www.discord.com/login"
goto menu
