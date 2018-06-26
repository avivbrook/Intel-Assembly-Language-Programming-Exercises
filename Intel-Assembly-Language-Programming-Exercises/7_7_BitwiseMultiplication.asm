TITLE Bitwise Multiplication

INCLUDE Irvine32.inc

.CODE
main PROC
	mov	eax,123
	mov	ebx,36
	call	BitwiseMultiply
	call	DumpRegs			; EAX = 114Ch, 4428d
	exit
main ENDP

;-----------------------------------------------------
BitwiseMultiply PROC USES ebx edx
;
; Multiplies any unsigned 32-bit integer by EAX, using only shifting and
; addition.
; Receives: EAX = multiplicand, EBX = multiplier
; Returns: EAX = product
	mov	edx,eax		; EDX = multiplicand
	mov	eax,0		; initialise result
	jmp	CmpMultiplier	; while multiplier > 0
TestMultiplier:
	test	ebx,1
	jp	NotOdd		; if multiplier is odd, add multiplicand to result
	add	eax,edx
NotOdd:
	shl	edx,1		; double multiplicand
	shr	ebx,1		; halve multiplier
CmpMultiplier:
	cmp	ebx,0
	ja	TestMultiplier
	ret
BitwiseMultiply ENDP
END main