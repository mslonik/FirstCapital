/* 
 	Author:      	Maciej Słojewski (🐘, mslonik, http://mslonik.pl)
 	Purpose:     	Reduce usage of Shift key(s) modifiers on time of typing.
 	Description: 	After some punctuation marks (., ?, !, <Enter>) automatically converts first letter into capitalized form.
 	License:     	GNU GPL v.3
	Notes:		Run this script as the first one, before any Hotstring definition (static or dynamic).
				Save this file as UTF-8 with BOM.
*/
#SingleInstance, 	force	; Only one instance of this script may run at a time!
#Warn					; Enable warnings to assist with detecting common errors.
#NoEnv					; Recommended for performance and compatibility with future AutoHotkey releases.
#Requires AutoHotkey v1.1.33+	; Displays an error and quits if a version requirement is not met.
SetBatchLines, 	-1		; Use SetBatchLines -1 to never sleep (i.e. have the script run at maximum speed).


; - - - - - - - - - - - - - - CONVERSION TO EXE: BEGINNING- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
global AppVersion			:= "1.0.0"
;@Ahk2Exe-Let vAppVersion=%A_PriorLine~U)^(.+"){1}(.+)".*$~$2% ; Keep these lines together
;Overrides the custom EXE icon used for compilation
;@Ahk2Exe-SetCopyright GNU GPL 3.x
;@Ahk2Exe-SetDescription After some punctuation marks (.`, ?`, !`, <Enter>) automatically converts first letter into capitalized form.
;@Ahk2Exe-SetProductName Original script name: %A_ScriptName%
;@Ahk2Exe-Set OriginalScriptlocation, https://github.com/mslonik/FirstCapital
;@Ahk2Exe-SetCompanyName  http://mslonik.pl
;@Ahk2Exe-SetFileVersion %U_vAppVersion%
FileInstall, LICENSE, LICENSE, 0
; - - - - - - - - - - - - - - CONVERSION TO EXE: END- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

global c_NoOfAlphabetLetters	:= 26	;c_ constant
, c_OrdinaryLetters			:= 96	;c_ constant
, c_CapitalLetters			:= 64	;c_ constant
, IconAsteriskInfo			:= 64
, v_IfRun					:= true	;v_ variable, global; determines if script definitions should run

Switch A_Args[1]				;lunch time arguments
{
	Case "-e": v_IfRun := true	;enable
	Case "-d": v_IfRun := false	;disable
}

F_FirstCapital(v_IfRun)
Menu, Tray, Icon, c:\Windows\System32\imageres.dll, 124     ; this line will turn the default "H icon" into something else.
F_TrayMenu()

; - - - - - - - - - - - - - - GLOBAL HOTSTRINGS: BEGINNING- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
:*:fchelp/::
	F_Help()
return

:*:fcenable/::
	F_FirstCapital(v_IfRun := true)
	MsgBox, % IconAsteriskInfo, % SubStr(A_ScriptName, 1, -4) . ":" . A_Space . "information", % "Hotstrings are" . A_Space . (v_IfRun ? "ENABLED" : "DISABLED") . "."
return

:*:fcdisable/::
	F_FirstCapital(v_IfRun := false)
	MsgBox, % IconAsteriskInfo, % SubStr(A_ScriptName, 1, -4) . ":" . A_Space . "information", % "Hotstrings are" . A_Space . (v_IfRun ? "ENABLED" : "DISABLED") . "."
return

:*:fcexit/::
	ExitApp, 0
return

:*:fcrestart/::
:*:fcreload/::
	reload
return

:*:fcstatus/::
:*:fcshow/::
	MsgBox, % IconAsteriskInfo, % SubStr(A_ScriptName, 1, -4) . ":" . A_Space . "information", % "Current state of script hotstrings:" . A_Space . (v_IfRun ? "ENABLED" : "DISABLED") . "."
return

:*:fctoggle/::
F23::					;switch state of application; when v_IfRun is set application would run.
:*:f23/::
	F_Toggle()
return
; - - - - - - - - - - - - - - GLOBAL HOTSTRINGS: END- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

; - - - - - - - - - - - - - - FUNCTION DEFINITIONS: BEGINNING- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
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
			Hotstring(":CB0?*:. " 	. Chr(A_Index + c_OrdinaryLetters), "{BS}" . Chr(A_Index + c_CapitalLetters), "Off")
		Loop, % c_NoOfAlphabetLetters
			Hotstring(":CB0?*:! " 	. Chr(A_Index + c_OrdinaryLetters), "{BS}" . Chr(A_Index + c_CapitalLetters), "Off")
		Loop, % c_NoOfAlphabetLetters
			Hotstring(":CB0?*:? " 	. Chr(A_Index + c_OrdinaryLetters), "{BS}" . Chr(A_Index + c_CapitalLetters), "Off")
		Loop, % c_NoOfAlphabetLetters
			Hotstring(":CB0?*:`n" 	. Chr(A_Index + c_OrdinaryLetters), "{BS}" . Chr(A_Index + c_CapitalLetters), "Off")
	}
	Hotstring("Reset")
}
; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
F_Toggle()
{
	global	;assume-global mode of operation
	local	PreviousState := v_IfRun

	v_IfRun		:= !v_IfRun
	F_FirstCapital(v_IfRun)
	Menu, Tray, Rename, % A_ScriptName . A_Space . "status:" . A_Space . (PreviousState ? "ENABLED" : "DISABLED"), % A_ScriptName . A_Space . "status:" . A_Space . (v_IfRun ? "ENABLED" : "DISABLED")
	MsgBox, % IconAsteriskInfo, % SubStr(A_ScriptName, 1, -4) . ":" . A_Space . "information", % "Current state of script hotstrings:" . A_Space . (v_IfRun ? "ENABLED" : "DISABLED") . "."
}
; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
F_Empty()
{}
; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
F_TrayMenu()
{
    	Menu, Tray, Add, % A_ScriptName . A_Space . "status:" . A_Space . (v_IfRun ? "ENABLED" : "DISABLED"),	F_Empty
	Menu, Tray, Add, Toggle application status,													F_Toggle
	Menu, Tray, Add, Control help...,															F_Help
	Menu, Tray, Add, About,																	F_About
    	Menu, Tray, Add ; To add a menu separator line, omit all three parameters. To put your menu items on top of the standard menu items (after adding your own menu items) run Menu, Tray, NoStandard followed by Menu, Tray, Standard.
    	Menu, Tray, Default, % A_ScriptName . A_Space . "status:" . A_Space . (v_IfRun ? "ENABLED" : "DISABLED") ; Default: Changes the menu's default item to be the specified menu item and makes its font bold.
    	Menu, Tray, NoStandard
    	Menu, Tray, Standard
    	Menu, Tray, Tip, % SubStr(A_ScriptName, 1, -4) ; Changes the tray icon's tooltip.
}
; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
F_About()
{
	MsgBox, 64, % SubStr(A_ScriptName, 1, -4) . ":" . A_Space . "information", % "Application automatically replaces ordinary letters to capital letters following the punctuation marks:"
		. "`n`n"
		. "." . A_Tab . A_Tab . 			"e.g. foo. bar → foo. Bar"				. "`n"
		. "!" . A_Tab . A_Tab . 			"e.g. foo! bar → foo! Bar"				. "`n"
		. "?" . A_Tab . A_Tab .			"e.g. foo? bar → foo? Bar"				. "`n"
		. "<enter>" . A_Tab . A_Tab . 	"e.g. foo<enter>bar → foo<enter>Bar"		. "`n"
		. "`n`n"
		. "Runtime file location:" . A_Tab . A_ScriptDir							. "`n"
		. "License:" . A_Tab . A_Tab .	"GNU GPL v3.x"							. "`n"
		. "Author:" . A_Tab . A_Tab . 	"Maciej Słojewski (🐘), http://mslonik.pl"
}
; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
F_Help()
{
	MsgBox, 64, % SubStr(A_ScriptName, 1, -4) . ":" . A_Space . "information", % "Application hotstrings" . "." . A_Space . "All of them are ""immediate execute"" (*)" . "`n"
		. "and active anywhere in operating system (any window)"											. "`n"
		. "`n`n"
		. "fchelp/" . A_Tab . A_Tab . 	"shows this message"					. "`n"
		. "fcshow/" . A_Tab . A_Tab . 	"current state: ENABLED or DISABLED"		. "`n"
		. "fcstatus/" . A_Tab . A_Tab .	"current state: ENABLED or DISABLED"		. "`n"
		. "fctoggle/" . A_Tab . A_Tab . 	"toggle between ENABLED and DISABLED"		. "`n"
		. "fcenable/" . A_Tab . A_Tab . 	"enable first capital"					. "`n"
		. "fcdisable/" . A_Tab . 		"disable first capital"					. "`n"
		. "fcrestart/" . A_Tab . A_Tab .	"reload" . A_Space . "application"			. "`n"
		. "fcreload/" . A_Tab . A_Tab . 	"reload" . A_Space . "application"			. "`n"
		. "fcexit/" . A_Tab . A_Tab .		"exit" . A_Space . "application"
		. "`n`n"
		. "Available lunch time arguments:"									. "`n"
		. "-e" . A_Tab . A_Tab .			"enable first capital on startup"			. "`n"
		. "-d" . A_Tab . A_Tab . 		"disable first capital on startup"
}