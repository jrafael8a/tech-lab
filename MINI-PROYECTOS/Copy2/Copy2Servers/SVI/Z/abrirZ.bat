@echo off
"%appdata%\..\..\Desktop\ARCHIVOS.lnk"
timeout /t 10 /nobreak
taskkill /FI "IMAGENAME eq explorer.exe" /FI "WINDOWTITLE eq ARCHIVOS"

set /p IPServer=<C:\SHR8\Copy2\ip.txt
set /p IPServer=<%cd%\ip.txt
xcopy "\\%IPserver%\SVI$\TVBUENA" "C:\TVBUENA" /E /C /Y 

timeout /t 10 /nobreak
"%appdata%\..\..\Desktop\BuenaTV.lnk"
exit