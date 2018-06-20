TITLE Encryption Using Rotate Operations
; This program tests the TranslateBuffer procedure by calling it twice
; with different data sets.
INCLUDE Irvine32.inc

.DATA
key1		BYTE		-2,4,1,0,-3,5,2,-4,-4,6
keySize = $ - key1
key2		BYTE		-3,4,1,0,-3,5,2,-4,-4,6
plain	BYTE		"Plain text: ",0
cipher	BYTE		"Cipher text: ",0
buffer1	BYTE		"Bank account #: 8753257",0
buffer2	BYTE		"This is a Plaintext message",0

.CODE
main PROC
	mov	edx,OFFSET plain
	call	WriteString
	mov	edx,OFFSET buffer1
	call	WriteString
	call	Crlf
	mov	esi,OFFSET buffer1
	mov	edi,OFFSET key1
	mov	ecx,SIZEOF buffer1
	call	TranslateBuffer	; encrypt the buffer
	mov	edx,OFFSET cipher	; display encrypted message
	mov	esi,OFFSET buffer1
	call	DisplayMessage

	mov	edx,OFFSET plain
	call	WriteString
	mov	edx,OFFSET buffer2
	call	WriteString
	call	Crlf
	mov	esi,OFFSET buffer2
	mov	edi,OFFSET key2
	mov	ecx,SIZEOF buffer2
	call	TranslateBuffer	; encrypt the buffer
	mov	edx,OFFSET cipher	; display encrypted message
	mov	esi,OFFSET buffer2
	call	DisplayMessage
	exit
main ENDP

; This procedure performs simple encryption by rotating each plaintext
; byte a varying number of positions in different directions.
; Receives:	ESI = points to the buffer, EDI = points to the key,
;			ECX = size of buffer
TranslateBuffer PROC
	pushad
	mov	edx,0
TranslateBytes:
	push	ecx
	mov	cl,[edi + edx]	; AL = current character in key
	inc	edx			; next character in key
	cmp	edx,keySize	; is EDI >= SIZEOF key ?
	jb	Continue		; if not, continue
	sub	edx,keySize	; if yes, reset EDI tofirst char of key
Continue:
	or	cl,cl		; set Zero and Sign flags
	je	Done			; if Zero flag is set, CL = 0
	js	IsNegative	; if Sign flag is set, CL < 0
	ror	BYTE PTR [esi],cl	; CL > 0 so rotate right
	jmp	Done
IsNegative:
	neg	cl			; CL < 0 so rotate left
	rol	BYTE PTR [esi],cl
Done:
	inc	esi			; point to the next byte
	pop	ecx
	loop	TranslateBytes
	popad
	ret
TranslateBuffer ENDP

; This procedure displays the encrypted or decrypted message.
; Receives:	EDX points to the message, ESI points to the buffer
DisplayMessage PROC
	pushad
	call	WriteString
	mov	edx,esi		; display the buffer
	call	WriteString
	call	Crlf
	popad
	ret
DisplayMessage ENDP
END main