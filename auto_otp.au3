#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.16.1
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
Run("cmd.exe /c start msedge --new-window --app=https://pin.claro.co:8443/app-fraudes/", "", @SW_HIDE)
WinWaitActive("AppFraudes")
WinSetState("AppFraudes", "", @SW_MAXIMIZE)
Sleep(1000)
Send("{TAB}")
Send("{TAB}")
Send("{ENTER}")
Send("{TAB}")
Send("{ENTER}")