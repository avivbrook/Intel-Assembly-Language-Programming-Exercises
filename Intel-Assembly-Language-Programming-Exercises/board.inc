; Include file for the ChessBoard Program	(board.inc)
INCLUDE Irvine32.inc

DrawRow PROTO,
	rowNum:BYTE	; row number

DrawSquare PROTO,
	bgColour:BYTE	; square colour

DrawBoard PROTO