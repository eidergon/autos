
Local $processName = "OCMAgent.exe" ; Reemplaza "nombre_del_proceso.exe" con el nombre del proceso que deseas finalizar

; Comprobar si el proceso está en ejecución
If ProcessExists($processName) Then
    ; Si el proceso está en ejecución, intenta finalizarlo
    RunWait(@ComSpec & ' /c taskkill /F /IM ' & $processName, "", @SW_HIDE)
    If @error Then
        MsgBox(16, "Error", "No se pudo finalizar el proceso " & $processName)
    Else
        MsgBox(64, "Éxito", "El proceso " & $processName & " ha sido finalizado correctamente.")
    EndIf
Else
    MsgBox(48, "Advertencia", "El proceso " & $processName & " no está en ejecución.")
EndIf
