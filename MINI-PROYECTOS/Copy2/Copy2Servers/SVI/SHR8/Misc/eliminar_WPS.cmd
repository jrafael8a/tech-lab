@echo off
title Eliminando WPS Office y bloqueando reinstalación

:-------------------------------------
REM  --> Analizando los permisos
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> Si hay error es que no hay permisos de administrador.
if '%errorlevel%' NEQ '0' (
    echo Solicitando permisos de administrador... Requesting administrative privileges... Anfordern Administratorrechte ...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------  


echo ==========================================
echo   Cerrando procesos de WPS Office...
echo ==========================================
taskkill /F /IM wps.exe /IM wpp.exe /IM et.exe /IM wpscloudsvr.exe /IM wpscenter.exe >nul 2>&1

echo.
echo ==========================================
echo   Desinstalando WPS Office...
echo ==========================================
wmic product where "Name like '%%WPS Office%%'" call uninstall /nointeractive >nul 2>&1
powershell -Command "Get-Package -Name '*WPS Office*' | Unistall-Package -Force" >nul 2>&1
powershell -Command "$app = Get-WmiObject Win32_Product | Where-Object { $_.Name -like '*WPS Office*' }; if ($app) { $app.Uninstall() }" >nul 2>&1

echo.
echo ==========================================
echo   Eliminando archivos y carpetas de WPS...
echo ==========================================
rmdir /s /q "C:\Program Files (x86)\Kingsoft\" 2>nul
rmdir /s /q "C:\Program Files\Kingsoft\" 2>nul
rmdir /s /q "C:\ProgramData\Kingsoft\" 2>nul
rmdir /s /q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\WPS Office" 2>nul
rmdir /s /q "C:\Users\%USERNAME%\AppData\Local\Kingsoft\" 2>nul
rmdir /s /q "C:\Users\%USERNAME%\AppData\Roaming\Kingsoft\" 2>nul
rmdir /s /q "C:\Users\%USERNAME%\AppData\Local\WPS\" 2>nul
rmdir /s /q "C:\Users\%USERNAME%\AppData\Roaming\WPS\" 2>nul
del /s /q "C:\Users\%USERNAME%\Desktop\WPS Office.lnk" 2>nul
del /s /q "C:\Users\%USERNAME%\Desktop\WPS PDF.lnk" 2>nul
del /s /q "C:\Users\%USERNAME%\Desktop\ksolaunch.exe" 2>nul

echo.
echo ==========================================
echo   Eliminando entradas del Registro...
echo ==========================================
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Kingsoft" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Kingsoft" /f >nul 2>&1
reg delete "HKEY_CLASSES_ROOT\WPS*" /f >nul 2>&1

echo.
echo ==========================================
echo   Bloqueando sitios web de WPS en hosts...
echo ==========================================
findstr /C:"127.0.0.1 wps.com" C:\Windows\System32\drivers\etc\hosts >nul
if %ERRORLEVEL% NEQ 0 (
(
    echo.
    echo.
    echo # ---------- INICIO IPs DE WPS OFFICE ----------
    echo 127.0.0.1 wps.com
    echo 127.0.0.1 wps.cn
    echo 127.0.0.1 wps.net
    echo 127.0.0.1 www.wps.com
    echo 127.0.0.1 www.wps.cn
    echo 127.0.0.1 www.wps.net
    echo 127.0.0.1 es.wps.com
    echo 127.0.0.1 en.wps.com
    echo 127.0.0.1 cn.wps.com
    echo 127.0.0.1 account.wps.com
    echo 127.0.0.1 account.wps.cn
    echo 127.0.0.1 activation.wps.com
    echo 127.0.0.1 activation.wps.cn
    echo 127.0.0.1 update.wps.com
    echo 127.0.0.1 update.wps.cn
    echo 127.0.0.1 community.wps.com
    echo 127.0.0.1 template.wps.com
    echo 127.0.0.1 template.wps.cn
    echo 127.0.0.1 ads.wps.com
    echo 127.0.0.1 ads.wps.cn
    echo 127.0.0.1 vip.wps.com
    echo 127.0.0.1 vip.wps.cn
    echo 127.0.0.1 service.wps.com
    echo 127.0.0.1 service.wps.cn
    echo 127.0.0.1 support.wps.com
    echo 127.0.0.1 support.wps.cn
    echo 127.0.0.1 drive.wps.com
    echo 127.0.0.1 drive.wps.cn
    echo 127.0.0.1 cloud.wps.com
    echo 127.0.0.1 cloud.wps.cn
    echo 127.0.0.1 wps-cloud.com
    echo 127.0.0.1 www.wps-cloud.com
    echo 127.0.0.1 store.wps.com
    echo 127.0.0.1 store.wps.cn
    echo 127.0.0.1 download.wps.com
    echo 127.0.0.1 download.wps.cn
    echo 127.0.0.1 global.wps.com
    echo 127.0.0.1 global.wps.cn
    echo 127.0.0.1 office.wps.com
    echo 127.0.0.1 office.wps.cn
    echo 127.0.0.1 intl.wps.com
    echo 127.0.0.1 intl.wps.cn
    echo 127.0.0.1 analytics.wps.com
    echo 127.0.0.1 analytics.wps.cn
    echo 127.0.0.1 log.wps.com
    echo 127.0.0.1 log.wps.cn
    echo 127.0.0.1 feedback.wps.com
    echo 127.0.0.1 feedback.wps.cn
    echo 127.0.0.1 docs.wps.com
    echo 127.0.0.1 docs.wps.cn
    echo 127.0.0.1 us.docs.wps.com
    echo 127.0.0.1 es.docs.wps.com
    echo 127.0.0.1 wdl1.pcfg.cache.wpscdn.com
    echo 127.0.0.1 wpscdn.com
    echo 127.0.0.1 us.docworkspace.com
    echo 127.0.0.1 es.docworkspace.com
    echo 127.0.0.1 docworkspace.com
    echo 127.0.0.1 docs.cache.wpscdn.com
    echo 127.0.0.1 us-drive.wps.com
    echo 127.0.0.1 us-account-wps.com
    echo 127.0.0.1 s-us.wps.com
    echo 127.0.0.1 avatar.qwps.com
    echo 127.0.0.1 params.wps.com
    echo # ---------- FIN IPs DE WPS OFFICE ----------
    echo.
    echo.
    ) >> C:\Windows\System32\drivers\etc\hosts
) else (
    REM Las entradas ya existen, no se agregará nada.  >nul 2>&1
)

echo.
echo ==========================================
echo   Eliminando Reglas WPS del Firewall...
echo ==========================================
netsh advfirewall firewall delete rule name="wpspdf.exe" >nul 2>&1
netsh advfirewall firewall delete rule name="wpscloudsvr.exe" >nul 2>&1
netsh advfirewall firewall delete rule name="wps.exe" >nul 2>&1
netsh advfirewall firewall delete rule name="wpp.exe" >nul 2>&1
netsh advfirewall firewall delete rule name="promecefpluginhost.exe" >nul 2>&1
netsh advfirewall firewall delete rule name="et.exe" >nul 2>&1

echo.
echo ==========================================
echo   Bloqueando reinstalación con Firewall...
echo ==========================================
netsh advfirewall firewall delete rule name="Bloquear WPS Office x86" >nul 2>&1
netsh advfirewall firewall delete rule name="Bloquear WPS Office x64" >nul 2>&1
netsh advfirewall firewall add rule name="Bloquear WPS Office x86" dir=out action=block program="C:\Program Files (x86)\Kingsoft\WPS Office\wps.exe" enable=yes >nul 2>&1
netsh advfirewall firewall add rule name="Bloquear WPS Office x64" dir=out action=block program="C:\Program Files\Kingsoft\WPS Office\wps.exe" enable=yes >nul 2>&1

echo.
echo ==========================================
echo   Restaurando Asociaciones de Archivos...
echo ==========================================
assoc .docx=Word.Document.12 >nul 2>&1
assoc .doc=Word.Document.8 >nul 2>&1
assoc .xlsx=Excel.Sheet.12 >nul 2>&1
assoc .xls=Excel.Sheet.8 >nul 2>&1
assoc .pptx=PowerPoint.Show.12 >nul 2>&1
assoc .ppt=PowerPoint.Show.8 >nul 2>&1
assoc .pdf=AcroExch.Document.DC >nul 2>&1
assoc .jpg=PhotoViewer.FileAssoc.Jpeg >nul 2>&1
assoc .jpeg=PhotoViewer.FileAssoc.Jpeg >nul 2>&1
assoc .png=PhotoViewer.FileAssoc.Png >nul 2>&1

echo.
echo ==========================================
echo   Restableciendo Iconos por Defecto...
echo ==========================================
reg add "HKEY_CLASSES_ROOT\Word.Document.12\DefaultIcon" /ve /d "\"C:\Program Files\Microsoft Office\Root\Office16\WORDICON.EXE\",1" /f >nul 2>&1
reg add "HKEY_CLASSES_ROOT\Excel.Sheet.12\DefaultIcon" /ve /d "\"C:\Program Files\Microsoft Office\Root\Office16\EXCEL.EXE\",1" /f >nul 2>&1
reg add "HKEY_CLASSES_ROOT\PowerPoint.Show.12\DefaultIcon" /ve /d "\"C:\Program Files\Microsoft Office\Root\Office16\POWERPNT.EXE\",1" /f >nul 2>&1
reg add "HKEY_CLASSES_ROOT\AcroExch.Document.DC\DefaultIcon" /ve /d "\"C:\Program Files\Adobe\Acrobat DC\Acrobat\Acrobat.exe\",1" /f >nul 2>&1
reg add "HKEY_CLASSES_ROOT\PhotoViewer.FileAssoc.Jpeg\DefaultIcon" /ve /d "\"C:\Program Files\Windows Photo Viewer\PhotoViewer.dll\",1" /f >nul 2>&1
reg add "HKEY_CLASSES_ROOT\PhotoViewer.FileAssoc.Png\DefaultIcon" /ve /d "\"C:\Program Files\Windows Photo Viewer\PhotoViewer.dll\",1" /f >nul 2>&1

echo.
echo ==========================================
echo   Reconstruyendo de la caché de iconos...
echo ==========================================
taskkill /IM explorer.exe /F >nul 2>&1
DEL /A /Q "%localappdata%\IconCache.db" >nul 2>&1
DEL /A /F /Q "%localappdata%\Microsoft\Windows\Explorer\iconcache*" >nul 2>&1
start explorer.exe >nul 2>&1

echo.
echo ====================================================
echo   Proceso finalizado. WPS eliminado y bloqueado...
echo ====================================================
echo       Reinicio opcional para aplicar cambios
echo.
echo Se ha eliminado WPS de su sistema
echo Se han restaurado los iconos y asociaciones de archivos por defecto
echo. 
echo Si los cambios no se reflejan de inmediato, reinicia tu computadora.
echo.
echo.

TIMEOUT 5 /NOBREAK >NUL
exit