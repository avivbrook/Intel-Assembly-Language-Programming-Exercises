; DrawBoard Procedure	(_drawboard.asm)
INCLUDE board.inc

.CODE
;-----------------------------------------------------
DrawBoard PROC USES eax ecx
;
; Draws the entire chess board.
; Returns: nothing.
;-----------------------------------------------------
	mov	ecx,8
DrawChessBoard:
	dec	cl
	INVOKE DrawRow, cl
	inc	cl
	loop	DrawChessBoard
	mov	eax,0		; set foreground & background colours to black to hide waitmsg
	call	SetTextColor
	ret
DrawBoard ENDP
END