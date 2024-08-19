batch
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
set "notesFile=%dataDir%\notes.txt"
set "usernameFile=%dataDir%\username.txt"
set "downloadInstructionsFile=%dataDir%\download_instructions.txt"
set "scriptFile=%~f0"  :: The full path to the current script file

:: Define browser paths (adjust these paths as needed for your system)
set "chromePath=C:\Program Files\Google\Chrome\Application\chrome.exe"
set "avastPath=C:\Program Files\Avast Browser\Application\avastbrowser.exe"

:: Ensure files exist
if not exist "%recentFile%" echo. > "%recentFile%"
if not exist "%notesFile%" echo. > "%notesFile%"

:: Create README.txt if it does not exist
if not exist "%readmeFile%" (
    (
        echo README
        echo.
        echo What is this app?
        echo 1. This app is a utility tool designed to help users manage their favorite websites and URLs efficiently.
        echo 2. It allows users to quickly access recent sites, search for URLs, take notes, and manage various system functions like shutdown or restart.
        echo 3. The app is user-friendly and provides a simple dashboard for easy navigation among its features.
        echo 4. You can also block unwanted websites and retrieve or manage your personal notes.
        echo 5. The tool supports multiple browsers for opening URLs and offers a straightforward way to download useful applications.
        echo 6. Overall, this tool aims to enhance your productivity and organization while browsing the internet.
        echo.
        echo Created by Nox
        echo I hope you enjoy :)
    ) > "%readmeFile%"
)

:: Welcome Message
cls
echo ========================================
echo        Welcome to My Tool!
echo ========================================
echo This is a utility tool designed to help you manage your favorite websites and URLs efficiently.
echo Quickly access recent sites, search for URLs, and take notes with ease.
echo The app features a user-friendly dashboard for easy navigation among its functions.
echo You can also block unwanted websites and retrieve or manage your personal notes.
echo Additionally, it supports multiple browsers for opening URLs and provides download options for useful applications.
echo Overall, this tool aims to enhance your productivity and organization while browsing the internet.
echo ========================================
pause

:: Check if username file exists, if not prompt for username
if exist "%usernameFile%" (
    set /p userName=<"%usernameFile%"
) else (
    cls
    set /p userName=What would you like to be called? 
    echo %userName% > "%usernameFile%"
)

:: Check if the user has agreed to the Terms of Service before
set "agreementFile=%dataDir%\agreement_status.txt"

if exist "%agreementFile%" (
    goto menu  :: Skip to the main menu if already agreed
)

:: Update List
cls
echo ========================================
echo            Update List
echo ========================================
echo 1. Added Terms of Service
echo 2. User-friendly dashboard
echo 3. Enhanced note taking features
echo 4. Improved website blocking option
echo 5. Added lyrics access with password
echo 6. Download options for browsers
echo 7. Pinging websites feature
echo 8. Recent sites tracking
echo 9. Improved shutdown and restart options
echo 10. Contact form for feedback
echo ========================================
pause

:: Terms of Service
cls
echo ========================================
echo           Terms of Service
echo ========================================
echo By using this tool, you agree to the following:
echo 1. Be good and don’t be mean.
echo 2. Use this tool for everyday tasks responsibly.
echo 3. Respect the privacy and data of others.
echo 4. If you press agree, you agree to call me daddy now and then.
echo 4. Also Lisa Has The Phattest ass like gawd damn pound that shii raw all day ;) also head everyday :)
echo.
echo Type 'yes' to agree and go to the main menu, or 'no' to exit.
set /p tosAgree=Do you agree? (yes/no): 
if /i "%tosAgree%"=="yes" (
    echo Agreed > "%agreementFile%"  :: Mark as agreed
    goto menu
) else (
    echo You have not agreed to the Terms of Service. Exiting...
    exit /b
)

:menu
cls
echo ========================================
echo      Welcome to the Dashboard, %userName%!    
echo               Enjoy :)
echo ========================================
echo.
echo                  Navigation
echo ========================================
echo 0. Explanation
echo 1. Search a URL
echo 2. View recent sites
echo 3. Change Username
echo 6. Open Discord Login
echo 7. Contact me via Gmail
echo.
echo                  System Controls
echo ========================================
echo 4. Ping Website
echo 5. Exit
echo 8. Shutdown PC
echo 9. Restart PC
echo 10. Sleep PC
echo 11. Empty Recycle Bin
echo 12. Get Last Boot Time
echo d. Destroy (kills Discord and tool)
echo l. Lock PC
echo.
echo                  Website Management
echo ========================================
echo 14. Block Website
echo.
echo                  Personal Management
echo ========================================
echo 15. Encyclopedia (personally made for Lisa)
echo 16. Downloads
echo 17. Lyrics
echo 18. Visit My GitHub Page
echo 19. Rights to be Forgotten
echo ========================================
set /p choice=Choose an option (0-19, d, l): 

