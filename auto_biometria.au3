#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.16.1
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------
#include <AutoItConstants.au3>

#include <AutoItConstants.au3>
; Script Start - Add your code below here
#include <Misc.au3>

Func BIOMETRIA($username, $password)
	Run("cmd.exe /c start msedge --new-window --app=https://consola.reconoserid.com/#/auth/login", "", @SW_HIDE)
	WinWaitActive(".: Consola Reconoser ID :.")
	WinSetState(".: Consola Reconoser ID :.", "", @SW_MAXIMIZE)
	Sleep(1000)
	Send("{TAB}")
	Send("{TAB}")
	MouseMove ( 2000, 2000, 0)
	MouseMove ( 2000, 2000, 0)
	Sleep(1000)
	MouseMove ( 2000, 2000, 0)
	MouseMove ( 2000, 2000, 0)
	If WinActive(".: Consola Reconoser ID :.") Then
		Send($username)
		MouseMove ( 2000, 2000, 0)
		MouseMove ( 2000, 2000, 0)
		Send("{TAB}")
		Send("{TAB}")
		MouseMove ( 2000, 2000, 0)
		MouseMove ( 2000, 2000, 0)
		Sleep(1000)
		MouseMove ( 2000, 2000, 0)
		MouseMove ( 2000, 2000, 0)
		If WinActive(".: Consola Reconoser ID :.") Then
			Send($password)
			MouseMove ( 2000, 2000, 0)
			MouseMove ( 2000, 2000, 0)
			Send("{TAB}")
			Send("{ENTER}")
		EndIf
	EndIf
EndFunc
If $CmdLine[0] > 0 Then
	$dataToSendUser = $CmdLine[1]
	$dataToSendUser = StringReplace($dataToSendUser, "{.}", ".")
    $dataToSendUser = StringReplace($dataToSendUser, "{@}", "@")
	$dataToSendPass = $CmdLine[2]
	$dataToSendPass = StringReplace($dataToSendPass, "{*}", "*")
	
	Global $funcionEjecutada = False

	While 1
		; Verificar si la función no se ha ejecutado aún
		If Not $funcionEjecutada Then
			BIOMETRIA($dataToSendUser,$dataToSendPass)
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
