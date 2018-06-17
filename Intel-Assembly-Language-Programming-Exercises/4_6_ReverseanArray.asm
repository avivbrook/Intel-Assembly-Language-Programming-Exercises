TITLE Reverse an Array
; This program reverses the elements of an integer array.
; The array type must be 32-bits or smaller (BYTE, WORD, or DWORD).
INCLUDE Irvine32.inc

.DATA
intArray		DWORD	1,5,6,8,0Ah,1Bh,1Eh,22h,2Ah,32h
original		BYTE		"Original array:",0
reversed		BYTE		"Reversed array:",0

.CODE
main PROC
	call Clrscr
	mov	edx,OFFSET original
	call	Writestring
	call	Crlf
	mov	esi,OFFSET intArray
	mov	ecx,LENGTHOF intArray
	mov	ebx,TYPE intArray
	call	DumpMem
	mov	esi,OFFSET intArray
	mov	edi,OFFSET intArray + SIZEOF intArray - TYPE intArray
	mov	ecx,LENGTHOF intArray
	mov	eax,TYPE intArray

	cmp	eax,TYPE DWORD
	jne NotDWORD
	call	ReverseDWORD
	jmp	Output
NotDWORD:
	cmp	eax,TYPE WORD
	jne	NotWORD
	call	ReverseWORD
	jmp	Output
NotWORD:
	call	ReverseBYTE
Output:
	mov	edx,OFFSET reversed
	call	Writestring
	call	Crlf
	mov	esi,OFFSET intArray
	mov	ecx,LENGTHOF intArray
	mov	ebx,TYPE intArray
	call	DumpMem
	call	Crlf
	exit
main ENDP

ReverseDWORD PROC
ReverseArray:
	mov	eax,[esi]
	mov	ebx,[edi]
	xchg	eax,ebx
	mov	[esi],eax
	mov	[edi],ebx
	add	esi,TYPE intArray
	sub	edi,TYPE intArray
	dec	ecx
loop ReverseArray
	ret
ReverseDWORD ENDP

ReverseWORD PROC
ReverseArray:
	mov	ax,[esi]
	mov	bx,[edi]
	xchg	ax,bx
	mov	[esi],ax
	mov	[edi],bx
	add	esi,TYPE intArray
	sub	edi,TYPE intArray
	dec	ecx
loop ReverseArray
	ret
ReverseWORD ENDP

ReverseBYTE PROC
ReverseArray:
	mov	al,[esi]
	mov	bl,[edi]
	xchg	al,bl
	mov	[esi],al
	mov	[edi],bl
	add	esi,TYPE intArray
	sub	edi,TYPE intArray
	dec	ecx
loop ReverseArray
	ret
ReverseBYTE ENDP
END main