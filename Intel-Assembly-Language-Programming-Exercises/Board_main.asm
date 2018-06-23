; Chess Board Program	(Board_main.asm)

; This program draws an 8X8 chess board, with alternating gray and white
; squares.
INCLUDE board.inc

; 0 1 2 3 4 5 6 7
; g w g w g w g w
.CODE
main PROC
	call		Clrscr
	INVOKE	DrawBoard
	exit
main ENDP
END main