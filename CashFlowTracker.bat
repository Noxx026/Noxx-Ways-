batch
@echo off
setlocal

:: Define the target directory and transaction file
set "targetDir=moneyinfofiles"
set "transactionFile=%targetDir%\transactions.txt"
set "balanceFile=%targetDir%\balance.txt"

:: Check if the target directory exists; if not, create it
if not exist "%targetDir%" (
    echo Creating folder: %targetDir%
    mkdir "%targetDir%"
)

:: Initialize balance if balance file does not exist
if not exist "%balanceFile%" (
    echo 0 > "%balanceFile%"
)

:main
cls
echo ===========================
echo       Money Manager
echo ===========================
echo 1. Add Money
echo 2. Take Out Money
echo 3. View Current Balance
echo 4. View All Transactions
echo 5. Delete All Money Data
echo 6. Help
echo 7. About This App
echo 8. Exit
set /p choice="Select an option (1, 2, 3, 4, 5, 6, 7, or 8): "

if "%choice%"=="1" goto add_money
if "%choice%"=="2" goto take_out_money
if "%choice%"=="3" goto view_balance
if "%choice%"=="4" goto view_transactions
if "%choice%"=="5" goto delete_all_data
if "%choice%"=="6" goto help
if "%choice%"=="7" goto about_app
if "%choice%"=="8" exit

echo Invalid choice. Please try again.
pause
goto main

:about_app
cls
echo ===========================
echo       About This App
echo ===========================
echo Welcome to the Money Manager, your ultimate financial companion!
echo 
echo Are you tired of losing track of your expenses and income?
echo This app is designed to help you effortlessly manage your
echo personal finances with ease and efficiency!
echo 
echo Why should you use Money Manager?
echo 1. **Simple and Intuitive Interface**: Navigate through your
echo    finances without any hassle.
echo 2. **Track Your Transactions**: Keep a detailed record of
echo    all your financial activities.
echo 3. **Instant Balance Updates**: Know your current balance
echo    at a glance.
echo 4. **Secure Data Management**: Your financial data is stored
echo    safely and can be deleted when no longer needed.
echo 
echo Take control of your finances today! Start managing your
echo money effectively with the Money Manager!
pause
goto main

:add_money
set /p amount="Enter amount to add: "
if "%amount%"=="" (
    echo No amount entered. Returning to main menu.
    pause
    goto main
)

:: Update balance and log transaction
call :update_balance %amount%
call :get_time_string currentTime
echo Added money: %amount%
echo Transaction: Added %amount% on %date% %currentTime% >> "%transactionFile%"
pause
goto main

:take_out_money
set /p amount="Enter amount to take out: "
if "%amount%"=="" (
    echo No amount entered. Returning to main menu.
    pause
    goto main
)

:: Convert balance and amount to integers (cents)
set /a amountCents=%amount:*.=% 
for /f %%b in (%balanceFile%) do (
    set /a currentBalanceCents=%%b*100
)

:: Check if enough balance is available
if %currentBalanceCents% LSS %amountCents% (
    echo Insufficient balance. Returning to main menu.
    pause
    goto main
)

:: Update balance and log transaction
call :update_balance -%amount%
call :get_time_string currentTime
echo Took out money: %amount%
echo Transaction: Took out %amount% on %date% %currentTime% >> "%transactionFile%"
pause
goto main

:view_balance
cls
echo ===========================
echo       Current Balance
echo ===========================
for /f %%b in (%balanceFile%) do set "currentBalance=%%b"
echo Your current balance is: %currentBalance%
pause
goto main

:view_transactions
cls
echo ===========================
echo       All Transactions
echo ===========================
if exist "%transactionFile%" (
    type "%transactionFile%"
) else (
    echo No transactions found.
)
pause
goto main

:delete_all_data
cls
echo WARNING: This action will delete all your money data.
set /p agree="Type 'I Agree' to confirm deletion: "
if /i "%agree%"=="I Agree" (
    del "%transactionFile%" >nul 2>&1
    del "%balanceFile%" >nul 2>&1
    echo All money data has been deleted.
) else (
    echo You did not type 'I Agree'. Deletion cancelled.
)
pause
goto main

:help
cls
echo ===========================
echo       Help Menu
echo ===========================
echo This Money Manager allows you to track your personal finances.
echo 
echo Options:
echo 1. Add Money - Enter an amount to add to your balance.
echo 2. Take Out Money - Enter an amount to withdraw from your balance.
echo 3. View Current Balance - Displays your current balance.
echo 4. View All Transactions - Displays all transactions made.
echo 5. Delete All Money Data - Permanently deletes all transaction and balance data.
echo 6. Help - Displays this help menu.
echo 7. Exit - Closes the program.
echo 
echo Important Notes:
echo - When entering amounts, please do not use commas. For example, enter 100000 for $100,000.
echo - Ensure that the amount entered is a valid number.
pause
goto main

:update_balance
setlocal
set /a newBalance=%1
for /f %%b in (%balanceFile%) do set /a newBalance+=%%b
echo %newBalance% > "%balanceFile%"
endlocal & set "newBalance=%newBalance%"
exit /b

:get_time_string
:: Get the current time formatted as 12-hour with AM/PM
for /f "tokens=1-3 delims=:" %%a in ("%time%") do (
    set /a hour=%%a
    set minutes=%%b
    set seconds=%%c
)
if %hour% lss 12 (
    set ampm=AM
) else (
    set ampm=PM
    if %hour% gtr 12 (
        set /a hour-=12
    )
)
if %hour%==0 set hour=12
set "timeString=%hour%:%minutes%:%seconds% %ampm%"
endlocal & set "%~1=%timeString%"
exit /b

endlocal