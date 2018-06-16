TITLE Copying a Word Array to a DoubleWord array
; This program copies all the elements from an unsigned Word (16-bit)
; array into an unsigned doubleword (32-bit) array using a loop.
INCLUDE Irvine32.inc

.DATA
wordArray		WORD 100h,200h,300h,400h
introduction	BYTE "This is the original word array:",0
conclusion	BYTE "This is the doubleword copy:",0

.DATA?
dWordArray DWORD LENGTHOF wordArray DUP(?)

.CODE
main PROC
	call		Clrscr
	mov		edx,OFFSET introduction
	call		Writestring
	call		Crlf
	mov		esi,OFFSET wordArray
	mov		ecx,LENGTHOF wordArray
	mov		ebx,TYPE wordArray
	call		DumpMem
	call		Crlf

	mov		esi,0
	mov		ecx,LENGTHOF wordArray
CopyArrayElements:
	movzx	eax,wordArray[esi]
	mov		dWordArray[esi * 2],eax
	add		esi,TYPE wordArray
loop	CopyArrayElements

	mov		edx,OFFSET conclusion
	call		Writestring
	call		Crlf
	mov		esi,OFFSET dWordArray
	mov		ecx,LENGTHOF dWordArray
	mov		ebx,TYPE dWordArray
	call		DumpMem
	call		Crlf

	exit
main ENDP
END main