TITLE Integer Expression Calculation
; This program calculates the following expression, using registers:
; val1 = (val1 + val2) - (val3 + val4).

INCLUDE Irvine32.inc

.DATA
description	BYTE "This program will calculate the integer expression A = ",0
expression	BYTE "(A + B) - (C + D)",0

.DATA?
val1		DWORD ?
val2		DWORD ?
val3		DWORD ?
val4		DWORD ?
result	DWORD ?

.CODE
main PROC
	call	Clrscr
	mov	edx,OFFSET description
	call Writestring
	mov	edx,OFFSET expression
	call	Writestring
	call Crlf
	call Crlf

	call GetInput
	call CalculateExpression
	call Output

	call Crlf

	exit
main ENDP

.DATA
prompt1	BYTE "Please enter integer A: ",0
prompt2	BYTE "Please enter integer B: ",0
prompt3	BYTE "Please enter integer C: ",0
prompt4	BYTE "Please enter integer D: ",0

.CODE
; Receives:	prompt1, prompt2, prompt3, prompt4
; Returns:	val1, val2, val3, val4
GetInput PROC USES eax edx
	mov	edx,OFFSET prompt1
	call Writestring
	call Readint
	mov	val1,eax
	call Crlf

	mov	edx,OFFSET prompt2
	call Writestring
	call Readint
	mov	val2,eax
	call Crlf

	mov	edx,OFFSET prompt3
	call	Writestring
	call	Readint
	mov	val3,eax
	call	Crlf

	mov	edx,OFFSET prompt4
	call Writestring
	call Readint
	mov	val4,eax
	call Crlf

	ret
GetInput ENDP

; Receives:	val1, val2, val3, val4
; Returns:	result = calculated expression
CalculateExpression PROC USES eax ebx ecx edx
	mov	eax,val1
	mov	ebx,val2
	mov	ecx,val3
	mov	edx,val4

	add	eax,ebx
	add	ecx,edx
	sub	eax,ecx

	mov result,eax

	ret
CalculateExpression ENDP

.DATA
equals	BYTE " = ",0

.CODE
; Receives:	result
Output PROC USES eax edx
	mov	edx,OFFSET expression
	call WriteString
	mov	edx,OFFSET equals
	call	WriteString
	mov	eax,result
	call	WriteInt
	call Crlf

	ret
Output ENDP
END main