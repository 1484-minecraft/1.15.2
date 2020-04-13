@echo off

set server="minecraft"

:: ENTER
SendMessage.exe /windowtitle:%server% /message:WM_CHAR /wparam:13 /lparam:1

::Sending shutdown command
echo Sending save-all command to server: %server%
::s
SendMessage.exe /windowtitle:%server% /message:WM_CHAR /wparam:115 /lparam:1
::a
SendMessage.exe /windowtitle:%server% /message:WM_CHAR /wparam:97 /lparam:1
::v
SendMessage.exe /windowtitle:%server% /message:WM_CHAR /wparam:118 /lparam:1
::e
SendMessage.exe /windowtitle:%server% /message:WM_CHAR /wparam:101 /lparam:1
::-
SendMessage.exe /windowtitle:%server% /message:WM_CHAR /wparam:45 /lparam:1
::a
SendMessage.exe /windowtitle:%server% /message:WM_CHAR /wparam:97 /lparam:1
::l
SendMessage.exe /windowtitle:%server% /message:WM_CHAR /wparam:108 /lparam:1
::l
SendMessage.exe /windowtitle:%server% /message:WM_CHAR /wparam:108 /lparam:1
:: ENTER
SendMessage.exe /windowtitle:%server% /message:WM_CHAR /wparam:13 /lparam:1

@ping 127.0.0.1 -n 2 -w 5000 > nul
echo Done

::Sending shutdown command
echo Sending shutdown command to server: %server%
::s
SendMessage.exe /windowtitle:%server% /message:WM_CHAR /wparam:115 /lparam:1
::t
SendMessage.exe /windowtitle:%server% /message:WM_CHAR /wparam:116 /lparam:1
::o
SendMessage.exe /windowtitle:%server% /message:WM_CHAR /wparam:111 /lparam:1
::p
SendMessage.exe /windowtitle:%server% /message:WM_CHAR /wparam:112 /lparam:1
:: ENTER
SendMessage.exe /windowtitle:%server% /message:WM_CHAR /wparam:13 /lparam:1

:loop
For /f "Delims=:" %%A in ('tasklist /fi "WINDOWTITLE eq minecraft"') do SET OUTPUT=%%A
::FOR /F "tokens=*" %%a in ('tasklist /fi "WINDOWTITLE eq minecraft"') do SET OUTPUT=%%a
@ping 127.0.0.1 -n 2 -w 500 > nul
if not "%OUTPUT:java=%" == "%OUTPUT%" goto loop

echo Done

git config user.name 1484-minecraft
git config user.email angelus2003611@gmail.com
git add --all
git commit -m 'update'
git push https://1484-minecraft:staythefuckathome@github.com/1484-minecraft/1.15.2

echo Done

PAUSE