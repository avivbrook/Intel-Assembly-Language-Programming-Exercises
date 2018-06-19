TITLE Summing Array Elements in a Range
; This program calls the SumArrayElementsInRange procedure twice.
INCLUDE Irvine32.inc

.DATA
myArray	SDWORD	0D1EFB5CBh,3E3000h,40100Ah,19FF84h,19FF94h,246h

.DATA?
j		SDWORD	?
k		SDWORD	?

.CODE
main PROC
	call	Clrscr
	mov	esi,OFFSET myArray		; pointer to the array
	mov	ecx,LENGTHOF myArray	; length of the array

	; First test range: only the first and last elements will be added
	; 0D1EFB5CBh + 246h = 0D1EFB811
	mov	j,0D050F800h
	mov	k,3E8h
	call	SumArrayElementsInRange

	; Second test range: all but the first element will be added
	; 3E3000h + 40100Ah + 19FF84h + 19FF94h + 246h = 0B24168h
	mov	j,246h
	mov	k,40100Ah
	call	SumArrayElementsInRange
	exit
main	ENDP

; This procedure calculates the sum of all array elements falling within
; the range j...k (inclusive).
; Receives:	ESI = pointer to a signed doubleword array
;			ECX = the length of the array
;			j = lowest value, k = highest value
; Returns:	EAX = the sum
SumArrayElementsInRange PROC USES esi ecx ebx
	mov	eax,0				; initialise EAX
TraverseArray:					; loop to traverse array
	mov	ebx,SDWORD PTR [esi]	; EBX = current array element
	cmp	ebx,j				; EBX >= j ?
	jl	OutOfRange			; if not, jump to OutOfRange
	cmp	ebx,k				; EBX <= k ?
	jg	OutOfRange			; if not, jump to OutOfRange
	add	eax,ebx				; if in range, add to EAX
OutOfRange:
	add	esi,TYPE myArray		; next element in array
	loop	TraverseArray
	ret
SumArrayElementsInRange ENDP
END main