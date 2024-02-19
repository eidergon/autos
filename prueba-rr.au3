#cs ----------------------------------------------------------------------------
 AutoIt Version: 3.3.16.1
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

Local $vs = "C:\Program Files\IBM\Clients Solutions\Start_Programs\Windows_i386-32\acslaunch_win-32.exe" 
Run($vs)
AutoItSetOption('MouseCoordMode', 1)

Func Clickventana($titulo, $relativeX, $relativeY)
    WinWaitActive($titulo)
    $ventana = WinGetHandle($titulo)
    WinActivate($ventana)
    Local $windowPos = WinGetPos($ventana)
    Local $mouseX = $windowPos[0] + $relativeX
    Local $mouseY = $windowPos[1] + $relativeY
    MouseMove($mouseX, $mouseY)
    MouseClick("primary", $mouseX, $mouseY)
EndFunc

; Leer datos desde un archivo
If $CmdLine[0] > 0 Then
    $dataToSendUser = $CmdLine[1]
	$dataToSendPass = $CmdLine[2]
	$dataToSendPass = StringReplace($dataToSendPass, "*","{*}")
	$dataToSendPass = StringReplace($dataToSendPass, "+","{+}")

    ; Ejecutar el resto de tu script usando $dataToSend
    Clickventana("IBM i Access Client Solutions", 155, 477)
    Clickventana("IBM i Access Client Solutions - Gestor de sesiones", 493, 127)
    Clickventana("Pantalla 5250", 449, 89)
    send("172.18.10.10")
    Clickventana("Pantalla 5250", 578, 143)
    Clickventana("Pantalla 5250", 529, 191)
    Sleep(1000)
    Send("{ENTER}")
	Sleep(2000)
	Send($dataToSendUser)
	Send("{TAB}")
	Send($dataToSendPass)
	Sleep(1000)
	Clickventana("Iniciar sesión en IBM i", 189, 184)
	Sleep(10000)
	Send($dataToSendUser)
	Send("{TAB}")
	Sleep(1000)
	Send($dataToSendPass)
	Send("{ENTER}")
Else
    MsgBox(0, "Error", "No se pudo abrir el archivo de datos.")
EndIf




