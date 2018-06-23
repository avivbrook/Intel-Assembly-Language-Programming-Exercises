; DisplayLargest Procedure	(_display.asm)
INCLUDE largest.inc

.CODE
;-----------------------------------------------------
DisplayLargest PROC,
	ptrPrompt:PTR BYTE,			; prompt string
	result:DWORD				; the largest element in the array
;
; Displays the result on the console.
; Returns: nothing.
;-----------------------------------------------------
	push	eax
	push	edx

	mov	edx,ptrPrompt			; pointer to prompt
	call	WriteString
	mov	eax,result
	call	WriteInt				; display EAX
	call	Crlf

	pop	edx
	pop	eax
	ret
DisplayLargest ENDP
END