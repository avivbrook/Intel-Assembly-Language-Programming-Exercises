TITLE Validating a PIN
; This program validates a number of 5-digit PINs to ensure the values are
; within the specified ranges.
INCLUDE Irvine32.inc

PIN_LENGTH = 5

.DATA
pin1		BYTE	5,2,4,1,3	; valid PIN
pin2		BYTE	4,3,5,3,4	; first digit out of range
pin3		BYTE	6,4,5,3,7	; last digit out of range
pin4		BYTE	7,4,6,3,5	; valid PIN

.CODE
main PROC
	mov	esi,OFFSET pin1
	call	Output
	mov	esi,OFFSET pin2
	call	Output
	mov	esi,OFFSET pin3
	call	Output
	mov	esi,OFFSET pin4
	call	Output
	exit
main ENDP

.DATA
minVals	BYTE	5,2,4,1,3
maxVals	BYTE	9,5,8,4,6

.CODE
; This procedure validates each digit of the PIN.
; Receives:	ESI points to the PIN
; Returns:	EAX = position of invalid digit or 0 if PIN is valid
Validate_PIN PROC USES ecx edi esi
	mov	edi,0			; index of value arrays
	mov	ecx,PIN_LENGTH		; loop counter
TraversePIN:
	mov	al,[esi]			; current digit of PIN
	cmp	al,minVals[edi]	; is al < minVals[edi] ?
	jb	ReturnIndex		; if yes, immediately return
	cmp	al,maxVals[edi]	; is al > maxVals[edi] ?
	jbe	NextDigit			; if no, continue
ReturnIndex:
	mov	eax,edi		; return index of invalid digit
	inc	eax
	jmp	done
NextDigit:
	inc	esi
	inc	edi
	loop	TraversePIN
	mov	eax,0			; all digits are valid
done:
	ret
Validate_PIN ENDP

.DATA
valid	BYTE	"Valid",0
invalid	BYTE	" digit is invalid",0

.CODE
Output PROC USES edx
	call	Validate_PIN
	or	eax,eax			; EAX == 0 ?
	jne	NotValid			; if no, invalid
	mov	edx,OFFSET valid	; "Valid"
	call	WriteString
	jmp	IsValid
NotValid:
		call	WriteDec		; # " digit is invalid"
		mov	edx,OFFSET invalid
		call	WriteString
IsValid:
	call	Crlf
	ret
Output ENDP
END main