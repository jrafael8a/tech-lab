Dim objShell
Dim objVariableEntorno

Set objShell = WScript.CreateObject("WScript.Shell")
Set objVariableEntorno = objShell.Environment("Process")

ficheroAccesoDirecto = objVariableEntorno("APPDATA") & "\Microsoft\Windows\Start Menu\Programs\Startup\AbrirZ.lnk"
Set objAccesoDirecto = objShell.CreateShortcut(ficheroAccesoDirecto)
    objAccesoDirecto.TargetPath = "C:\Z\abrirZ.vbs"
'  objAccesoDirecto.Arguments = ""
  objAccesoDirecto.Description = "Abrir Unidad de Red Z"
'  objAccesoDirecto.HotKey = ""
  objAccesoDirecto.IconLocation = "%SystemRoot%\system32\SHELL32.dll, 10"
'  objAccesoDirecto.WindowStyle = "1"   
'  objAccesoDirecto.WorkingDirectory = "C:\Z\abrirZ.vbs"
objAccesoDirecto.Save