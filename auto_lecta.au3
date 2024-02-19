#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.16.1
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

If $CmdLine[0] > 0 Then
	$dataToSendPass = $CmdLine[1]
    $dataToSendPass = StringReplace($dataToSendPass, ".", "{.}")
    $dataToSendPass = StringReplace($dataToSendPass, "*", "{*}")
    $dataToSendPass = StringReplace($dataToSendPass, "+", "{+}")
    $dataToSendPass = StringReplace($dataToSendPass, ")", "{)}")
    $dataToSendPass = StringReplace($dataToSendPass, "(", "{(}")
    $dataToSendPass = StringReplace($dataToSendPass, "-", "{-}")
    $dataToSendPass = StringReplace($dataToSendPass, "/", "{/}")
    $dataToSendPass = StringReplace($dataToSendPass, "#", "{#}") 
	Run("cmd.exe /c start msedge --new-window --app=https://applumens.lecta.com.co/lumens/LoginClientes.php", "", @SW_HIDE)
	WinWaitActive("Lumens")
	WinSetState("Lumens", "", @SW_MAXIMIZE)
	Sleep(1000)
	MouseMove ( 2000, 4000, 0)
	If WinActive("Lumens") Then
		Send("ONE CONTAC MEDELLIN") 
		MouseMove ( 2000, 4000, 0)
		Send("{TAB}")
		MouseMove ( 2000, 4000, 0)
		Sleep(1000)
		MouseMove ( 2000, 4000, 0)
		If WinActive("Lumens") Then
			send($dataToSendPass)
			MouseMove ( 2000, 4000, 0)
			Send("{TAB}")
			MouseMove ( 2000, 4000, 0)
			Send("{ENTER}")
			MouseMove ( 2000, 4000, 0)
		EndIf
	EndIf

Else
    MsgBox(0, "Error", "No se proporcionó un argumento desde Java.")
EndIf
