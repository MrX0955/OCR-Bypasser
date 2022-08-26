@echo off
:: BatchGotAdmin
:-------------------------------------
REM --> İzin kontrolü yapılıyor
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
REM --> Eget hata alınırsa yönetici değiliz demektir.
if '%errorlevel%' NEQ '0' (
echo Administrator izni isteniyor... \\ MrX
goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
set params = %*:"=""
echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
del "%temp%\getadmin.vbs"
exit /B
:gotAdmin
pushd "%CD%"
CD /D "%~dp0"
:--------------------------------------
pip install pytesseract
pip install requests
pip install Pillow
start ./Tesseract64bit.exe
exit