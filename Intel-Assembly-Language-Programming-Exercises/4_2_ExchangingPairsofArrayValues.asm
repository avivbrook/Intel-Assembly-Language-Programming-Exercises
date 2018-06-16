TITLE Exchanging Pairs of Array Values
; This program exchanges every pair of values in an array with an even
; number of elements using a loop and indexed addressing.

INCLUDE Irvine32.inc

.DATA
intArray		DWORD 10000h,20000h,30000h,40000h
introduction	BYTE "This is the original array:",0
conclusion	BYTE "This is the array with swapped elements:",0

.CODE
main PROC
	call Clrscr
	mov	edx,OFFSET introduction
	call	Writestring
	call Crlf
	mov	esi,OFFSET intArray
	mov	ecx,LENGTHOF intArray
	mov	ebx,TYPE intArray
	call DumpMem

	mov	edi,OFFSET intArray
	mov	ecx,LENGTHOF intArray / 2
SwapElements:
	mov	eax,[edi]
	mov	ebx,[edi + TYPE intArray]
	mov	[edi],ebx
	add	edi,TYPE intArray
	mov	[edi],eax
	add	edi,TYPE intArray
loop SwapElements

	call Crlf
	mov	edx,OFFSET conclusion
	call	Writestring
	call Crlf
	mov	esi,OFFSET intArray
	mov	ecx,LENGTHOF intArray
	mov	ebx,TYPE intArray
	call DumpMem
	call Crlf

	exit
main ENDP
END main