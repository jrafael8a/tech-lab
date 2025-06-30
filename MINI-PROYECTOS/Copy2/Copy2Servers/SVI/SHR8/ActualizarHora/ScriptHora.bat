@echo off
set /p IPdns=<%cd%\dns.txt

start /MIN /WAIT sc stop w32time
ping localhost -n 3 >nul

start /MIN /WAIT sc config w32time start= auto
ping localhost -n 3 >nul

start /MIN /WAIT sc start w32time
ping localhost -n 3 >nul

w32tm /config /manualpeerlist:%IPdns% /syncfromflags:manual /update
w32tm /resync

REM timeout /t 5 /nobreak
exit