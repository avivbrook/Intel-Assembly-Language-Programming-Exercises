; DifferentInputs Program	(Inputs_main.asm)

; Test program for the DifferentInputs procedure.

INCLUDE inputs.inc

.CODE
main PROC
	call	Clrscr
	INVOKE DifferentInputs, 1, 1, 1
	call	DumpRegs	; EAX = 0
	INVOKE DifferentInputs, 2, 1, 1
	call	DumpRegs	; EAX = 0
	INVOKE DifferentInputs, 1, 2, 3
	call	DumpRegs	; EAX = 1
	INVOKE DifferentInputs, 1, 2, 1
	call	DumpRegs	; EAX = 0
	INVOKE DifferentInputs, 0, 1, 4
	call	DumpRegs	; EAX = 1
	exit
main ENDP
END main