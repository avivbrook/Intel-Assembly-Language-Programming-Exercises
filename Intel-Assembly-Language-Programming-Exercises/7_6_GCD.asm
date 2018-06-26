TITLE Greatest Common Divisor
; This program finds the greatest common divisor of two integers.
INCLUDE Irvine32.inc

GCD PROTO	x:SDWORD, y:SDWORD
abs PROTO, x:PTR SDWORD

.CODE
main PROC
	INVOKE GCD, 54, 24
	call	WriteInt		; 6
	call	Crlf
	INVOKE GCD, 42, 56
	call	WriteInt		; 14
	call	Crlf
	INVOKE GCD, 48, 180
	call	WriteInt		; 12
	call	Crlf
	INVOKE GCD, -24, 54
	call	WriteInt		; 6
	call	Crlf
	exit
main ENDP

;-----------------------------------------------------
GCD PROC USES ebx edx,
	x:SDWORD,
	y:SDWORD
;
; Calculates the GCD of two 32-bit integers.
; Returns: EAX = GCD(x,y)
;-----------------------------------------------------
	INVOKE abs, ADDR x	; x = abs(x)
	INVOKE abs, ADDR y	; y = abs(y)

LoopStart:		; do {
	mov	edx,0
	mov	eax,x
	mov	ebx,y
	div	ebx		; EDX = x % y
	mov	x,ebx	; x = y
	mov	y,edx	; y = EDX
	cmp	y,0
	jle	Done
	jmp LoopStart	; } while (y > 0)
Done:
	mov	eax,x	; return the GCD in EAX
	ret
GCD ENDP

;-----------------------------------------------------
abs PROC USES eax edx esi,
	val:PTR SDWORD
;
; Calculates the absolute value of a 32-bit integer using
; abs(val) = (val XOR val2) - val2
; where val2 = val SAR 31.
; Returns: val = abs(val)
;-----------------------------------------------------
	mov	esi,val
	mov	eax,[esi]	; [esi] is memory for val on stack
	sar	eax,31	; EAX = val2
	mov	edx,eax
	xor	edx,[esi]	; EDX = val XOR val2
	mov	[esi],edx	; [esi] is memory for output on stack
	sub	[esi],eax	; (val XOR val2) - val2
	ret
abs ENDP
END main