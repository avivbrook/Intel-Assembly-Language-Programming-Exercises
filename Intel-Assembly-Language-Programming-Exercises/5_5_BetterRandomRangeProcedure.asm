TITLE BetterRandomRange Procedure
; This program showcases the BetterRandomRange procedure, an improved
; version of the RandomRange procedure.
INCLUDE Irvine32.inc

NUMBER_OF_CALLS = 50

.DATA
M	DWORD	-300
N	DWORD	100

.CODE
main PROC
	call	Clrscr
	mov	eax,M
	mov	ebx,N
	mov	ecx,NUMBER_OF_CALLS
GenerateValues:
	call BetterRandomRange
loop GenerateValues
	exit
main ENDP

BetterRandomRange PROC USES eax ebx
	sub	ebx,eax
	xchg	ebx,eax
	call	RandomRange
	neg	ebx
	sub	eax,ebx
	call	Writeint
	call	Crlf
	ret
BetterRandomRange ENDP
END main