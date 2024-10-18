batch
@echo off
setlocal enabledelayedexpansion

:: Define the log folder and log files with organized names
set "logFolder=MyDreamLogs"
set "logFile=%logFolder%\Regular_Dreams_Log.txt"  :: Organized file name for regular dreams
set "interpretationFile=%logFolder%\Regular_Dreams_Interpretations.txt"  :: Organized file name for regular dreams interpretations
set "spLogFile=%logFolder%\Sleep_Paralysis_Dreams_Log.txt"  :: Organized file name for sleep paralysis dreams
set "spInterpretationFile=%logFolder%\Sleep_Paralysis_Interpretations_Log.txt"  :: Organized file name for sleep paralysis interpretations

:: Create log folder if it doesn't exist
if not exist "%logFolder%" (
    mkdir "%logFolder%"
)

:: Main loop
:Main
cls
echo Welcome to MyDreams!
echo.
echo In this program, you will be asked a few questions about your dreams.
echo Your responses will be recorded in a text file for future reference.
echo.
echo Please choose an option:
echo 1. Record a new dream
echo 2. Record a sleep paralysis dream
echo 3. View dream logs
echo 4. View sleep paralysis logs
echo 5. Remove all dream data
echo 6. Exit
set /p choice="Enter your choice (1, 2, 3, 4, 5, or 6): "

if "%choice%"=="1" (
    goto RecordDream
) else if "%choice%"=="2" (
    goto RecordSleepParalysisDream
) else if "%choice%"=="3" (
    goto ViewDreamLogs
) else if "%choice%"=="4" (
    goto ViewSleepParalysisLogs
) else if "%choice%"=="5" (
    goto RemoveAllDreamData
) else if "%choice%"=="6" (
    exit
) else (
    echo Invalid choice. Please try again.
    pause
    goto Main
)

:: Function to display regular dream logs
:ViewDreamLogs
cls
if exist "%logFile%" (
    echo Here are your regular dream logs:
    echo.
    type "%logFile%"
) else (
    echo No regular dream logs found.
)
pause
goto Main

:: Function to display sleep paralysis logs
:ViewSleepParalysisLogs
cls
if exist "%spLogFile%" (
    echo Here are your sleep paralysis dream logs:
    echo.
    type "%spLogFile%"
) else (
    echo No sleep paralysis dream logs found.
)
pause
goto Main

:RecordDream
cls
echo Let's record your dream!
echo.

:: Get dream details
set /p dreamName="What would you like to name your dream? "
set /p dreamDescription="What did you dream about last night? "
set /p dreamMood="Was it scary or happy? (type 'scary' or 'happy'): "
set /p dreamType="Was it a lucid dream or a regular dream? "
set /p repeatingDream="Is it a repeating dream? (yes or no): "
set /p sleepParalysis="Did you experience sleep paralysis? (yes or no): "
set /p dreamSetting="What was the setting of the dream? (e.g., forest, city, house): "
set /p dreamCharacters="Who were the main characters in your dream? (e.g., friends, family, strangers): "
set /p dreamSymbols="Did you notice any symbols or themes in your dream? (e.g., flying, water, animals): "
set /p dreamDuration="How long do you think the dream lasted? (e.g., a few minutes, hours): "
set /p dreamTime="What time of night do you think you had this dream? "
set /p dreamEmotions="What emotions did you feel during the dream? "
set /p postDreamFeelings="How did you feel when you woke up from the dream? "
set /p dreamRecurrence="Is this dream something you've experienced before? (yes or no): "
set /p dreamActions="What actions were you taking in the dream? "
set /p unusualElements="Was there anything unusual or unexpected in the dream? "

:: Get current date and time
for /f "tokens=1-3 delims= " %%a in ('date /t') do set "currentDate=%%a %%b %%c"
for /f "tokens=1-2 delims=:" %%a in ('time /t') do set "currentTime=%%a:%%b"

