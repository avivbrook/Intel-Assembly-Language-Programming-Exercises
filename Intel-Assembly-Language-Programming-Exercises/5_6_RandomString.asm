TITLE Random Strings
; This program showcases the RandomString procedure, which generates a
; random string of length L.
INCLUDE Irvine32.inc

NUMBER_OF_STRINGS = 20
L = 7

.DATA?
randomString	BYTE		L DUP (?)

.CODE
main PROC
	call	Clrscr
	mov	eax,L
	mov	esi,OFFSET randomString
	mov	ecx,NUMBER_OF_STRINGS
GenerateStrings:
	call	GenerateRandomString
	mov	edx,OFFSET randomString
	call	Writestring
	call	Crlf
loop GenerateStrings
	exit
main ENDP

; Generates a random string of length L.
; Receives:	EAX =	L (string length)
;			ESI =	pointer to array of bytes that will hold the
;					random string
; Returns:	randomString = the pseudorandomly generated string
GenerateRandomString PROC USES eax ecx esi
	mov	ecx,eax
GenerateChar:
	mov	eax,26
	call	RandomRange
	add	eax,65
	mov	[esi],eax
	inc	esi
loop GenerateChar
	mov	eax,0
	mov	[esi],eax
	ret
GenerateRandomString ENDP
END main