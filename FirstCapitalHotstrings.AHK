;Run this script as the first one, before any Hotstring definition (static or dynamic)
#SingleInstance, 	force	; Only one instance of this script may run at a time!
#Warn					; Enable warnings to assist with detecting common errors.
#NoEnv					; Recommended for performance and compatibility with future AutoHotkey releases.
#Requires AutoHotkey v1.1.33+	; Displays an error and quits if a version requirement is not met.

;global variables
c_NoOfAlphabetLetters	:= 26	;c_ constant
, c_OrdinaryLetters		:= 96	;c_ constant
, c_CapitalLetters		:= 64	;c_ constant
, IconAsteriskInfo		:= 64
, v_IfRun				:= true	;v_ variable, global; determines if script definitions should run

F_FirstCapital(v_IfRun)
Menu, Tray, Icon, imageres.dll, 124     ; this line will turn the H icon into a yellow page with green triangle.
F_TrayMenu()

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
F23::					;switch state of application when v_IfRun is set application would run.
:*:f23/::
	v_IfRun		:= !v_IfRun
	MsgBox, % IconAsteriskInfo, % SubStr(A_ScriptName, 1, -4) . ":" . A_Space . "information", % "Current state of script hotstrings:" . A_Space . (v_IfRun ? "ENABLED" : "DISABLED") . "."
	F_FirstCapital(v_IfRun)
return

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
F_FirstCapital(v_IfRun)
{
	global	;assume-global mode of operation
	
	if (v_IfRun)
	{
		Loop, % c_NoOfAlphabetLetters
			Hotstring(":CB0?*:. " 	. Chr(A_Index + c_OrdinaryLetters), "{BS}" . Chr(A_Index + c_CapitalLetters), "On")
		Loop, % c_NoOfAlphabetLetters
			Hotstring(":CB0?*:! " 	. Chr(A_Index + c_OrdinaryLetters), "{BS}" . Chr(A_Index + c_CapitalLetters), "On")
		Loop, % c_NoOfAlphabetLetters
			Hotstring(":CB0?*:? " 	. Chr(A_Index + c_OrdinaryLetters), "{BS}" . Chr(A_Index + c_CapitalLetters), "On")
		Loop, % c_NoOfAlphabetLetters
			Hotstring(":CB0?*:`n" 	. Chr(A_Index + c_OrdinaryLetters), "{BS}" . Chr(A_Index + c_CapitalLetters), "On")
	}
	else
	{
		Loop, % c_NoOfAlphabetLetters
			Hotstring(":CB0?*:. " 	. Chr(A_Index + c_OrdinaryLetters), , "Off")
		Loop, % c_NoOfAlphabetLetters
			Hotstring(":CB0?*:! " 	. Chr(A_Index + c_OrdinaryLetters), , "Off")
		Loop, % c_NoOfAlphabetLetters
			Hotstring(":CB0?*:? " 	. Chr(A_Index + c_OrdinaryLetters), , "Off")
		Loop, % c_NoOfAlphabetLetters
			Hotstring(":CB0?*:`n" 	. Chr(A_Index + c_OrdinaryLetters), , "Off")
	}
	Hotstring("Reset")
}
; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
F_TrayMenu()
{
    	Menu, Tray, Add, % A_ScriptName, 	F_About
	Menu, Tray, Add, About..., 		F_About
    	Menu, Tray, Default, % A_ScriptName ; Default: Changes the menu's default item to be the specified menu item and makes its font bold.
    	Menu, Tray, Add ; To add a menu separator line, omit all three parameters. To put your menu items on top of the standard menu items (after adding your own menu items) run Menu, Tray, NoStandard followed by Menu, Tray, Standard.
    	Menu, Tray, NoStandard
    	Menu, Tray, Standard
    	Menu, Tray, Tip, % SubStr(A_ScriptName, 1, -4) ; Changes the tray icon's tooltip.
}
; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
F_About()
{

}