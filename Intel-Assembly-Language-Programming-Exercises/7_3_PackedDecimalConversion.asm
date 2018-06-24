TITLE Packed Decimal Conversion
; This program converts packed decimal to ASCII.
INCLUDE Irvine32.inc

.DATA
pdi1		DWORD	12345678h	; 12,345,678 decimal
pdi2		DWORD	08723654h	; 8,723,654 decimal
pdi3		DWORD	23456739h	; 23,456,739 decimal
pdi4		DWORD	28737285h	; 28,737,285 decimal
pdi5		DWORD	93450237h	; 93,450,237 decimal
buffer	BYTE		8 DUP(0),0

.CODE
main PROC
	mov	edx,pdi1			; EDX = packed decimal integer
	mov	esi,OFFSET buffer	; points to the buffer
	call	PackedToAsc		; do the conversion
	mov	edx,OFFSET buffer	; display the buffer
	call	WriteString		; output: 12345678
	call	Crlf

	mov	edx,pdi2
	mov	esi,OFFSET buffer
	call	PackedToAsc
	mov	edx,OFFSET buffer
	call	WriteString		; output: 08723654
	call	Crlf

	mov	edx,pdi3
	mov	esi,OFFSET buffer
	call	PackedToAsc
	mov	edx,OFFSET buffer
	call	WriteString		; output: 23456739
	call	Crlf

	mov	edx,pdi4
	mov	esi,OFFSET buffer
	call	PackedToAsc
	mov	edx,OFFSET buffer
	call	WriteString		; output: 28737285
	call	Crlf

	mov	edx,pdi5
	mov	esi,OFFSET buffer
	call	PackedToAsc
	mov	edx,OFFSET buffer
	call	WriteString		; output: 93450237
	call	Crlf

	exit
main ENDP

;---------------------------------------------------------
PackedToAsc PROC USES eax ecx edx
;
; Converts a 4-byte packed decimal integer to a string of ASCII decimal
; digits.
; Receives: EDX = packed integer, ESI points to buffer
; Returns: buffer filled with ASCII binary digits
;---------------------------------------------------------
	push	eax
	push	ecx
	push	edx

	mov	ecx,8			; ASCII stores one digit per byte
ConvertToASCII:
	mov	al,dl			; AL = two lowest digits
	and	al,0Fh			; clear 4 highest bits, AL = lowest digit
	or	al,30h			; convert unpacked to ASCII
	mov	[esi + ecx - 1],al	; add digit to buffer
	shr	edx,4			; shift right 4 bits to current lowest digit
	loop	ConvertToASCII

	pop	edx
	pop	ecx
	pop	eax
	ret
PackedToAsc ENDP
END main