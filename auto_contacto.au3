#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.16.1
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#include <Misc.au3>
#include <AutoItConstants.au3>
Func CONTACTO($username, $password)
	Run("cmd.exe /c start msedge --new-window --app=https://contacto-virtual.com/multiagente/public/", "", @SW_HIDE)
	WinWaitActive("Multiagente | Log in")
	WinSetState("Multiagente | Log in", "", @SW_MAXIMIZE)
	MouseMove ( 2000, 2000, 0)
	sleep(1000)
	MouseMove ( 2000, 2000, 0)
	If WinActive("Multiagente | Log in") Then
		Send($username)
		MouseMove ( 2000, 2000, 0)
		Sleep(500)
		Send("{TAB}")
		MouseMove ( 2000, 2000, 0)
		If WinActive("Multiagente | Log in") Then
			Send($password)
			MouseMove ( 2000, 2000, 0)
			MouseMove ( 2000, 2000, 0)
			MouseMove ( 2000, 2000, 0)
			Send("{TAB}")
			Sleep(500)
			MouseMove ( 2000, 2000, 0)
			Send("{ENTER}")
			MouseMove ( 2000, 2000, 0)
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
	$dataToSendPass = StringReplace($dataToSendPass, "%", "{%}")
	
	Global $funcionEjecutada = False

	While 1
		If Not $funcionEjecutada Then
			CONTACTO($dataToSendUser,$dataToSendPass)
			MouseClick("left", 664, 443)
			$funcionEjecutada = True 
			
		EndIf

		If _IsPressed("1B") Then 
			Send("!{F4}")
			Exit 
		EndIf 
		sleep(1000)
		Exit
	WEnd
Else
    MsgBox(0, "Error", "No se proporcionó un argumento desde Java.")
EndIf