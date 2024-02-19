#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.16.1
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------
#include <AutoItConstants.au3>
#include <Misc.au3>
; Script Start - Add your code below here

Func IDVISION($username, $password)
	Run("cmd.exe /c start msedge --new-window --app=https://www.transuniondecisioncentre.com.mx/DC/DCPortalV31_Latam/login.aspx", "", @SW_HIDE)
	WinWaitActive("TransUnion | DecisionEdge")
	WinSetState("TransUnion | DecisionEdge", "", @SW_MAXIMIZE)
	Sleep(1000)
	MouseMove ( 2000, 4000, 0)
	If WinActive("TransUnion | DecisionEdge") Then
		Send($username)
		MouseMove ( 2000, 4000, 0)
		sleep(1000)
		Send("{TAB}")
		MouseMove ( 2000, 4000, 0)
		If WinActive("TransUnion | DecisionEdge") Then
			Send($password)
			MouseMove ( 2000, 4000, 0)
			MouseMove ( 2000, 4000, 0)
			sleep(1000)
			MouseMove ( 2000, 4000, 0)
			MouseMove ( 2000, 4000, 0)
			Send("{ENTER}")
			MouseMove ( 2000, 4000, 0)
		EndIf
	EndIf
EndFunc

If $CmdLine[0] > 0 Then
	$dataToSendUser = $CmdLine[1]
	$dataToSendUser = StringReplace($dataToSendUser, ".", "{.}")
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
			IDVISION($dataToSendUser,$dataToSendPass)
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