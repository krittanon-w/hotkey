#e::
	Run, explorer.exe shell:::{20D04FE0-3AEA-1069-A2D8-08002B30309D}
Exit

#z::
	;KeyWait Alt
	;KeyWait Ctrl
	;KeyWait LWin
	KeyWait z
	Send,{LWin Down}{PrintScreen Down}{LWin Up}{PrintScreen Up}
	;Send,{PrintScreen}
Exit

!^d::
	Run, C:\Users\Apple\Downloads
Exit

!^1::
	Run, C:\
Exit

!^2::
	Run, D:\
Exit

!^3::
	Run, E:\
Exit

!^4::
	Run, F:\
Exit


!^p::
	Run, C:\Users\Apple\Pictures\Screenshots
Exit

~RShift::
If( A_ThisHotkey = A_PriorHotkey && A_TimeSincePriorHotkey < 450 && A_TimeSincePriorHotkey > 125 ){
	Send,{End}
}
Exit

~LShift::
If( A_ThisHotkey = A_PriorHotkey && A_TimeSincePriorHotkey < 450 && A_TimeSincePriorHotkey > 125 ){
	Send,{Home}
}
Exit

~RCtrl::
If( A_ThisHotkey = A_PriorHotkey && A_TimeSincePriorHotkey < 350 && A_TimeSincePriorHotkey > 125 ){
	Send,{LWIN down}{UP down}{LWIN up}{UP up}
}
Exit

+!h::
	Send,{LEFT}
Exit

+!j::
	Send,{UP}
Exit

+!k::
	Send,{DOWN}
Exit

+!l::
	Send,{RIGHT}
Exit

; Only run when Windows Explorer or Desktop is active
; Ctrl+Alt+N
#IfWinActive ahk_class CabinetWClass
^!n::
#IfWinActive ahk_class ExploreWClass
^!n::
#IfWinActive ahk_class Progman
^!n::
#IfWinActive ahk_class WorkerW
^!n::

    ; Get full path from open Explorer window
    WinGetText, FullPath, A

    ; Clean up result
    StringReplace, FullPath, FullPath, `r, , all
    FullPath := RegExReplace(FullPath, "^.*`nAddress: ([^`n]+)`n.*$", "$1")

    ; Change working directory
    SetWorkingDir, %FullPath%

    ; An error occurred with the SetWorkingDir directive
    If ErrorLevel
        Return

    ; Display input box for filename
    InputBox, _inputStr, New File, , , 400, 100
    ;_inputOption := SubStr(_inputStr, -1)
   ; MsgBox, %_inputOption%
    ; User pressed cancel
    If ErrorLevel
        Return

    ; Create file
    FileAppend, , %_inputStr%

    ; Open the file in the appropriate editor
    Run %_inputStr%

    Return

#IfWinActive

;~RAlt & ~SC033::
~RAlt & ~9::
	SendInput ^#{LEFT}
	sleep,200
Exit

;~RAlt & ~SC034::
~RAlt & ~0::
	SendInput ^#{RIGHT}
	sleep,200	
Exit


;~LAlt & ~F::
;If( A_ThisHotkey = A_PriorHotkey && A_TimeSincePriorHotkey < 500 && A_TimeSincePriorHotkey > 125 ){
;	v_cmd := 1
;}
;Else{
;	v_cmd := 0
;}
;MsgBox, %v_cmd%
;Exit


~[::
Input, UserInput, V T5 L4, {enter}.{esc}{tab}, btw,otoh,fl,ahk,ca
if (ErrorLevel = "Max")
{
    MsgBox, You entered "%UserInput%", which is the maximum length of text.
    return
}
if (ErrorLevel = "Timeout")
{
    MsgBox, You entered "%UserInput%" at which time the input timed out.
    return
}
if (ErrorLevel = "NewInput")
{
    MsgBox, new input
    return
}
If InStr(ErrorLevel, "EndKey:")
{
    MsgBox, You entered "%UserInput%" and terminated the input with %ErrorLevel%.
    return
}

if (UserInput = "btw")
    Send, {backspace 4}by the way
else if (UserInput = "otoh")
    Send, {backspace 5}on the other hand
else if (UserInput = "fl")
    Send, {backspace 3}Florida
else if (UserInput = "ca")
    Send, {backspace 3}California
else if (UserInput = "ahk")
    Run, https://autohotkey.com
return
Exit