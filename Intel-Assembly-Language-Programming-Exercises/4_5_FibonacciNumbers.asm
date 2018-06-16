TITLE Fibonacci Numbers
; This program calculates the first seven values of the Fibonacci number
; sequence using a loop. The sequence is described by the formula:
; Fib(1) = 1, Fib(2) = 1, Fib(n) = Fib(n - 1) + Fib(n - 2)
INCLUDE Irvine32.inc

NUMBER_OF_VALUES = 7

.DATA
explanation		BYTE "First ",0
				BYTE " values of the Fibonacci number sequence:",0

.DATA?
fibonacciSequence	BYTE NUMBER_OF_VALUES DUP(?)

.CODE
main PROC
	call	Clrscr

	mov	fibonacciSequence[0],1
	mov	fibonacciSequence[1],1
	mov	ecx,NUMBER_OF_VALUES - 2
	mov	esi,2
CalculateSequence:
	mov	al,fibonacciSequence[esi - 1]
	add	al,fibonacciSequence[esi - 2]
	mov	fibonacciSequence[esi],al
	inc	esi
loop CalculateSequence

	mov	edx,OFFSET explanation
	call	Writestring
	mov	eax,NUMBER_OF_VALUES
	call	Writedec
	mov	edx,OFFSET explanation[7]
	call	Writestring
	call	Crlf

	mov	esi,OFFSET fibonacciSequence
	mov	ecx,LENGTHOF fibonacciSequence
	mov	ebx,TYPE fibonacciSequence
	call DumpMem
	call	Crlf

	exit
main ENDP
END main