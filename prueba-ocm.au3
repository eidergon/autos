#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.16.1
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

Local $exeLocation = "C:\OcmAgent 1.3.36.3\OCMAgent.exe"
ShellExecute($exeLocation)
AutoItSetOption('MouseCoordMode', 1)

WinWaitActive("OCMAgent v.1.3.36.3")

; Obtener el argumento pasado desde Java
If $CmdLine[0] > 0 Then
    $dataToSendUser = $CmdLine[1]
	$dataToSendPass = $CmdLine[2]
    Send($dataToSendUser)
    Send("{TAB}")
    Send($dataToSendPass)
    Sleep(1000)
    Send("{ENTER}")
Else
    MsgBox(0, "Error", "No se proporcionó un argumento desde Java.")
EndIf







