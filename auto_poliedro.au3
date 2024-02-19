#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.16.1
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------
#include <AutoItConstants.au3>
#include <Misc.au3>

Func POLIEDRO($username, $password)
    BlockInput(1) ; Bloquear entrada del mouse y teclado

    Run("cmd.exe /c start msedge --start-maximized --new-window --app=https://poliedro.comcel.com.co/LoginPoliedro/Login.aspx", "", @SW_HIDE)
    WinWaitActive("Login")
    WinSetState("Login", "", @SW_MAXIMIZE)
    Sleep(1000)
    Send("{TAB 5}{ENTER}")
	Sleep(1000)
    If WinActive("Login") Then
        Sleep(1000)
        Send($username)
        Send("{TAB}")
        Sleep(1000)
        Send("{TAB}")
        If WinActive("Login") Then
            Send($password & "{ENTER}")
			
        EndIf
    EndIf

    BlockInput(0) ; Desbloquear entrada del mouse y teclado
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
			POLIEDRO($dataToSendUser,$dataToSendPass)
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