if "%choice%"=="0" goto explanation
if "%choice%"=="1" goto search
if "%choice%"=="2" goto view_recent
if "%choice%"=="3" goto change_username
if "%choice%"=="4" goto ping_website
if "%choice%"=="5" exit /b
if "%choice%"=="6" goto open_discord
if "%choice%"=="7" goto contact_me
if "%choice%"=="8" goto shutdown
if "%choice%"=="9" goto restart
if "%choice%"=="10" goto sleep
if "%choice%"=="11" goto empty_recycle_bin
if "%choice%"=="12" goto get_last_boot_time
if /i "%choice%"=="d" goto destroy
if /i "%choice%"=="l" goto lock_screen
if "%choice%"=="14" goto block_website
if "%choice%"=="15" goto my_notes
if "%choice%"=="16" goto downloads
if "%choice%"=="17" goto lyrics_password
if "%choice%"=="18" goto visit_github
if "%choice%"=="19" goto rights_to_be_forgotten

goto menu

:ping_website
cls
set /p website=Enter the website to ping (e.g., google.com): 
echo Pinging %website%...
ping %website%
pause
goto menu

:rights_to_be_forgotten
cls
echo WARNING: This action will delete all personal data stored and the script file itself.
echo Are you sure you want to proceed? (Y/N)
set /p confirm=Choose an option: 
if /i "%confirm%"=="Y" (
    echo Deleting user data...
    rmdir /s /q "%dataDir%"
    echo User data deleted.
    
    echo Deleting script file...
    del "%scriptFile%"
    
    echo All data has been removed. You will now be redirected to the GitHub page.
    start cmd /c start "" "https://github.com/Noxx026/Noxx-Ways-"
    
    exit /b
) else (
    echo Action canceled.
)
goto menu

:explanation
cls
echo ========================================
echo           Explanation of Options
echo ========================================
echo 1. Search a URL: Opens a website in your chosen browser. You can quickly navigate to any URL by entering it here.
echo 2. View recent sites: Displays a list of websites you've recently visited, making it easy to revisit them.
echo 3. Change Username: Allows you to change your current username.
echo 4. Ping Website: Test the connectivity of a website by pinging it.
echo 5. Exit: Closes the tool and returns you to the Command Prompt or desktop.
echo 6. Open Discord Login: Directly opens the Discord login page in your default browser.
echo 7. Contact me via Gmail: Opens a Gmail compose window to quickly send me a message.
echo 8. Shutdown PC: Shuts down your computer safely. Save your work before using this option.
echo 9. Restart PC: Restarts your computer. This can be useful after installing updates or troubleshooting.
echo 10. Sleep PC: Puts your computer into sleep mode, saving energy while keeping your session available.
echo 11. Empty Recycle Bin: Permanently deletes files from your Recycle Bin, freeing up space on your hard drive.
echo 12. Get Last Boot Time: Shows the last time your computer was restarted or turned on, useful for system monitoring.
echo 13. Block Website: Opens the hosts file for editing to block specified websites.
echo 14. Encyclopedia: Allows you to add, view, and delete notes stored in the ur_data folder.
echo 15. Lyrics: Displays lyrics of songs.
echo 16. Downloads: Provides download options for various tools.
echo 17. Rights to be Forgotten: Deletes all personal data and removes the tool from your system.
echo d. Destroy: WARNING: This will close Discord and exit the tool.
echo l. Lock Screen: Locks your computer screen, requiring a password or PIN to unlock.
echo 18. Visit My GitHub Page: Opens my GitHub project page where you can view and contribute to my work.
pause
goto menu

:change_username
cls
echo Current Username: %userName%
echo There is a small bug so you have to change your username here, but don't worry, once you change it here, it updates when you reopen it!
set /p newUserName=Enter your new username: 
echo %newUserName% > "%usernameFile%"
set "userName=%newUserName%"
echo Username changed to %userName%.
pause
goto menu

