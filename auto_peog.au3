#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.16.1
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------
#include <Misc.au3>
; Script Start - Add your code below here
Func PEOG($username, $password)
    Run("cmd.exe /c start msedge --new-window --app=https://cgvmovil.claro.com.co/peog/index.php", "", @SW_HIDE)
    WinWaitActive("Prevención Fraude - PEOG")
	WinSetState("Prevención Fraude - PEOG", "", @SW_MAXIMIZE)
	Sleep(1000)
	Send("{TAB 3}")
	If WinActive("Prevención Fraude - PEOG") Then
		Sleep(1000)
		Send($username & "{TAB}")
		If WinActive("Prevención Fraude - PEOG") Then
			Sleep(1000)
			Send($password & "{ENTER}")
		EndIf
	EndIf
EndFunc

If $CmdLine[0] > 0 Then
    $dataToSendUser = $CmdLine[1]
    $dataToSendPass = $CmdLine[2]
    $dataToSendPass = StringReplace($dataToSendPass, ".", "{.}")
    $dataToSendPass = StringReplace($dataToSendPass, "*", "{*}")
    $dataToSendPass = StringReplace($dataToSendPass, "+", "{+}")
    $dataToSendPass = StringReplace($dataToSendPass, ")", "{)}")
    $dataToSendPass = StringReplace($dataToSendPass, "(", "{(}")
    $dataToSendPass = StringReplace($dataToSendPass, "-", "{-}")
    $dataToSendPass = StringReplace($dataToSendPass, "/", "{/}")
    $dataToSendPass = StringReplace($dataToSendPass, "#", "{#}")
	
	Global $funcionEjecutada = False

	While 1
		; Verificar si la función no se ha ejecutado aún
		If Not $funcionEjecutada Then
			PEOG($dataToSendUser,$dataToSendPass)
			MouseClick("left", 664, 443)
			$funcionEjecutada = True ; Marcar que la función se ha ejecutado
			
		EndIf

		; Verificar si la tecla Escape está presionada
		If _IsPressed("1B") Then ; "1B" es el código de tecla para Escape en hexadecimal
			; Ejecutar Alt + F4
			Send("!{F4}")
			Exit 
		EndIf 
		; Más código aquí...
		sleep(1000)
		Exit
	WEnd
Else
    MsgBox(0, "Error", "No se proporcionó un argumento desde Java.")
EndIf