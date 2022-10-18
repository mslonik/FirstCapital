;Run this script as the first one, before any Hotstring definition (static or dynamic)
#SingleInstance, 	force
#Warn
#NoEnv
#KeyHistory, 		100
SendMode,			Input

	o_ih			:= InputHook("C V * E", , F_DefineMatch())	;C = CaseSensitive = true, L0 = disables collection of text and the length limit, V = VisibleText = true, E = handle single-character end keys character code instead of key code
,	o_ih.OnEnd	:= Func("F_OnEnd")
	o_ih.Start()

F_OnEnd(o_ih)
{
	SendInput, % "{BS}"
	SendLevel, 2
	SendInput, % Format("{:U}", SubStr(o_ih.Match, 0))
	SendLevel, 0
	o_ih.Start()
}

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