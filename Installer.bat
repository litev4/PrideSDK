@echo off
title ���԰氲װ��
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
echo  ��⵽��û��ʹ�ù���Ա������� Pride Client Installer .
echo  ��ʹ�ù���Ա������� Pride Client Installer , �����޷�������װ��
echo.
echo ��������˳� Pride Client Installer .
pause>nul
exit
:isadmin
if exist "%appdata%\.pridemc\Pride.exe" goto Installed
if exist "%appdata%\PInstaller\Launcher.pride" goto first_install
cls
echo.
echo  ��⵽ Pride Client ��װ�ļ�ȱʧ .
echo  ���������� Pride Client Installer , ����޷��޸� , ���������� Pride Client Installer .
echo.
echo ��������˳� Pride Client Installer .
pause>nul
exit
:first_install
cls
echo.
echo  ��������Ҫ��װ���� " Pride Client VulkanMod Test ( MC 1.19.4 ) "
echo.
echo   -���� "Y" ��װ .
echo   -���� "N" �˳� Pride Client Installer .
echo.
set /p c=������ѡ�� : 
if %c%==Y goto Install
if %c%==y goto Install
if %c%==N goto Quit
if %c%==n goto Quit
if %c%==%c% goto what
if %c%== goto what
:what
echo.
echo ����ѡ���Ǵ���� ����û��ѡ�� !
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
echo  ��װ����� ,
echo  ��������˳� Pride Client Installer .
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
echo  ��װ���˳� ,
echo  ��������˳� Pride Client Installer .
echo.
pause>nul
exit
:Installed
cls
echo.
echo  ��⵽���Ѿ���װ�� Pride Client , ������������Ҫ��ʲô ? 
echo.
echo   - ( 1 ) ж�� Pride Client .
echo   - ( 2 ) ���°�װ Pride Client .
echo   - ( 3 ) �˳� Pride Client Installer .
echo.
set /p m=������ѡ�� : 
if %m%==1 goto uninst
if %m%==2 goto reinst
if %m%==3 goto Quit
if %m%==%m% goto what2
if %m%== goto what2
:what2
echo.
echo ����ѡ���Ǵ���� ����û��ѡ�� !
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