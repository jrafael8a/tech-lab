Const DeleteReadOnly = True
Set WshShell = CreateObject("WScript.Shell")
Set objEnv = WshShell.Environment("Process")
Set variable = CreateObject("Scripting.FileSystemObject")
RUTA = objEnv("Temp") & "\*.*"
on error resume next
variable.DeleteFile RUTA, DeleteReadOnly
variable.DeleteFolder RUTA, DeleteReadOnly
'MsgBox "ARCHIVOS y CARPETAS BORRADOS DE TEMP"
WScript.quit