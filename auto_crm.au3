#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.16.1
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------
#include <Misc.au3>
#include <AutoItConstants.au3>
; Script Start - Add your code below here

Func CRM($username, $password) 
	Run("cmd.exe /c start msedge --new-window --app=https://medellin.onecontact-simpplee.com/sec_Login/", "", @SW_HIDE) ;comando para abrir el navegador
	WinWaitActive("Medellín") ; ativar la ventana
	WinSetState("Medellín", "", @SW_MAXIMIZE) ; maximizar la ventana
	MouseMove ( 2000, 4000, 0) ; mover el mouse
	sleep(1000) ; tiempo de espera en milisegundos
	MouseMove ( 2000, 4000, 0)
	If WinActive("Medellín") Then
		Send($username) ; variable que contiene el usuario 
		MouseMove ( 2000, 4000, 0)
		Send("{TAB}") ; da tab 
		MouseMove ( 2000, 4000, 0)
		If WinActive("Medellín") Then
			Send($password) ; variable que contiene la clave
			MouseMove ( 2000, 4000, 0)
			Send("{ENTER}") ; da enter
			MouseMove ( 2000, 4000, 0)
		EndIf
	EndIf
EndFunc

If $CmdLine[0] > 0 Then ; verifica que se reciban las variables desde segurity
	$dataToSendUser = $CmdLine[1] ; recibe el usuario desde el segurity
    $dataToSendPass = $CmdLine[2] ; recibe la contraseña desde el segurity
	; autoir no reconoce los caracteres especiales como parte de la contraseña con esto se resuelve 
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
			CRM($dataToSendUser,$dataToSendPass)
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
Else ; si no recibe variables desde segurity manda un mensaje 
    MsgBox(0, "Error", "No se proporcionó un argumento desde Java.")
EndIf