:downloads
cls
echo ========================================
echo                 Downloads
echo ========================================
echo 1. Onion Browser Download (it's safe dw :P)
echo 2. DuckDuckGo Browser
echo 3. [Placeholder for Download 3]
echo 4. [Placeholder for Download 4]
echo 5. [Placeholder for Download 5]
echo 6. Go Back
echo ========================================
set /p downloadChoice=Choose an option (1-6): 

if "%downloadChoice%"=="1" goto onion_browser_download
if "%downloadChoice%"=="2" goto duckduckgo_browser_download
if "%downloadChoice%"=="3" goto placeholder_download_3
if "%downloadChoice%"=="4" goto placeholder_download_4
if "%downloadChoice%"=="5" goto placeholder_download_5
if "%downloadChoice%"=="6" goto menu

echo Invalid choice. Please try again.
pause
goto downloads

:onion_browser_download
cls
echo You have chosen to download the Onion Browser.
echo The Onion Browser is designed to help you access the dark web safely and privately.
echo It anonymizes your internet traffic, ensuring that your online activities remain confidential.
echo With this browser, you can access websites that are not indexed by traditional search engines.
echo It also helps protect your identity by routing your connection through multiple servers.
echo 
echo Key Features:
echo 1. Enhanced Privacy: The Onion Browser routes your internet connection through multiple servers, making it difficult to trace your online activities.
echo 2. Access to .onion Sites: This browser allows you to access sites that are only available on the dark web, providing a unique browsing experience.
echo 3. Built-in Security: The browser comes with built-in security features that protect against tracking and surveillance.
echo 4. Open-source Software: Being open-source ensures that the software is regularly updated and audited by the community for security vulnerabilities.
echo 
echo Are you sure you want to proceed with the download? (Y/N)
set /p confirm=Choose an option: 
if /i "%confirm%"=="Y" (
    start "" "https://www.torproject.org/dist/torbrowser/13.5.2/tor-browser-windows-x86_64-portable-13.5.2.exe"
    echo Step-by-step instructions for downloading the Onion Browser will now open.
    (
        echo Instructions for Downloading the Onion Browser
        echo.
        echo 1. Click on the download link provided.
        echo 2. Save the installer file to your computer.
        echo 3. Locate the downloaded file in your Downloads folder.
        echo 4. Double-click the installer to start the installation process.
        echo 5. Follow the on-screen instructions to complete the installation.
        echo 6. Launch the Onion Browser after installation.
        echo 7. Configure the browser settings according to your privacy needs.
        echo 8. Always use the Onion Browser to access .onion sites for enhanced security.
        echo 9. Be mindful of the websites you visit, even on the dark web.
        echo 10. Keep your browser updated to ensure the latest privacy features are applied.
    ) > "%downloadInstructionsFile%"
    start notepad.exe "%downloadInstructionsFile%"
) else (
    echo Download canceled.
)
pause
goto menu

:duckduckgo_browser_download
cls
echo You have chosen to download the DuckDuckGo Browser.
echo DuckDuckGo Browser is designed to provide a private browsing experience.
echo It blocks trackers and ads while keeping your search history private.
echo You can easily switch to DuckDuckGo for your searches and enjoy enhanced privacy.
echo This browser is perfect for those who value security and anonymity online.
echo 
echo Key Features:
echo 1. Privacy by Default: DuckDuckGo does not track your searches or store your personal data, ensuring a private browsing experience.
echo 2. Tracker Blocking: The browser actively blocks trackers from advertisers and other companies, preventing them from following you online.
echo 3. Instant Answers: DuckDuckGo offers instant answers to queries without tracking your searches.
echo 4. Encrypted Connections: The browser automatically tries to connect to the HTTPS version of websites for secure browsing.
echo 5. User-friendly Interface: The simple and clean interface makes navigation easy and enjoyable.
echo 
echo Are you sure you want to continue with the download? (Y/N)
set /p confirm=Choose an option: 
if /i "%confirm%"=="Y" (
    start "" "https://staticcdn.duckduckgo.com/windows-desktop-browser/installer/funnel_app_paidsearchmicrosoft_keywords_browser/DuckDuckGo.appinstaller"
    echo Step-by-step instructions for downloading the DuckDuckGo Browser will now open.
    (
        echo Instructions for Downloading the DuckDuckGo Browser
        echo.
        echo 1. Click on the download link provided.
        echo 2. Save the installer file to your computer.
        echo 3. Locate the downloaded file in your Downloads folder.
        echo 4. Double-click the installer to start the installation process.
        echo 5. Follow the on-screen instructions to complete the installation.
        echo 6. Launch the DuckDuckGo Browser after installation.
        echo 7. Set DuckDuckGo as your default search engine if desired.
        echo 8. Explore the browser's settings to enhance your privacy preferences.
        echo 9. Use the browser to search the web without being tracked.
        echo 10. Regular updates ensure that you benefit from the latest privacy features.
    ) > "%downloadInstructionsFile%"
    start notepad.exe "%downloadInstructionsFile%"
) else (
    echo Download canceled.
)
pause
goto menu

:placeholder_download_3
cls
echo You have chosen Placeholder Download 3.
echo This option is currently not available.
pause
goto menu

:placeholder_download_4
cls
echo You have chosen Placeholder Download 4.
echo This option is currently not available.
pause
goto menu

:placeholder_download_5
cls
echo You have chosen Placeholder Download 5.
echo This option is currently not available.
pause
goto menu

:lyrics_password
cls
echo ========================================
echo                 Lyrics
echo ========================================
set /p password=Input password to get access: 
if "%password%"=="LisaHasAPhatAss" goto lyrics_menu
echo Incorrect password. Access denied.
pause
goto menu

:lyrics_menu
cls
echo ========================================
echo                 Lyrics
echo ========================================
echo Choose a song to see the lyrics:
echo 1. Numb the pain by x-
echo 2. A message to Tiny Belcher
echo 3. Go Back
set /p songChoice=Enter the number of the song (1, 2, or 3): 

if "%songChoice%"=="1" goto numb_the_pain
if "%songChoice%"=="2" goto message_to_tiny_belcher
if "%songChoice%"=="3" goto menu
goto lyrics_menu

:numb_the_pain
cls
echo Song: Numb the pain by x-
echo It just keeps me wonderin', this goddamn silence
echo It just keeps me goin' insane
echo Numb the pain like I was Novocaine
echo Numb the pain, pain
echo It just keeps me wonderin', this goddamn silence
echo It just keeps me goin' insane
echo Numb the pain like I was Novocaine
echo Numb the pain, pain
echo It just keeps me wonderin', this goddamn silence
echo It just keeps me goin' insane
echo Numb the pain like I was Novocaine
echo Numb the pain, pain
pause
goto lyrics_menu

:message_to_tiny_belcher
cls
echo Song: A message to Tiny Belcher
echo I dream so much
echo And I just can't seem to find an answer
echo To what I'm looking for, in general
echo I can't keep living like this
echo It's breaking my heart, day by day
echo I mean, who's to say...
echo Who's to say you find an answer when living?
echo What if you just die?
echo What if life as we know it is all a game?
echo What if we live for no reason?
echo What if you just disappear when you die?
echo Should I cling to life
echo Or should I just kill myself?
echo So many contradictions, contemplations
echo It's getting harder and harder to mask my pain
echo I can't tell if I wanna live or if I wanna die
echo Please, save me
pause
goto lyrics_menu

:search
cls
echo 1. Google Chrome
echo 2. Avast Secure Browser
echo 3. Default Browser
set /p browserChoice=Choose a browser (1, 2, or 3): 

set "browserPath="
if "%browserChoice%"=="1" set "browserPath=%chromePath%"
if "%browserChoice%"=="2" set "browserPath=%avastPath%"
if "%browserChoice%"=="3" set "browserPath="

set /p url=Enter the URL you want to open: 
if not "%url%"=="" echo %url% >> "%recentFile%"

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
    taskkill /im chrome.exe /f >nul 2>&1
    taskkill /im opera.exe /f >nul 2>&1
    taskkill /im discord.exe /f >nul 2>&1
    taskkill /im firefox.exe /f >nul 2>&1
    taskkill /im msedge.exe /f >nul 2>&1
    taskkill /im avastbrowser.exe /f >nul 2>&1

    :: Create a temporary file with the message
    echo Completed > "%temp%\completed.txt"

    :: Start Notepad with the temporary file
    start "" notepad.exe "%temp%\completed.txt"

    :: Put PC to sleep
    rundll32.exe powrprof.dll,SetSuspendState 0,1,0

    pause
) else (
    echo Sleep action canceled.
)
goto menu

