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
	Run, C:\Users\simonxx\Downloads
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
	Run, C:\Users\simonxx\Pictures\Screenshots
Exit

~RShift::
If( A_ThisHotkey = A_PriorHotkey && A_TimeSincePriorHotkey < 450 && A_TimeSincePriorHotkey > 125 ){
	Send,{End}
}
Exit

~LShift::
If( A_ThisHotkey = A_PriorHotkey && A_TimeSincePriorHotkey < 450 && A_TimeSincePriorHotkey > 150 ){
	Send,{Home}
}
Exit

~RCtrl::
If( A_ThisHotkey = A_PriorHotkey && A_TimeSincePriorHotkey < 450 && A_TimeSincePriorHotkey > 150 ){
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

#IfWinActive ahk_class CabinetWClass
^!n::
#IfWinActive ahk_class ExploreWClass
^!n::
#IfWinActive ahk_class Progman
^!n::
#IfWinActive ahk_class WorkerW
^!n::

    WinGetText, FullPath, A

    StringReplace, FullPath, FullPath, `r, , all
    FullPath := RegExReplace(FullPath, "^.*`nAddress: ([^`n]+)`n.*$", "$1")

    SetWorkingDir, %FullPath%

    If ErrorLevel
        Return

    InputBox, _inputStr, New File, , , 400, 100

    If ErrorLevel
        Return

    FileAppend, , %_inputStr%

    Run %_inputStr%

    Return

#IfWinActive

~RAlt & ~9::
	SendInput ^#{LEFT}
	sleep,200
Exit

~RAlt & ~0::
	SendInput ^#{RIGHT}
	sleep,200
Exit



~LWin & ~j::
MsgBox, new input
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

#IfWinActive ahk_class CabinetWClass
#h::

    WinGetText, FullPath, A

    StringReplace, FullPath, FullPath, `r, , all
    FullPath := RegExReplace(FullPath, "^.*`nAddress: ([^`n]+)`n.*$", "$1")

    SetWorkingDir, %FullPath%
    
    Run "C:\Program Files\Git\git-bash.exe"

    Return

#IfWinActives

#IfWinNotActive ahk_class CabinetWClass
#h::

    SetWorkingDir, D:\

    Run "C:\Program Files\Git\git-bash.exe"

    Return

#IfWinActives