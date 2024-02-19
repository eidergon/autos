#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.16.1
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------
#include <AutoItConstants.au3>
#include <Misc.au3>
#include <AutoItConstants.au3>
; Script Start - Add your code below here

Func ESMLOGISTICA($username, $password)
	Run("cmd.exe /c start msedge --new-window --app=https://clientes.esmlogistica.com/login", "", @SW_HIDE)
	WinWaitActive("ESM LOGÍSTICA")
	WinSetState("ESM LOGÍSTICA", "", @SW_MAXIMIZE)
	MouseMove ( 2000, 4000, 0)
	Sleep(1000)
	MouseMove ( 2000, 4000, 0)
	If WinActive("ESM LOGÍSTICA") Then
		Send($username) 
		MouseMove ( 2000, 4000, 0)
		Send("{TAB}")
		MouseMove ( 2000, 4000, 0)
		Sleep(1000)
		MouseMove ( 2000, 4000, 0)
		If WinActive("ESM LOGÍSTICA") Then
			send($password)
			MouseMove ( 2000, 4000, 0)
			Send("{TAB}")
			MouseMove ( 2000, 4000, 0)
			Send("{TAB}")
			MouseMove ( 2000, 4000, 0)
			Send("{TAB}")
			MouseMove ( 2000, 4000, 0)
			Send("{ENTER}")
			MouseMove ( 2000, 4000, 0)
		EndIf
	EndIf

EndFunc
If $CmdLine[0] > 0 Then
	$dataToSendUser = $CmdLine[1]
    $dataToSendUser = StringReplace($dataToSendUser, ".", "{.}")
    $dataToSendUser = StringReplace($dataToSendUser, "@", "{@}")
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
			ESMLOGISTICA($dataToSendUser,$dataToSendPass)
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
