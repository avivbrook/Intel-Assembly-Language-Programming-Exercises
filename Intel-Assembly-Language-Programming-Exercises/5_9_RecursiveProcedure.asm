TITLE Recursive Procedure
; This program calls a recursive procedure.
INCLUDE Irvine32.inc

NUMBER_OF_CALLS = 10

.DATA?
counter	DWORD	?

.CODE
main PROC
	mov	counter,0
	mov	ecx,NUMBER_OF_CALLS
	call RecursiveProcedure
	exit
main ENDP

RecursiveProcedure PROC
	inc	counter
	cmp	counter,ecx
	jz	quit
	call	RecursiveProcedure
quit:
	ret
RecursiveProcedure ENDP
END main