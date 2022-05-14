@Echo Off
SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do     rem"') do (
  set "DEL=%%a"
)
:mainmenu
cls
chcp 65001 > nul
color 
title GetHackMii v0.1.0
set ver=0.1.0
echo _________________________________________________________ ______ _____ ____ ___ __ _ 
call :colorEcho 0e "GetHackMii v%ver% "
echo                                                                             ^< f r a n z a g e e k ^>
echo ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾ ‾‾‾‾‾‾ ‾‾‾‾‾ ‾‾‾‾ ‾‾‾ ‾‾ ‾
echo.
echo Welcome to GetHackMii v%ver%! This program is developed by FranzaGeek (github.com/franzageek).
echo GetHackMii is free ^& open-source, and it's licensed under the MIT License.
echo.
call :colorEcho 0f "### ABOUT ###"
echo.
echo      GetHackMii is a simple Batch program that downloads the latest HackMii Installer version and
echo      places it into your SD Card, under the "apps" folder. In this way, the HackMii Installer will
echo      appear in your apps on The Homebrew Channel. So if you want to uninstall or update The Homebrew
echo      Channel, or manage the BootMii installation, you can now do so without using Letterbomb again,
echo      and you can access to the HackMii Installer more easily.
echo.
echo.
call :colorEcho 9f "# Press 1 to begin"
choice /c 1 /n > NUL
if %errorlevel% == 1 goto :start
:start
echo. Please insert your SD Card or the USB Drive with Homebrew Apps in it, then press Enter.
pause > nul
echo.
echo  [**] Attempting to mount the drive...
set /a att_times=0
:detect_drive
set /a att_times=%att_times%+1
if %att_times%==16 (
call :colorEcho c0 "[ERR]"
call :colorEcho 0c " Drive not found. Press ENTER to exit."
pause > NUL
exit
)
setlocal enableDelayedExpansion
set drive=NUL
set counter=-1
set letters=ABDEFGHIJKLMNOPQRSTUVWXYZ
set looking_for=

:detect_drive_2
set /a counter=%counter%+1
set looking_for=!letters:~%counter%,1!
if exist %looking_for%:\apps (
set drive=%looking_for%
goto :found
)

if %looking_for%==Z (
set drive=NUL
call :colorEcho 0c " [NF]" 
echo  Not found. Re-attempting...
set /a counter=-1
timeout /t 1 /nobreak > nul
goto :detect_drive
)

goto detect_drive_2
pause

:found 
call :colorEcho 0a " [OK]"
echo  Found drive %drive%. Proceeding...
echo  [**] Downloading the unzipping tool...
if exist unzip.exe del unzip.exe > NUL
wget https://raw.githubusercontent.com/franzageek/GetHackMii/master/unzip.exe 2>nul
title GetHackMii v0.1.0
call :colorEcho 0a " [OK]"
echo  Done.
echo  [**] Downloading the HackMii Installer...
if exist hackmii_installer.zip del hackmii_installer.zip > NUL 
wget https://raw.githubusercontent.com/franzageek/GetHackMii/master/hackmii_installer.zip 2>nul
title GetHackMii v0.1.0
call :colorEcho 0a " [OK]"
echo  Done.
echo  [**] Extracting...
unzip -o -C hackmii_installer.zip > NUL 
call :colorEcho 0a " [OK]"
echo  Done.
echo  [**] Downloading additional files...
wget https://raw.githubusercontent.com/franzageek/GetHackMii/files/icon.png 2>nul
title GetHackMii v0.1.0
wget https://raw.githubusercontent.com/franzageek/GetHackMii/files/meta.xml 2>nul
title GetHackMii v0.1.0
call :colorEcho 0a " [OK]"
echo  Done.
echo  [**] Recomposing the installer...
move icon.png hackmii_installer > nul 2>&1
move meta.xml hackmii_installer > nul 2>&1 
call :colorEcho 0a " [OK]"
echo  Done.
echo  [**] Moving the installer on %drive%:\apps...
if exist %drive%:\apps\hackmii_installer\ rmdir /S /Q %drive%:\apps\hackmii_installer\ > NUL 
if not exist %drive%:\apps\hackmii_installer mkdir %drive%:\apps\hackmii_installer > NUL 
move %cd%\hackmii_installer\* %drive%:\apps\hackmii_installer\ > nul 2>&1
call :colorEcho 0a " [OK]"
echo  Done.
echo  [**] Verifying...
:verify
set boot=1
set bootmini=1
set icon=1
set meta=1
if exist %drive%:\apps\hackmii_installer\boot.elf set boot=0
if exist %drive%:\apps\hackmii_installer\bootmini.elf set bootmini=0
if exist %drive%:\apps\hackmii_installer\icon.png set icon=0
if exist %drive%:\apps\hackmii_installer\meta.xml set meta=0

