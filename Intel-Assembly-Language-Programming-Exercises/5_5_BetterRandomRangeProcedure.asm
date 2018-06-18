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
	mov	eax,N
	mov	ebx,M
	mov	ecx,NUMBER_OF_CALLS
GenerateValues:
	call BetterRandomRange
loop GenerateValues
	exit
main ENDP

; This procedure is a improved version of the RandomRange procedure.
; Instead of generating a pseudorandom integer between 0 and N - 1, it
; generates an integer between M ands N - 1
; Receives:	EBX = M (lower range),	EAX = N (upper range)
; Returns:	EAX = psuedorandom value
BetterRandomRange PROC USES eax ebx
	sub	eax,ebx
	call	RandomRange
	add	eax,ebx
	call	Writeint
	call	Crlf
	ret
BetterRandomRange ENDP
END main