:: Write to the log file
(
    echo ============================
    echo Date: !currentDate! Time: !currentTime!
    echo Dream Name: !dreamName!
    echo Dream Description: !dreamDescription!
    echo Mood: !dreamMood!
    echo Type: !dreamType!
    echo Repeating Dream: !repeatingDream!
    echo Sleep Paralysis: !sleepParalysis!
    echo Setting: !dreamSetting!
    echo Characters: !dreamCharacters!
    echo Symbols/Themes: !dreamSymbols!
    echo Duration: !dreamDuration!
    echo Time of Night: !dreamTime!
    echo Emotions During Dream: !dreamEmotions!
    echo Post-Dream Feelings: !postDreamFeelings!
    echo Dream Recurrence: !dreamRecurrence!
    echo Actions Took Place: !dreamActions!
    echo Unusual Elements: !unusualElements!
    echo ============================
    echo.
) >> "%logFile%"

:: Generate interpretation
set "interpretation=Based on your inputs, it seems that your dream about '!dreamName!' reflects your emotional state and life experiences. "

if /i "!dreamMood!"=="scary" (
    set "interpretation=!interpretation! You may be facing fears or anxiety in your waking life, which often manifests in dreams as unsettling scenarios."
) else (
    set "interpretation=!interpretation! This dream may reflect feelings of happiness and contentment, suggesting a positive outlook or a need for joy."
)

if /i "!dreamType!"=="lucid" (
    set "interpretation=!interpretation! Embracing your awareness in the dream can lead to personal growth and a deeper understanding of your subconscious."
)

if /i "!repeatingDream!"=="yes" (
    set "interpretation=!interpretation! Repeating dreams often indicate unresolved issues or lessons that your mind is trying to address."
)

if /i "!sleepParalysis!"=="yes" (
    set "interpretation=!interpretation! Experiencing sleep paralysis may symbolize stress or a feeling of being trapped in your life circumstances."
)

set "interpretation=!interpretation! The setting of '!dreamSetting!' and the characters you encountered could also hold significance, revealing aspects of your relationships or environments that are affecting you."

:: Write interpretation to the interpretation file
(
    echo ============================
    echo Date: !currentDate! Time: !currentTime!
    echo Dream Name: !dreamName!
    echo Dream Interpretation: !interpretation!
    echo ============================
    echo.
) >> "%interpretationFile%"

echo Your dream has been recorded and interpreted!
pause
goto Main

:RecordSleepParalysisDream
cls
echo Let's record your sleep paralysis dream!
echo.

:: Get sleep paralysis dream details
set /p spDreamName="What would you like to name your sleep paralysis dream? "
set /p spExperience="Describe your experience during sleep paralysis: "
set /p spFearLevel="On a scale of 1-10, how scared were you? "
set /p spDuration="How long did the paralysis last? (e.g., a few seconds, minutes): "
set /p spVisuals="Did you see any visuals during the paralysis? (e.g., shadow figures, lights): "
set /p spAuditory="Did you hear any sounds during the paralysis? (e.g., voices, noises): "
set /p spPhysicalFeelings="What physical sensations did you experience? (e.g., pressure on chest, tingling): "
set /p spAwareness="Were you aware that you were dreaming? (yes or no): "
set /p spMovementAttempts="Did you try to move? If so, what happened? "
set /p spWakingUp="How did you wake up from the paralysis? "
set /p spLocation="Where were you when this happened? "
set /p spTimeOfNight="What time of night do you think it happened? "
set /p spFrequency="How often do you experience sleep paralysis? (e.g., occasionally, frequently): "
set /p spTriggers="Do you have any known triggers for your sleep paralysis? (e.g., stress, sleep position): "
set /p spDreamState="Were you in a dream state before the paralysis? (yes or no): "
set /p spLucidDreaming="Did you experience any lucid dreaming during the episode? (yes or no): "
set /p spFeelingsPostParalysis="How did you feel after the episode? "
set /p spPhysicalAftermath="Did you feel any physical aftermath after waking? (e.g., exhaustion, relief): "
set /p spCopingMethods="What methods do you use to cope with sleep paralysis? "
set /p spFamilyDiscussion="Have you discussed your experiences with family or friends? (yes or no): "
set /p spAdvice="What advice would you give someone experiencing sleep paralysis? "

