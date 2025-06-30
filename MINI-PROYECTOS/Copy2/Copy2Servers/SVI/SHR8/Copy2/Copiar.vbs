Dim objShell
Dim objVariableEntorno

Set objShell = WScript.CreateObject("WScript.Shell")
Set objVariableEntorno = objShell.Environment("Process")

ficheroAccesoDirecto = objVariableEntorno("APPDATA") & "\Microsoft\Windows\Start Menu\Programs\Startup\Copy2.lnk"
Set objAccesoDirecto = objShell.CreateShortcut(ficheroAccesoDirecto)
    objAccesoDirecto.TargetPath = "C:\SHR8\Copy2\Copy2.vbs"
'  objAccesoDirecto.Arguments = ""
  objAccesoDirecto.Description = "Actualizar DLLs de NAV"
'  objAccesoDirecto.HotKey = ""
  objAccesoDirecto.IconLocation = "%SystemRoot%\system32\SHELL32.dll, 68"
'  objAccesoDirecto.WindowStyle = "1"   
'  objAccesoDirecto.WorkingDirectory = "C:\SHR8\Copy2\"
objAccesoDirecto.Save