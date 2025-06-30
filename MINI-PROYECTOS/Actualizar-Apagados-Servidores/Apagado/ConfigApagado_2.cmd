@echo off

REM Apagado a la hora normal:
schtasks /change /tn "\Microsoft\AutoOFF" /DISABLE

REM Apagado #2:
schtasks /change /tn "\Microsoft\Apagado_2" /ENABLE

REM Auto Reinicio:
schtasks /change /tn "\Microsoft\AutoReinicio" /DISABLE