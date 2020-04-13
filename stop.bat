::@echo off

set server="minecraft"

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
::SendMessage.exe /windowtitle:%server% /message:WM_CHAR /wparam:13 /lparam:1

:loop
FOR /F "tokens=*" %%a in ('tasklist /fi "WINDOWTITLE eq minecraft"') do SET OUTPUT=%%a
::echo "%OUTPUT:java=%"
echo "%OUTPUT%"
@ping 127.0.0.1 -n 2 -w 500 > nul
if not "%OUTPUT:java=%" == "%OUTPUT%" goto loop

git add --all
git commit -m 'update'
git pull https://1484-minecraft:staythefuckathome@github.com/1484-minecraft/1.15.2

PAUSE