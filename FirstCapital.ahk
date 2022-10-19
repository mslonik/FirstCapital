;Run this script as the first one, before any Hotstring definition (static or dynamic)
#SingleInstance, 	force	; Only one instance of this script may run at a time!
#Warn					; Enable warnings to assist with detecting common errors.
#NoEnv					; Recommended for performance and compatibility with future AutoHotkey releases.
#Requires AutoHotkey v1.1.33+	; Displays an error and quits if a version requirement is not met.

;global variables
	o_ih			:= InputHook("C V * E", , F_DefineMatch())	;C = CaseSensitive = true, V = VisibleText = true, * wildcard sets FindAnywhere to true, allowing matches to be found anywhere within what the user types, E = handle single-character end keys character code instead of key code
,	o_ih.OnEnd	:= Func("F_OnEnd")
,	v_IfRun		:= true			;v_ = global variable
	o_ih.Start()

Menu, Tray, Icon, imageres.dll, 124     ; this line will turn the H icon into a yellow page with green triangle.
F_TrayMenu()

F23::					;switch state of application when v_IfRun is set application would run.
:*:f23/::
	v_IfRun		:= !v_IfRun
	MsgBox, 64, % SubStr(A_ScriptName, 1, -4) . ":" . A_Space . "information", % "Current state of script hotstrings:" . A_Space . (v_IfRun ? "ENABLED" : "DISABLED") . "."
return

; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
F_OnEnd(o_ih)
{
	global	;assume-global mode of operation
	if (v_IfRun)
	{
		SendInput, % "{BS}"
		SendInput, % Format("{:U}", SubStr(o_ih.Match, 0))	;change last character of matching sequence to uppercase
	}
	o_ih.Start()
}
; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
F_DefineMatch()
{
	c_NoOfLettersInAlphabet	:= 26	;c_ = constant
,	c_ASCIIShiftOrdinary	:= 96	;c_ = constant
,	c_ASCIIShiftCaptal		:= 64	;c_ = constant
,	Ordinary 				:= ""
,	Capital 				:= ""
,	EndExclamation			:= ""
,	EndDot				:= ""
,	EndQuestion			:= ""
,	EndEnter				:= ""
,	ihMatchList			:= ""

	Loop, % c_NoOfLettersInAlphabet
	{
		Ordinary		 	:= Chr(A_Index + c_ASCIIShiftOrdinary)
,		Capital			:= Chr(A_Index + c_ASCIIShiftCaptal)
,		EndExclamation		:= "!" . A_Space . Ordinary
,		EndDot			:= "." . A_Space . Ordinary
,		EndQuestion		:= "?" . A_Space . Ordinary
,		EndEnter			:= "`n" . Ordinary
		ihMatchList		.= EndExclamation . "," . EndDot . "," . EndQuestion . "," . EndEnter . ","
	}
	return SubStr(ihMatchList, 1, -1)	;except last character
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