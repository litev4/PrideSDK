@echo off
title Pride Client Uninstaller alpha v1.1
whoami /groups | find "S-1-16-12288" && goto menu
del /f /s /q %appdata%\PInstaller\*.*
cls
echo.
echo  ��⵽��û��ʹ�ù���Ա������� Pride Client Uninstaller .
echo  ��ʹ�ù���Ա������� Pride Client Uninstaller , �����޷�ж�� ��
echo.
echo ��������˳� Pride Client Uninstaller .
pause>nul
exit
:menu
taskkill /f /im Pride.exe
cls
echo.
echo  ��������Ҫж�ص��� " Pride Client VulkanMod Test ( MC 1.19.4 ) "
echo.
echo   -���� "Y" ж�� .
echo   -���� "N" �˳� Pride Client Uninstaller .
echo.
set /p c=������ѡ�� : 
if %c%==Y goto Uninstall
if %c%==N goto Quit
if %c%==y goto Uninstall
if %c%==n goto Quit
if %c%==%c% goto what
:what
echo.
echo ����ѡ���Ǵ���� ����û��ѡ�� !
echo.
ping 127.0.0.0 -n 2 >nul
goto menu
:Uninstall
del /f /s /q %appdata%\Installer.bat
del /f /s /q %appdata%\.pridemc
del /f /s /q "%systemdrive%\ProgramData\Microsoft\Windows\Start Menu\Programs\Pride Client"
del /f /s /q "%systemdrive%\Users\Public\desktop\Pride Client.lnk"
rmdir "%systemdrive%\ProgramData\Microsoft\Windows\Start Menu\Programs\Pride Client"
ping 127.0.0.1 -n 2 >nul
cls
echo.
echo  ж������� ,
echo  ��������˳� Pride Client Uninstaller .
echo.
pause>nul
exit
:Quit
exit