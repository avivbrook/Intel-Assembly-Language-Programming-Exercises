TITLE Display ASCII Decimal
; This program passes three numbers of different sizes to the WriteScaled
; procedure, which outputs each of the numbers with a decimal point.
INCLUDE Irvine32.inc

DECIMAL_OFFSET = 5

.DATA
decimal_one	BYTE	"100123456789765"
decimal_two	BYTE	"444143474143"
decimal_three	BYTE	"222001"

.CODE
main PROC
	mov	ebx,DECIMAL_OFFSET
	call	Clrscr
	mov	edx,OFFSET decimal_one
	mov	ecx,LENGTHOF decimal_one
	call	WriteScaled
	call	Crlf
	mov	edx,OFFSET decimal_two
	mov	ecx,LENGTHOF decimal_two
	call	WriteScaled
	call	Crlf
	mov	edx,OFFSET decimal_three
	mov	ecx,LENGTHOF decimal_three
	call	WriteScaled
	call	Crlf
	exit
main ENDP

; This procedure outputs a decimal ASCII number with an implied decimal
; point.
; Receives:	EDX = number's offset, ECX = number's length
;			EBX  = decimal's offset
WriteScaled PROC
	pushad
	sub	ecx,ebx
WriteNumberBeforeDecimal:
	mov	al,[edx]
	call	WriteChar
	inc	edx
	loop	WriteNumberBeforeDecimal
	mov	al,'.'
	call	WriteChar
	mov	ecx,ebx
WriteNumberAfterDecimal:
	mov	al,[edx]
	call	WriteChar
	inc	edx
	loop	WriteNumberAfterDecimal
	popad
	ret
WriteScaled ENDP
END main