:: Get current date and time
for /f "tokens=1-3 delims= " %%a in ('date /t') do set "currentDate=%%a %%b %%c"
for /f "tokens=1-2 delims=:" %%a in ('time /t') do set "currentTime=%%a:%%b"

:: Write to the sleep paralysis log file
(
    echo ============================
    echo Date: !currentDate! Time: !currentTime!
    echo Sleep Paralysis Dream Name: !spDreamName!
    echo Experience: !spExperience!
    echo Fear Level: !spFearLevel!
    echo Duration: !spDuration!
    echo Visuals: !spVisuals!
    echo Auditory: !spAuditory!
    echo Physical Sensations: !spPhysicalFeelings!
    echo Awareness: !spAwareness!
    echo Movement Attempts: !spMovementAttempts!
    echo Waking Up: !spWakingUp!
    echo Location: !spLocation!
    echo Time of Night: !spTimeOfNight!
    echo Frequency: !spFrequency!
    echo Triggers: !spTriggers!
    echo Dream State: !spDreamState!
    echo Lucid Dreaming: !spLucidDreaming!
    echo Feelings After Paralysis: !spFeelingsPostParalysis!
    echo Physical Aftermath: !spPhysicalAftermath!
    echo Coping Methods: !spCopingMethods!
    echo Family Discussion: !spFamilyDiscussion!
    echo Advice: !spAdvice!
    echo ============================
    echo.
) >> "%spLogFile%"

:: Generate interpretation for sleep paralysis
set "spInterpretation=Your experience of sleep paralysis named '!spDreamName!' reflects the complex interplay of your mind and body under stress. "

if /i "!spAwareness!"=="yes" (
    set "spInterpretation=!spInterpretation! Being aware during the episode may indicate a strong connection to your subconscious thoughts."
)

if !spFearLevel! geq 7 (
    set "spInterpretation=!spInterpretation! A high fear level suggests that you may be dealing with significant anxiety or stress in your waking life that needs addressing."
)

if /i "!spFrequency!"=="frequently" (
    set "spInterpretation=!spInterpretation! Experiencing this often could mean that your body is reacting to prolonged stress or lifestyle changes."
)

if "!spTriggers!" NEQ "" (
    set "spInterpretation=!spInterpretation! Identifying triggers can help you manage these episodes better and potentially reduce their frequency."
)

:: Write interpretation to the sleep paralysis interpretation file
(
    echo ============================
    echo Date: !currentDate! Time: !currentTime!
    echo Sleep Paralysis Dream Name: !spDreamName!
    echo Sleep Paralysis Interpretation: !spInterpretation!
    echo ============================
    echo.
) >> "%spInterpretationFile%"

echo Your sleep paralysis dream has been recorded and interpreted!
pause
goto Main

:RemoveAllDreamData
cls
echo WARNING: This action will remove all of your dream data.
echo This includes:
echo - All recorded regular dreams
echo - All recorded sleep paralysis dreams
echo - Any interpretations associated with both
echo.
echo You will lose all of your progress. If you wish to continue, please type the following:
echo "I agree to the Noxx of the united stated of america to remove all my dream data because I wish to no longer have it no more foo"
set /p confirmation="Type your confirmation here: "

if "%confirmation%"=="I agree to the Noxx of the united stated of america to remove all my dream data because I wish to no longer have it no more foo" (
    echo Deleting all dream data...
    del "%logFile%" 2>nul
    del "%interpretationFile%" 2>nul
    del "%spLogFile%" 2>nul
    del "%spInterpretationFile%" 2>nul
    echo All dream data has been successfully removed!
) else (
    echo Confirmation not received. No data has been deleted.
)

pause
goto Main