# Fresh-Install-Script
A batch and a python script that manages to download programs on a fresh Windows system.
It also prevents Windows Update from making automatic downloads such as video card drivers by stopping Windows Update Service and changing your windows power plan.

**Make sure to run install_all.bat under Admin mode and that your Windows image is at least based on Build 17063<br>
 otherwise will you probably face some errors and it will not work**.

# Selecting the desired programs
The desired programs to be downloaded and installed can be selected by changing the chocolatey command line located at install_all.bat
I also recommend you to also check Chocolatey website and documentation before editing it. It's the effort :) 
https://chocolatey.org/

#
### TO-DO

- [ ] Make it more separate with multiples batch files.
- [ ] Update VC++ All-In-One Redistributables link before download it.
- [ ] Maybe add it to A99 project. 
