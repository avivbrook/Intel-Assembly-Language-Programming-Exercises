TITLE Message Encryption
; This program encrypts and decrypts some text that the user enters using
; symmetric encryption.
INCLUDE Irvine32.inc

BUFMAX = 128	; maximum buffer size

.DATA
sPrompt	BYTE		"Enter the plain text:	",0
sEncrypt	BYTE		"Cipher text:		",0
sDecrypt	BYTE		"Decrypted:		",0
buffer	BYTE		BUFMAX+1 DUP(0)
key		BYTE		"ABXmv#7"

.DATA?
bufSize	DWORD	?

.CODE
main PROC
	call	InputTheString		; input the plain text
	call	TranslateBuffer	; encrypt the buffer
	mov	edx,OFFSET sEncrypt	; display encrypted message
	call	DisplayMessage
	call	TranslateBuffer	; decrypt the buffer
	mov	edx,OFFSET sDecrypt	; display decrypted message
	call	DisplayMessage
	exit
main ENDP

; This procedure prompts the user for a plaintext string and saves the
; string and its length.
InputTheString PROC
	pushad				; save 32-bit registers
	mov	edx,OFFSET sPrompt	; display a prompt
	call	WriteString
	mov	ecx,BUFMAX		; maximum character count
	mov	edx,OFFSET buffer	; point to the buffer
	call	ReadString		; input the string
	mov	bufSize,eax		; save the length
	call	Crlf
	popad
	ret
InputTheString	ENDP

; This procedure displays the encrypted or decrypted message.
; Receives:	EDX points to the message
DisplayMessage PROC
	pushad
	call	WriteString
	mov	edx,OFFSET buffer	; display the buffer
	call	WriteString
	call	Crlf
	call	Crlf
	popad
	ret
DisplayMessage ENDP

; This procedure translates the string by exlusive-ORing each byte with
; the encryption key byte.
TranslateBuffer PROC
	pushad
	mov	ecx,bufSize	; loop counter
	mov	esi,0		; index 0 in buffer
	mov	edi,0		; index 0 in key
TranslateBytes:
	mov	al,key[edi]	; AL = current character in key
	inc	edi			; next character in key
	cmp	edi,SIZEOF key	; is EDI >= SIZEOF key ?
	jb	Continue		; if not, continue
	sub	edi,SIZEOF key	; if yes, reset EDI tofirst char of key
Continue:
	xor	buffer[esi],al	; translate a byte
	inc	esi			; point to the next byte
	loop	TranslateBytes
	popad
	ret
TranslateBuffer ENDP
END main