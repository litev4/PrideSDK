@echo off
title 测试版安装器
whoami /groups | find "S-1-16-12288" && goto isadmin
del /f /s /q %appdata%\PInstaller\*.*
rmdir %appdata%\PInstaller\Launcher_Config\Pictures
rmdir %appdata%\PInstaller\Launcher_Config
rmdir %appdata%\PInstaller\Link
rmdir %appdata%\PInstaller\MC\PCL
rmdir %appdata%\PInstaller\MC
rmdir %appdata%\PInstaller\Minecraft_Config
rmdir %appdata%\PInstaller\Mods
rmdir %appdata%\PInstaller
cls
echo.
echo  检测到您没有使用管理员身份运行 Pride Client Installer .
echo  请使用管理员身份运行 Pride Client Installer , 否则将无法继续安装！
echo.
echo 按任意键退出 Pride Client Installer .
pause>nul
exit
:isadmin
if exist "%appdata%\.pridemc\Pride.exe" goto Installed
if exist "%appdata%\PInstaller\Launcher.pride" goto first_install
cls
echo.
echo  检测到 Pride Client 安装文件缺失 .
echo  请重新运行 Pride Client Installer , 如果无法修复 , 请重新下载 Pride Client Installer .
echo.
echo 按任意键退出 Pride Client Installer .
pause>nul
exit
:first_install
cls
echo.
echo  您接下来要安装的是 " Pride Client VulkanMod Test ( MC 1.19.4 ) "
echo.
echo   -输入 "Y" 安装 .
echo   -输入 "N" 退出 Pride Client Installer .
echo.
set /p c=请输入选择 : 
if %c%==Y goto Install
if %c%==y goto Install
if %c%==N goto Quit
if %c%==n goto Quit
if %c%==%c% goto what
if %c%== goto what
:what
echo.
echo 您的选择是错误的 或者没有选择 !
echo.
ping 127.0.0.0 -n 2 >nul
goto isadmin
:Install
mkdir "%appdata%\.pridemc\.minecraft\versions\Pride 1.19\config"
mkdir "%appdata%\.pridemc\.minecraft\versions\Pride 1.19\mods"
mkdir "%appdata%\.pridemc\.minecraft\versions\Pride 1.19\PCL"
mkdir "%appdata%\.pridemc\.minecraft\versions\Pride 1.19\resourcepacks"
mkdir "%appdata%\.pridemc\PCL\Pictures"
mkdir "%systemdrive%\ProgramData\Microsoft\Windows\Start Menu\Programs\Pride Client"
xcopy %appdata%\PInstaller\Launcher.pride "%appdata%\.pridemc" /a
rename "%appdata%\.pridemc\Launcher.pride" Pride.exe
xcopy %appdata%\PInstaller\MC\PCL\Setup.ini "%appdata%\.pridemc\.minecraft\versions\Pride 1.19\PCL" /a
rename "%appdata%\PInstaller\Font.pride" FontPack.zip
xcopy "%appdata%\PInstaller\FontPack.zip" "%appdata%\.pridemc\.minecraft\versions\Pride 1.19\resourcepacks" /a
xcopy %appdata%\PInstaller\Launcher_Config "%appdata%\.pridemc\PCL" /a
xcopy %appdata%\PInstaller\Launcher_Config\Pictures "%appdata%\.pridemc\PCL\Pictures" /a
xcopy %appdata%\PInstaller\Minecraft_Config "%appdata%\.pridemc\.minecraft\versions\Pride 1.19\config" /a
xcopy %appdata%\PInstaller\MC "%appdata%\.pridemc\.minecraft\versions\Pride 1.19" /a
xcopy %appdata%\PInstaller\Mods "%appdata%\.pridemc\.minecraft\versions\Pride 1.19\mods" /a
xcopy %appdata%\PInstaller\Link "%systemdrive%\ProgramData\Microsoft\Windows\Start Menu\Programs\Pride Client" /a
xcopy "%appdata%\PInstaller\Link\Pride Client.lnk" %systemdrive%\Users\Public\desktop /a
del /f /s /q %appdata%\PInstaller\*.*
rmdir %appdata%\PInstaller\Launcher_Config\Pictures
rmdir %appdata%\PInstaller\Launcher_Config
rmdir %appdata%\PInstaller\Link
rmdir %appdata%\PInstaller\MC\PCL
rmdir %appdata%\PInstaller\MC
rmdir %appdata%\PInstaller\Minecraft_Config
rmdir %appdata%\PInstaller\Mods
rmdir %appdata%\PInstaller
ping 127.0.0.1 -n 2 >nul
cls
echo.
echo  安装已完成 ,
echo  按任意键退出 Pride Client Installer .
echo.
pause>nul
exit
:Quit
del /f /s /q %appdata%\PInstaller\*.*
rmdir %appdata%\PInstaller\Launcher_Config\Pictures
rmdir %appdata%\PInstaller\Launcher_Config
rmdir %appdata%\PInstaller\Link
rmdir %appdata%\PInstaller\MC\PCL
rmdir %appdata%\PInstaller\MC
rmdir %appdata%\PInstaller\Minecraft_Config
rmdir %appdata%\PInstaller\Mods
rmdir %appdata%\PInstaller
cls
echo.
echo  安装已退出 ,
echo  按任意键退出 Pride Client Installer .
echo.
pause>nul
exit
:Installed
cls
echo.
echo  检测到您已经安装了 Pride Client , 请问您接下来要做什么 ? 
echo.
echo   - ( 1 ) 卸载 Pride Client .
echo   - ( 2 ) 重新安装 Pride Client .
echo   - ( 3 ) 退出 Pride Client Installer .
echo.
set /p m=请输入选择 : 
if %m%==1 goto uninst
if %m%==2 goto reinst
if %m%==3 goto Quit
if %m%==%m% goto what2
if %m%== goto what2
:what2
echo.
echo 您的选择是错误的 或者没有选择 !
echo.
ping 127.0.0.0 -n 2 >nul
goto Installed
:reinst
del /f /s /q %appdata%\.pridemc
del /f /s /q "%systemdrive%\ProgramData\Microsoft\Windows\Start Menu\Programs\Pride Client"
del /f /s /q "%systemdrive%\Users\Public\desktop\Pride Client.lnk"
rmdir "%systemdrive%\ProgramData\Microsoft\Windows\Start Menu\Programs\Pride Client"
goto Install
:uninst
start %appdata%\Uninstaller.bat
exit