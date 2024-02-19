#
#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.16.1
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
Local $exeLocation = "C:\Program Files\AC Administración de Clientes\AC Administrador de Clientes.exe"
ShellExecute($exeLocation)
AutoItSetOption('MouseCoordMode', 1)

WinWaitActive("Administración de Clientes (AC) V19.9.0")

Func Clickventana($titulo, $relativeX, $relativeY)
	WinWaitActive($titulo)
	$ventana = WinGetHandle($titulo)
	WinActivate($ventana)
	Local $windowPos = WinGetPos($ventana)
	Local $mouseX = $windowPos[0] + $relativeX
	Local $mouseY = $windowPos[1] + $relativeY
	MouseMove($mouseX, $mouseY)
	MouseClick("left", $mouseX, $mouseY)
EndFunc

If $CmdLine[0] > 0 Then
	$dataToSendPass = $CmdLine[1]
	$dataToSendPass = StringReplace($dataToSendPass, "*", "{*}")
	$dataToSendPass = StringReplace($dataToSendPass, "+", "{+}")
	Send($dataToSendPass)
	Sleep(1000)
	Clickventana("Administración de Clientes (AC) V19.9.0", 206, 352)
	Send("{DOWN}")
	Sleep(1000)
	Send("{ENTER}")
Else
	MsgBox(0,"Error", "No se proporciono argumento desde java")
EndIf
	