if %boot%==1 (
SETLOCAL EnableDelayedExpansion > NUL 
call :colorEcho 0c " [NF]" 
echo  Missing file: "%drive%:\apps\hackmii_installer\boot.elf", tryna re-download it...
wget https://raw.githubusercontent.com/franzageek/GetHackMii/files/boot.elf 2>nul
title GetHackMii v0.1.0
move boot.elf %drive%:\apps\hackmii_installer\ > nul 2>&1
call :colorEcho 03 " [OK]"
echo  "BOOT.ELF" downloaded.
goto :verify
)

if %bootmini%==1 (
SETLOCAL EnableDelayedExpansion > NUL 
call :colorEcho 0c " [NF]"
echo  Missing file: "%drive%:\apps\hackmii_installer\bootmini.elf", tryna re-download it...
wget https://raw.githubusercontent.com/franzageek/GetHackMii/files/bootmini.elf 2>nul
title GetHackMii v0.1.0
move bootmini.elf %drive%:\apps\hackmii_installer\ > nul 2>&1
call :colorEcho 03 " [OK]"
echo  "BOOTMINI.ELF" downloaded.
goto :verify
)

if %icon%==1 (
SETLOCAL EnableDelayedExpansion > NUL 
call :colorEcho 0c " [NF]"
echo  Missing file: "%drive%:\apps\hackmii_installer\icon.png", tryna re-download it...
wget https://raw.githubusercontent.com/franzageek/GetHackMii/files/icon.png 2>nul
title GetHackMii v0.1.0
move icon.png %drive%:\apps\hackmii_installer\ > nul 2>&1
call :colorEcho 03 " [OK]"
echo  "ICON.PNG" downloaded.
goto :verify
)

if %meta%==1 (
SETLOCAL EnableDelayedExpansion > NUL 
call :colorEcho 0c " [NF]"
echo  Missing file: "%drive%:\apps\hackmii_installer\meta.xml", tryna re-download it...
wget https://raw.githubusercontent.com/franzageek/GetHackMii/files/meta.xml 2>nul
title GetHackMii v0.1.0
move meta.xml %drive%:\apps\hackmii_installer\ > nul 2>&1
call :colorEcho 03 " [OK]"
echo  "META.XML" downloaded.
goto :verify
)
call :colorEcho 0a " [OK]"
echo  Verified. All files found.
echo  [**] Cleaning up environment...
if exist .wget-hsts del /F /S /Q .wget-hsts > NUL
if exist %cd%\hackmii_installer\ rmdir /S /Q %cd%\hackmii_installer\ > NUL
if exist hackmii_installer.zip del /F /S /Q hackmii_installer.zip > NUL
if exist unzip.exe del /F /Q /S unzip.exe > NUL 
call :colorEcho 0a " [OK]"
echo  Done.
call :colorEcho 0a " [OK]" 
echo  All the file are in order and ready.
call :colorEcho a0 "[END]" 
call :colorEcho 0a " Process finished with error code 0. Now, you can insert your drive back into your Wii and should see HackMii"
echo.
call :colorEcho 0a "      Installer in your apps on The Homebrew Channel. Thanks for using GetHackMii. Byeeeee"
echo.
echo.
pause 
exit


:colorEcho
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1i

