; DrawSquare Procedure	(_drawsquare.asm)
INCLUDE board.inc

.CODE
;-----------------------------------------------------
DrawSquare PROC USES eax,
	bgColour:BYTE			; square colour
;
; Draws a square.
; Returns: nothing.
;-----------------------------------------------------
	movzx	eax,bgColour	; 8 denotes gray square, 15 denotes white square
	shl		eax,4		; multiply background colour by 16
	call		SetTextColor
	mov		al,' '		; draw blank character
	call		WriteChar
	ret
DrawSquare ENDP
END