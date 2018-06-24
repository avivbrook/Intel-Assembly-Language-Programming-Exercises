TITLE Parity Checking	(ParityChecking.asm)

; This program calculates the parity (even or odd) of the bytes in an
; array.

INCLUDE Irvine32.inc

True = 1
False = 0

.DATA
array1	BYTE	1,2,3,4,1,20,35,-12,66,4,6
array2	BYTE	4,2,6,8,10,12,14,16,22,56,44

.CODE
main PROC
	mov	ebx,OFFSET array2	; point to the array
	mov	ecx,SIZEOF array2	; loop counter
	call	CheckParity
	call	WriteInt
	exit
main ENDP

;-----------------------------------------------
CheckParity PROC USES ebx ecx
;
; Determines if there is an even or odd number of bits in the entire array.
; Receives: EBX points to the array, ECX = length of the array
; Returns: EAX = True if the parity is even, False if the parity is odd
;-----------------------------------------------------
	movzx	eax,BYTE PTR [ebx]	; EAX = value of first byte
	cmp		ecx,1			; arraySize <= 1 ?
	jle		DoneTraversing		; yes: jump straight to calculation
	dec		ecx				; loop for SIZEOF array - 1
TraverseArray:
	inc		ebx				; point to next byte
	xor		al,BYTE PTR [ebx]	; xor the current value with next byte
	loop		TraverseArray
DoneTraversing:
	jnp		OddParity
	mov		eax,True
	jmp		next
OddParity:
		mov	eax,False
next:
	ret
CheckParity ENDP
END main