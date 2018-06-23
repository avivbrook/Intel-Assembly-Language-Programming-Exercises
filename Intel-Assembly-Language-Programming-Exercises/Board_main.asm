; Chess Board Program	(Board_main.asm)

; This program draws an 8X8 chess board, with alternating gray and white
; squares.
INCLUDE board.inc

.CODE
main PROC
	call		Clrscr
	INVOKE	DrawBoard
	exit
main ENDP
END main