@echo off
SCHTASKS /Create /TN "\Microsoft\ActualizarHora" /XML "C:\SHR8\ActualizarHora\XmlHora.xml" /F 
exit