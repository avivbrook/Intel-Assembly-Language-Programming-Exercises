TITLE Colour Matrix
; This program displays a single character in all possible combinations of
; foreground and background colours (16 X 16 = 256).
INCLUDE Irvine32.inc

.DATA?
loopCounter	DWORD	?

.CODE
main PROC
	mov	eax,0
	mov	ecx,16
L1:
	mov	loopCounter,ecx
	push	eax
	mov	ecx,16
L2:
	call	SetTextColor
	push	eax
	mov	al,'A'
	call	WriteChar
	mov	eax,100
	call	Delay
	pop	eax
	inc	eax
loop L2
	call	Crlf
	pop	eax
	add	eax,16
	mov	ecx,loopCounter
loop L1
	call	Crlf
	mov	eax,lightGray + (black * 16)
	exit
main ENDP
END main