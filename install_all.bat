@echo off

net stop "Windows Update"

powercfg -s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c

@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

cinst -y python

python -m pip install --upgrade pip
pip install tqdm
pip install requests

python downloadPrograms.py

cinst -y discord imageglass malwarebytes pycharm-community twitch msiafterburner revo-uninstaller obs-studio playnite steam origin intellijidea-community visualstudio2019community epicgameslauncher vscode firefox googlechrome jdk8 jre8 7zip notepadplusplus github-desktop winrar postman vlc k-litecodecpackfull thunderbird openjdk
