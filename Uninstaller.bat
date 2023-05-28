@echo off
title Pride Client Uninstaller alpha v1.1
whoami /groups | find "S-1-16-12288" && goto menu
del /f /s /q %appdata%\PInstaller\*.*
cls
echo.
echo  检测到您没有使用管理员身份运行 Pride Client Uninstaller .
echo  请使用管理员身份运行 Pride Client Uninstaller , 否则将无法卸载 ！
echo.
echo 按任意键退出 Pride Client Uninstaller .
pause>nul
exit
:menu
taskkill /f /im Pride.exe
cls
echo.
echo  您接下来要卸载的是 " Pride Client VulkanMod Test ( MC 1.19.4 ) "
echo.
echo   -输入 "Y" 卸载 .
echo   -输入 "N" 退出 Pride Client Uninstaller .
echo.
set /p c=请输入选择 : 
if %c%==Y goto Uninstall
if %c%==N goto Quit
if %c%==y goto Uninstall
if %c%==n goto Quit
if %c%==%c% goto what
:what
echo.
echo 您的选择是错误的 或者没有选择 !
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
echo  卸载已完成 ,
echo  按任意键退出 Pride Client Uninstaller .
echo.
pause>nul
exit
:Quit
exit