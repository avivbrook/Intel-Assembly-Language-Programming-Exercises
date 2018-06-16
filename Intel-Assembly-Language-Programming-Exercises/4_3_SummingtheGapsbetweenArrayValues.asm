TITLE Summing the Gaps between Array Values
; This program calculates the sum of all the gaps between successive array
; elements using a loop and indexed addressing.
INCLUDE Irvine32.inc

.DATA
intArray		DWORD	0,2,5,9,10
introduction	BYTE		"This is the original array:",0
conclusion	BYTE		"This is the sum of the gaps: ",0

.DATA?
sum		DWORD ?

.CODE
main PROC
	call Clrscr
	mov	edx,OFFSET introduction
	call	Writestring
	call	Crlf
	mov	esi,OFFSET intArray
	mov	ecx,LENGTHOF intArray
	mov	ebx,TYPE intArray
	call	DumpMem
	mov	esi,OFFSET intArray
	mov	ecx,LENGTHOF intArray - 1
SumGaps:
	mov	eax,[esi]
	add	esi,TYPE intArray
	mov	ebx,[esi]
	sub	ebx,eax
	add	sum,ebx
loop SumGaps
	call	Crlf
	mov	edx,OFFSET conclusion
	call	Writestring
	mov	eax,sum
	call Writeint
	call	Crlf
	call	Crlf

	exit
main ENDP
END main