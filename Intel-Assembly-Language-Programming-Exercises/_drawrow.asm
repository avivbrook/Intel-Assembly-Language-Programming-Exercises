; DrawRow Procedure	(_drawrow.asm)
INCLUDE board.inc

.CODE
;-----------------------------------------------------
DrawRow PROC USES eax ecx edx,
	rowNum:BYTE	; row number
;
; Draws a row of the chess board.
; Returns: nothing.
;-----------------------------------------------------
	mov	dh,rowNum			; current row
	mov	ecx,8			; loop counter
	mov	dl,0				; first X-coordinate
DrawSquares:
	call	Gotoxy			; locate cursor at current square
	mov		al,dl
	add		al,dh
	test		al,1			; parity check
	jnp		DrawWhite		; if odd, draw white
	INVOKE	DrawSquare, gray
	jmp		next			; if even, draw gray
DrawWhite:
	INVOKE	DrawSquare, white
next:
	inc		dl
	loop		DrawSquares
	ret
DrawRow ENDP
END