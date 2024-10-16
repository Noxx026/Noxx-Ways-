batch
@echo off
setlocal

:: Define the target directory for storing movie-related text files
set "targetDir=movieinfofiles"
set "movieFile=%targetDir%\movies.txt"
set "watchLaterFile=%targetDir%\watchmovielater.txt"
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
echo 5. Add to Watch Later List
echo 6. Show Watch Later List
echo 7. Clear All Movies
echo 8. Exit
set /p choice="Select an option (1, 2, 3, 4, 5, 6, 7, or 8): "

if "%choice%"=="1" goto about_app
if "%choice%"=="2" goto add_movie_with_date
if "%choice%"=="3" goto show_movies
if "%choice%"=="4" goto add_movie_without_date
if "%choice%"=="5" goto add_to_watch_later
if "%choice%"=="6" goto show_watch_later
if "%choice%"=="7" goto clear_movies
if "%choice%"=="8" exit

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
echo add to a watch later list, and clear all movies. It is designed to help you 
echo keep track of what you've seen and what you want to watch later.
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

:add_to_watch_later
set /p movie="What movie do you want to add to your watch later list? "
if "%movie%"=="" (
    echo No movie entered. Returning to main menu.
    pause
    goto main
)

:: Create or append to the watchmovielater.txt file without date, enclosing in quotes
(
    echo "%movie%"
) >> "%watchLaterFile%"

echo Movie added to watch later list: "%movie%"
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

:show_watch_later
cls
echo ===========================
echo       Watch Later List
echo ===========================
if exist "%watchLaterFile%" (
    type "%watchLaterFile%"
) else (
    echo No movies in the watch later list. Please add a movie.
)
pause
goto main

:clear_movies
set /p confirm="Are you sure you want to clear all movies? Y/N: "
if /i "%confirm%"=="Y" (
    del "%movieFile%"
    del "%watchLaterFile%"
    echo All movies and watch later list have been cleared.
) else (
    echo Operation cancelled. Returning to main menu.
)
pause
goto main

endlocal