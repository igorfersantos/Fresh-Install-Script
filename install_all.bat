@echo off

net stop wuauserv

powercfg -s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c

@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

start "Installing Cloudflare WARP" cmd.exe @cmd /k "curl -o ./downloads/cloudflare-x64.msi https://1.1.1.1/Cloudflare_WARP_Release-x64.msi --create-dirs & msiexec /i "./downloads/cloudflare-x64.msi" & pause"
start "Installing WhatsApp" cmd.exe @cmd /k "curl --create-dirs -o ./downloads/WhatsAppSetup.exe -L https://web.whatsapp.com/desktop/windows/release/x64/WhatsAppSetup.exe & start ./downloads/WhatsAppSetup.exe & pause"
start "Installing Sublime Text 4" cmd.exe @cmd /k "curl --create-dirs -o ./downloads/sublime_text_build_4113_x64_setup.exe  https://download.sublimetext.com/sublime_text_build_4113_x64_setup.exe & start ./downloads/sublime_text_build_4113_x64_setup.exe & pause"

REM ----ESSENTIAL-----
choco install -y nvidia-display-driver geforce-game-ready-driver

REM ----CHAT----
choco install -y discord 

REM ----UTILS----
choco install -y imageglass msiafterburner 7zip notepadplusplus winrar thunderbird revo-uninstaller obs-studio vlc k-litecodecpackfull malwarebytes

REM ----GAMES RELATED----
choco install -y twitch steam origin epicgameslauncher

REM ----INTERNET----
choco install -y firefox microsoft-edge googlechrome

REM ----DEV----
choco install -y git.install python pycharm-community intellijidea-community visualstudio2019community vscode jdk8 jre8 github-desktop postman insomnia-rest-api-client openjdk

REM ----PYTHON SCRIPT----
python -m pip install --upgrade pip
pip install tqdm
pip install requests

start "Installing VC++ Runtimes All-in-One" cmd.exe @cmd /k "python download-vcall-redis.py & tar -xf ./downloads/vc-all.zip -C ./downloads & del .\downloads\*.zip & call ./downloads/install_all.bat & pause"
python downloadPrograms.py

choco upgrade all -y

REM ----CLEANING FILES----
echo Cleaning downloaded files... & RMDIR /Q/S downloads

net start wuauserv
