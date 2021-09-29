@echo off

net stop wuauserv

powercfg -s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c

@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

start "Installing VC++ Runtimes All-in-One" cmd.exe @cmd /k "curl -o ./vc-all/vc-all.zip https://us6-dl.techpowerup.com/files/GgKLcA0NM_MtKeunWPdLoQ/1632925613/Visual-C-Runtimes-All-in-One-Jul-2021.zip --create-dirs & tar -xvf ./vc-all/vc-all.zip -C ./vc-all & del .\vc-all\*.zip & call ./vc-all/install_all.bat & pause"

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

python downloadPrograms.py

choco upgrade all -y

net start wuauserv