:empty_recycle_bin
cls
echo WARNING: This will permanently delete all items in the Recycle Bin.
echo Are you sure you want to proceed? (Y/N)
set /p confirm=Choose an option: 
if /i "%confirm%"=="Y" (
    echo Emptying Recycle Bin...
    rd /s /q %systemdrive%\$Recycle.Bin
    echo Recycle Bin emptied.
    pause
) else (
    echo Action canceled.
)
goto menu

:get_last_boot_time
cls
systeminfo | find /i "Boot Time"
pause
goto menu

:destroy
cls
echo Closing Discord and exiting the tool...
taskkill /im discord.exe /f
exit /b

:lock_screen
cls
echo Locking the screen...
rundll32.exe user32.dll, LockWorkStation
goto menu

:visit_github
start "" "https://github.com/Noxx026/Noxx-Ways-"
goto menu

:my_notes
cls
echo Encyclopedia (personally made for Lisa)
echo ========================================
echo 1. Add a Note
echo 2. View Notes
echo 3. Delete a Note
echo 4. Back to Main Menu
echo ========================================
set /p notesChoice=Choose an option (1, 2, 3, or 4): 

if "%notesChoice%"=="1" goto add_note
if "%notesChoice%"=="2" goto view_notes
if "%notesChoice%"=="3" goto delete_note
if "%notesChoice%"=="4" goto menu
goto my_notes

