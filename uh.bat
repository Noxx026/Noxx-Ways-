@echo off
setlocal enabledelayedexpansion

echo Welcome to the Math Unlock Game!
echo In this game, you'll solve math problems to keep your screen on.
echo You have a limited number of lives. Answer correctly to avoid locking your screen!
echo Press Enter to continue...

set /p userName="What's your name? "

cls

rem Check if the file exists
if exist unknown\dontopentilldecember25th.txt (
    echo Hello, !userName! Welcome back to the game!
    echo We already have your goal noted down. Let's get started.
) else (
    echo Hello, !userName! Welcome to the game!
    echo Before we start, here's a fun question:
    echo Your answer will be safely stored in a folder and text file on your PC.
    echo Please put as much detail as you can, as you'll be able to look back on it on that date.
    set /p goal="What is one goal you wish to have for yourself? Something you want to see in the future (just a bit of a mess around question, lol): "

    rem Create the folder and file
    mkdir unknown >nul 2>&1
    echo !goal! > unknown\dontopentilldecember25th.txt

    echo Your goal has been noted! Now, let's get started.
)

echo You have 3 lives remaining.
set /a lives=3

:game
cls
echo You have !lives! lives remaining.
echo To keep your screen on, solve the following math problem.
echo Here are the operations:
echo + : Addition (adding two numbers)
echo - : Subtraction (subtracting one number from another)
echo * : Multiplication (multiplying two numbers)
echo.

rem Generate random numbers for harder questions
set /a num1=%random% %% 9000 + 1000  rem Numbers between 1000 and 9999
set /a num2=%random% %% 9000 + 1000  rem Numbers between 1000 and 9999

rem Randomly select an operation
set /a operation=%random% %% 3  rem Now 3 operations

rem Set up the math problem based on the operation
if !operation! == 0 (
    set /a answer=num1 + num2
    set "problem=!num1! + !num2!"
) else if !operation! == 1 (
    rem Ensure num1 is larger for subtraction to avoid negative results
    if !num1! GTR !num2! (
        set /a answer=num1 - num2
        set "problem=!num1! - !num2!"
    ) else (
        set /a answer=num2 - num1
        set "problem=!num2! - !num1!"
    )
) else (
    rem For multiplication
    set /a answer=num1 * num2
    set "problem=!num1! * !num2!"
)

echo What is !problem!? 
set /p userAnswer="Your answer: "

if "!userAnswer!"=="" (
    echo You need to provide an answer.
    timeout /t 2 >nul
    goto game
)

if !userAnswer! == !answer! (
    echo Correct! Your screen stays on.
    pause
    exit
) else (
    set /a lives-=1
    echo Incorrect answer. You have !lives! lives remaining.
    timeout /t 2 >nul
    if !lives! GTR 0 (
        goto game
    ) else (
        echo Oh no, you lost! Your screen will now lock :(
        timeout /t 5 >nul
        rundll32.exe user32.dll,LockWorkStation
        exit
    )
)
