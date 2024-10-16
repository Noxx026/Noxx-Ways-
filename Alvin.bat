batch
@echo off
setlocal

:: Define the target directory for storing movie-related text files
set "targetDir=movieinfofiles"
set "movieFile=%targetDir%\movies.txt"
set "displayUserFile=%targetDir%\currentUser.txt"

:: Check if the target directory exists; if not, create it
if not exist "%targetDir%" (
    echo Creating folder: %targetDir%
    mkdir "%targetDir%"
)

:: Move all .txt files to the target directory
echo Moving .txt files to %targetDir%...
move *.txt "%targetDir%" >nul 2>nul

:: Check if the move operation was successful
if errorlevel 1 (
    echo No .txt files found or an error occurred during the move operation.
) else (
    echo Successfully moved all .txt files to %targetDir%.
)

:: Check if currentUser.txt exists and read the username if it does
if exist "%displayUserFile%" (
    set /p username=<"%displayUserFile%"
) else (
    :: If currentUser.txt does not exist, set a default username
    set "username=Guest"
)

:main
cls
echo ===========================
echo       Welcome, %username%!
echo ===========================
echo 1. About This App
echo 2. Add a Movie (With Date)
echo 3. Show Movies
echo 4. Add Movie (Without Date)
echo 5. Clear All Movies
echo 6. Exit
set /p choice="Select an option (1, 2, 3, 4, 5, or 6): "

if "%choice%"=="1" goto about_app
if "%choice%"=="2" goto add_movie_with_date
if "%choice%"=="3" goto show_movies
if "%choice%"=="4" goto add_movie_without_date
if "%choice%"=="5" goto clear_movies
if "%choice%"=="6" exit

echo Invalid choice. Please try again.
pause
goto main

:about_app
cls
echo ===========================
echo       About This App
echo ===========================
echo This application allows you to manage your movie list.
echo You can add movies with or without a date, show your current movie list,
echo and clear all movies. It is designed to help you keep track of what you've seen.
echo.
pause
goto main

:add_movie_with_date
set /p movie="What movie do you want to add that you have seen? "
if "%movie%"=="" (
    echo No movie entered. Returning to main menu.
    pause
    goto main
)

:: Get the current date and time
for /f "tokens=1-3 delims= " %%a in ('date /t') do set currentDate=%%a %%b %%c
for /f "tokens=1-2 delims=:" %%a in ('time /t') do set currentTime=%%a:%%b

:: Create or append to the movies.txt file with date, enclosing in quotes
(
    echo "%movie% - %currentDate% %currentTime%"
) >> "%movieFile%"

echo Movie added: "%movie%" - %currentDate% %currentTime%
pause
goto main

:add_movie_without_date
set /p movie="What movie do you want to add (without date)? "
if "%movie%"=="" (
    echo No movie entered. Returning to main menu.
    pause
    goto main
)

:: Create or append to the movies.txt file without date, enclosing in quotes
(
    echo "%movie%"
) >> "%movieFile%"

echo Movie added: "%movie%" (without date)
pause
goto main

:show_movies
cls
echo ===========================
echo       Movies List
echo ===========================
if exist "%movieFile%" (
    type "%movieFile%"
) else (
    echo No movies found. Please add a movie first.
)
pause
goto main

:clear_movies
set /p confirm="Are you sure you want to clear all movies? Y/N: "
if /i "%confirm%"=="Y" (
    del "%movieFile%"
    echo All movies have been cleared.
) else (
    echo Operation cancelled. Returning to main menu.
)
pause
goto main

endlocal