:add_note
cls
set /p noteContent=Enter the note content: 
echo %noteContent% >> "%notesFile%"
echo Note added.
pause
goto my_notes

:view_notes
cls
if exist "%notesFile%" (
    echo Notes:
    setlocal enabledelayedexpansion
    set /a lineCounter=0
    for /f "tokens=*" %%i in ('type "%notesFile%"') do (
        set /a lineCounter+=1
        echo !lineCounter!. %%i
    )
    endlocal
) else (
    echo No notes found.
)
pause
goto my_notes

:delete_note
cls
if exist "%notesFile%" (
    echo Notes:
    setlocal enabledelayedexpansion
    set /a lineCounter=0
    for /f "tokens=*" %%i in ('type "%notesFile%"') do (
        set /a lineCounter+=1
        echo !lineCounter!. %%i
    )
    echo.
    set /p deleteNoteLine=Enter the line number of the note to delete: 
    set /a lineToDelete=%deleteNoteLine%
    set /a lineCounter=0
    for /f "tokens=*" %%i in ('type "%notesFile%"') do (
        set /a lineCounter+=1
        if !lineCounter! neq !lineToDelete! echo %%i >> "%notesFile%.tmp"
    )
    move /y "%notesFile%.tmp" "%notesFile%"
    echo Note deleted.
) else (
    echo No notes found.
)
pause
goto my_notes

:block_website
cls
echo Opening the hosts file for editing. This requires administrator privileges.
echo You need special permissions to access restricted parts of your Windows system.
echo Please confirm if you want to continue.
set /p confirm=Proceed with opening hosts file? (Y/N): 
if /i "%confirm%"=="Y" (
    :: Instructions for using the hosts file
    (
        echo Instructions for Editing the Hosts File
        echo.
        echo 1. The hosts file is located at C:\Windows\System32\drivers\etc\hosts.
        echo 2. Use this file to block websites by mapping their domain names to 127.0.0.1.
        echo 3. Open the hosts file in Notepad with Administrator privileges.
        echo 4. Add entries in the format: 127.0.0.1 www.example.com
        echo 5. To block multiple subdomains, use wildcards like: 127.0.0.1 *.example.com
        echo 6. Save your changes to the hosts file.
        echo 7. Flush the DNS cache to apply the changes: open Command Prompt and type 'ipconfig /flushdns'.
        echo 8. To unblock a site, simply remove the corresponding line from the hosts file.
        echo 9. Always back up the original hosts file before making changes.
        echo 10. Be careful with entries to avoid blocking important sites accidentally.
    ) > "%temp%\hosts_instructions.txt"
    
    :: Use PowerShell to open the hosts file in Notepad with elevated permissions
    PowerShell -Command "Start-Process cmd -ArgumentList '/c notepad.exe C:\Windows\System32\drivers\etc\hosts' -Verb RunAs"
    start notepad.exe "%temp%\hosts_instructions.txt"  :: Open the instructions in another Notepad window
    echo Hosts file opened successfully. Please make your changes and save.
    pause
) else (
    echo Action canceled.
)
goto menu