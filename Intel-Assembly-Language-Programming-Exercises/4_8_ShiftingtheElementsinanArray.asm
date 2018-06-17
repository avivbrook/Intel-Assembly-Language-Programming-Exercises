TITLE Shifting the Elements in an Array
; This program rotates the numbers of a 32-bit integer array forward one
; position. The value at the end of the array wraps around to the first
; position.
INCLUDE Irvine32.inc

.DATA
intArray		DWORD	10,20,30,40
introduction	BYTE		"This is the original array:",0
conclusion	BYTE		"This is the shifted array:",0

.CODE
main PROC
	call	Clrscr
	mov	edx,OFFSET introduction
	call	Writestring
	call	Crlf
	mov	esi,OFFSET intArray
	mov	ecx,LENGTHOF intArray
	mov	ebx,TYPE intArray
	call	DumpMem
	mov	ecx,LENGTHOF intArray - 1
	mov	ebx,intArray[0]
	mov	esi,TYPE intArray
ShiftArrayElements:
	mov	eax,ebx
	mov	ebx,intArray[esi]
	mov	intArray[esi],eax
	add	esi,TYPE intArray
loop ShiftArrayElements
	mov	intArray[0],ebx
	call	Crlf
	mov	edx,OFFSET conclusion
	call	Writestring
	call	Crlf
	mov	esi,OFFSET intArray
	mov	ecx,LENGTHOF intArray
	mov	ebx,TYPE intArray
	call	DumpMem
	call	Crlf

	exit
main ENDP
END main