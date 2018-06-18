TITLE Draw Text Colours
; This program displays the same string in four different colours, using
; the SetTextColor procedure from the Irvine32 link library and a loop.
INCLUDE Irvine32.inc

.DATA
myString	BYTE	"This string will change colours!",0

.CODE
main PROC
	mov	eax,lightRed + (blue * 16)
	call	SetTextColor
	call	Clrscr
	mov	ecx,4
ChangeColours:
	call	SetTextColor
	mov	edx,OFFSET myString
	call	Writestring
	call	Crlf
	add	eax,1
loop ChangeColours
	exit
main ENDP
END main