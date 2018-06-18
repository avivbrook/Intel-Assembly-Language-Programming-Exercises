TITLE Random Screen Location
; This program displays a single character at 100 random screen locations,
; using a timing delay of 100 milliseconds.
INCLUDE Irvine32.inc

NUMBER_OF_CHARS = 100

.DATA
char	BYTE	'A'

.DATA?
rows	BYTE	?
cols	BYTE	?

.CODE
main PROC
	call	GetMaxXY
	mov	ecx,NUMBER_OF_CHARS
GenerateCharsAndPrint:
	call	RandomScreenLocation
loop GenerateCharsAndPrint
	exit
main ENDP

RandomScreenLocation PROC USES eax edx
	movzx	eax,al
	call		RandomRange
	mov		dh,al
	movzx	eax,dl
	call		RandomRange
	mov		dl,al
	call		Gotoxy
	mov		al,char
	call		WriteChar
	ret
RandomScreenLocation ENDP
END main