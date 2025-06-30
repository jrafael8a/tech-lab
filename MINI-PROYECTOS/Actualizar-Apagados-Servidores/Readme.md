# ⚙️ Automatización de Apagado de Servidores sin GPOs

Automatización de tareas de encendido/apagado/reinicio en servidores Windows, sin acceso a políticas de dominio (GPO), usando tareas programadas y scripts locales con control centralizado.

## 🧠 Contexto

- No hay acceso a políticas de grupo (GPO)
- Cada servidor está en dominio, pero se gestiona individualmente
- Se necesita poder:
  - Activar/desactivar tareas de apagado/reinicio
  - Actualizar esa configuración de forma remota
  - No depender de conexión RDP a cada servidor

## 📂 Estructura de la solución

### Tareas programadas (en cada servidor)

1. AutoOFF: Apaga el servidor a las 8pm    (Se desactiva para casos de mantenimiento)
2. Apagado_2: Apaga a las 4 am    (Se activa para casos de mantenimiento)
3. AutoReinicio: reinicio automático a las 5am    (Se activa cuando no hubo apagado y se requiere al menos un reinicio antes de empezar el nuevo dia de trabajo)
4. ConfigurarApagado: corre cada hora al iniciar el servidor y ejecuta el script configurar-apagado.cmd desde carpeta compartida

### Script central de configuración (en cada servidor) 
##### configurar-apagado.cmd:

```cmd
@echo off
REM Activar tarea principal de apagado
schtasks /change /tn "\Microsoft\AutoOFF" /ENABLE

REM Desactivar tarea secundaria
schtasks /change /tn "\Microsoft\Apagado_2" /DISABLE

REM Desactivar reinicio automático
schtasks /change /tn "\Microsoft\AutoReinicio" /DISABLE
```

### Script para distribuir el archivo a todos los servidores desde oficina:
##### copiar-script-a-servidores.cmd:

```
@echo off for /f "delims=*" %%a in ('type IPServers.txt') do ( start /MIN xcopy Apagado "\\%%a\SVI$\Apagado" /E /C /K /Y ) 
```

#### IPServers.txt: lista de IPs o nombres de host


## 🔁 Flujo de trabajo
- Se inicia el servidor
- ConfigurarApagado se ejecuta cada hora
- El script de configuración activa o desactiva las tareas según lo indicado
- Si se quiere cambiar comportamiento global, basta con sobrescribir el archivo compartido desde oficina

## 📝 Notas
Cada tarea fue creada manualmente (ver carpeta tareas-programadas/ para referencia)
Esta solución evita tener que conectarse manualmente servidor por servidor
Aunque rudimentaria, ha sido confiable y mantenible durante meses

## ✅ Pendiente a futuro
[ ] Agregar logs de ejecución por IP
[ ] Migrar a PowerShell para mayor control
[ ] Validar integridad del script (hash o firma)