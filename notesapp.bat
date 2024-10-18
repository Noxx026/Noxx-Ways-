batch
@echo off
REM ================================================
REM Simple Note-Taking Application
REM This script allows you to add notes, view notes,
REM delete all notes with confirmation, and exit the application.
REM All notes will be saved in the MyNotes folder.
REM ================================================

set notesFolder=MyNotes
set notesFile=%notesFolder%\mypersonalnotes.txt

REM Create the MyNotes folder if it does not exist
if not exist "%notesFolder%" (
    mkdir "%notesFolder%"
)

:MainMenu
cls
echo ============================
echo    Note-Taking Application
echo ============================
echo 1. Add a Note (with date ^& time)
echo 2. Add a Note (without date ^& time)
echo 3. View Notes
echo 4. Delete All Notes
echo 5. Help
echo 6. Exit
echo ============================
set /p choice="Please select an option (1-6): "

REM Check user input and navigate accordingly
if "%choice%"=="1" goto AddNoteWithTimestamp
if "%choice%"=="2" goto AddNoteWithoutTimestamp
if "%choice%"=="3" goto ViewNotes
if "%choice%"=="4" goto DeleteAllNotes
if "%choice%"=="5" goto Help
if "%choice%"=="6" goto Exit
echo Invalid choice. Please try again.
pause
goto MainMenu

:AddNoteWithTimestamp
cls
echo ============================
echo         Add a Note
echo ============================
set /p note="Enter your note: "

REM Get the current date and time
for /f "tokens=1-3 delims= " %%a in ('date /t') do set currentDate=%%a-%%b-%%c
for /f "tokens=1-2 delims=:" %%a in ('time /t') do set currentTime=%%a:%%b
set timestamp=%currentDate% %currentTime%

REM Append the note with the timestamp to the file
echo "%note% - %timestamp%" >> "%notesFile%"
echo Note added successfully!
pause
goto MainMenu

:AddNoteWithoutTimestamp
cls
echo ============================
echo     Add a Note (No Date/Time)
echo ============================
set /p note="Enter your note: "

REM Append the note without timestamp to the file
echo "%note%" >> "%notesFile%"
echo Note added successfully!
pause
goto MainMenu

:ViewNotes
cls
echo ============================
echo         View Notes
echo ============================
if exist "%notesFile%" (
    echo Here are your notes:
    echo ============================
    type "%notesFile%"
    echo ============================
) else (
    echo No notes found.
)
pause
goto MainMenu

:DeleteAllNotes
cls
echo ============================
echo      Delete All Notes
echo ============================
echo Are you sure you want to delete all notes?
echo This action cannot be undone.
echo Press Y to confirm deletion or N to go back to the main menu.
set /p confirm="Your choice (Y/N): "

if /i "%confirm%"=="Y" (
    del "%notesFile%"
    echo All notes have been deleted successfully!
) else if /i "%confirm%"=="N" (
    echo Returning to the main menu...
) else (
    echo Invalid choice. Returning to the main menu...
)

pause
goto MainMenu

:Help
cls
echo ============================
echo           Help Menu
echo ============================
echo 1. Add a Note (with date ^& time) - This option allows you to add a note that includes the current date and time.
echo 2. Add a Note (without date ^& time) - This option allows you to add a note without any timestamp.
echo 3. View Notes - Displays all the notes you have added.
echo 4. Delete All Notes - Permanently removes all notes. This action cannot be undone.
echo 5. Help - Displays this help menu.
echo 6. Exit - Closes the application.
echo.
echo If you ever just want to delete a single note in case you don't want to purge all your precious notes...
echo Go to "%notesFolder%\%notesFile%" (the name of the text file).
echo Highlight the note you want to delete, delete it, and then save the file.
echo Reopen the app and kaboom! :D
echo ============================
pause
goto MainMenu

:Exit
echo Thank you for using the Note-Taking Application!
exit