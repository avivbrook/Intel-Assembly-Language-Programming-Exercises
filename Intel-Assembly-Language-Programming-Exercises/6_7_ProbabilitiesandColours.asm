TITLE Probabilities and Colours
; This program randomly chooses amongst three different colours for
; displaying text on the screen.
INCLUDE Irvine32.inc

.DATA
text	BYTE	"This is string will randomly change colours!",0Dh,0Ah,0

.CODE
main PROC
	call	Randomize
	mov	ecx,20					; 20 lines of text
PrintText:
	mov	eax,10					; generate a random integer between 0 and 9
	call	RandomRange
	cmp	eax,2					; 0 <= EAX <= 2 ?
	ja	NotWhite
	mov	eax,white + (black * 16)		; white = 30% probability
	jmp	done
NotWhite:
	cmp	eax,3					; EAX == 3 ?
	jne	NotBlue
	mov	eax,blue + (black * 16)		; blue = 10% probability
	jmp	done
NotBlue:							; 4 <= EAX <= 9 ?
		mov	eax,green + (black * 16)	; green = 60% probability
done:
	call	SetTextColor
	mov	edx,OFFSET text
	call	WriteString
	loop	PrintText

	mov	eax,lightGray + (black * 16)	; reset text colour
	call	SetTextColor
	call	Crlf
	exit
main ENDP
END main