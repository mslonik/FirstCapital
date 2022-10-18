#SingleInstance, 	force
#Warn
#NoEnv
#KeyHistory, 		100

;global variables
a_Ordinary 			:= []	;a_ = global array
a_Capital 			:= []	;a_ = global array
c_NoOfLettersInAlphabet	:= 26	;c_ = global constant
c_ASCIIShiftOrdinary	:= 96	;c_ = global constant
c_ASCIIShiftCaptal		:= 64	;c_ = global constant

Loop, v_NoOfLettersInAlphabet
{
	a_Ordinary[A_Index] := Chr(A_Index + 96)
	a_Capital[A_Index]	:= Chr(A_Index + 64)
}

return