; FindLargest Procedure	(_findlargest.asm)
INCLUDE largest.inc

.CODE
;-----------------------------------------------------
FindLargest PROC,
	ptrSDWORDArray:PTR SDWORD,	; points to the array
	arraySize:DWORD				; size of the array
;
; Finds the largest elements in the array.
; Returns: EAX = the value of the largest array member.
;-----------------------------------------------------
	push	ecx							; preserve all registers (except EAX)
	push	esi

	mov	esi,ptrSDWORDArray				; point to the first element
	mov	eax,[esi]						; set max to first element
	add	esi,TYPE DWORD					; point to 2nd element
	mov	ecx,arraySize					; loop counter
	dec	ecx

ScanArray:
	mov	ebx,DWORD PTR [esi]
	cmp	ebx,eax
	jle	NotGreater
	mov	eax,ebx
NotGreater:
	add	esi,TYPE DWORD
	loop	ScanArray

	pop	esi
	pop	ecx							; return sum in EAX
	ret
FindLargest ENDP
END