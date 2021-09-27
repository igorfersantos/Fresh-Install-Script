@echo off

net stop "Windows Update"

powercfg -s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c

@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

choco install -y python

python -m pip install --upgrade pip
pip install tqdm
pip install requests

python downloadPrograms.py

REM ----ESSENTIAL-----
choco install -y vcredist-all

REM ----CHAT----
choco install -y discord 

REM ----UTILS----
choco install -y imageglass msiafterburner 7zip notepadplusplus winrar thunderbird revo-uninstaller obs-studio vlc k-litecodecpackfull

REM ----GAMES RELATED----
choco install -y twitch steam origin epicgameslauncher

REM ----INTERNET----
choco install -y firefox microsoft-edge googlechrome

REM ----DEV----
choco install -y pycharm-community intellijidea-community visualstudio2019community vscode jdk8 jre8 github-desktop postman openjdk
malwarebytes 
