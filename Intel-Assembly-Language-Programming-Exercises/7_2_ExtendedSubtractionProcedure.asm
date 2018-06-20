TITLE Extended Subtraction Procedure
; This program passes several pairs of integers, each at least 10 bytes
; long to the Extended_Sub procedure which then subtract them.
INCLUDE Irvine32.inc

.DATA
pair1op1	BYTE	34h,12h,98h,74h,06h,0A4h,0B2h,0A2h,56h,78h
pair1op2	BYTE	02h,45h,23h,00h,00h,87h,10h,80h,13h,24h
pair2op1	BYTE	5Bh,0FCh,6Ah,22h,00h,20h,70h,00h,00h,40h
pair2op2	BYTE	10h,0Ah,00h,40h,10h,0Ah,00h,40h,10h,0Ah
result	BYTE	11 DUP(0)

.CODE
main PROC
	mov	esi,OFFSET pair1op1		; first operand
	mov	edi,OFFSET pair1op2		; second operand
	mov	ebx,OFFSET result		; result operand
	mov	ecx,LENGTHOF pair1op1	; number of bytes
	call	Extended_Sub
	mov	esi,OFFSET result		; display the result
	mov	ecx,LENGTHOF result
	call	Display_Result
	call	Crlf
	mov	esi,OFFSET pair2op1		; first operand
	mov	edi,OFFSET pair2op2		; second operand
	mov	ebx,OFFSET result		; result operand
	mov	ecx,LENGTHOF pair2op1	; number of bytes
	call	Extended_Sub
	mov	esi,OFFSET result		; display the result
	mov	ecx,LENGTHOF result
	call	Display_Result
	call	Crlf
	exit
main ENDP

; This procedure subtracts two extended integers stored as arrays of bytes.
; Receives:	ESI and EDI point to the two integers,
;			EBX points to a variable that will hold the result,
;			ECX indicates the number of bytes to be subtracted
Extended_Sub PROC
	pushad
	clc		; clear the Carry flag
SubtractEachByte:
	mov	al,[esi]			; get the first integer
	sbb	al,[edi]			; subtract the second integer
	pushfd				; save the Carry flag
	mov	[ebx],al			; store partial result
	inc	esi				; increment pointers
	inc	edi
	inc	ebx
	popfd				; restore the Carry flag
	loop	SubtractEachByte
	mov	BYTE PTR [ebx],0	; clear high byte of result
	sbb	BYTE PTR [ebx],0	; subtract any leftover carry
	popad
	ret
Extended_Sub ENDP

; This procedure displays the result in its proper order, starting with
; the high-order byte, and working its way down to the low-order byte.
; Receives:	ESI points to a variable that contains the result,
;l			ECX indicates the number of bytes in the result
Display_Result PROC
	pushad
	add	esi,ecx			; point to the last array element
	sub	esi,TYPE BYTE
	mov	ebx,TYPE BYTE
DisplayEachByte:
	mov	al,[esi]			; get an array byte
	call	WriteHexB			; display it
	sub	esi,TYPE BYTE		; point to the previous byte
	loop	DisplayEachByte
	popad
	ret
Display_Result ENDP
END main