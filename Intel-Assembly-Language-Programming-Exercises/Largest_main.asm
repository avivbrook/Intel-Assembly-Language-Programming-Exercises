; FindLargest Program	(Largest_main.asm)

; This program inputs three different arrays of different lengths to the
; FindLargest Procedure which then finds the largest value in each array.
INCLUDE largest.inc

.DATA
array1	SDWORD	0,0,0,0,1,20,35,-12,66,4,0
array2	SDWORD	1,0,0,0
array3	SDWORD	0,0,0,0
text		BYTE		"The largest value in the array is: ",0

.DATA?
largest	SDWORD	?

.CODE
main PROC
	call	Clrscr

	INVOKE	FindLargest,
			ADDR array1,
			LENGTHOF array1
	mov		largest,eax		; save the value
	INVOKE	DisplayLargest,
			ADDR text,
			largest
	call		Crlf
	INVOKE	FindLargest,
			ADDR array2,
			LENGTHOF array2
	mov		largest,eax		; save the value
	INVOKE	DisplayLargest,
			ADDR text,
			largest
	call		Crlf
	INVOKE	FindLargest,
			ADDR array3,
			LENGTHOF array3
	mov		largest,eax		; save the value
	INVOKE	DisplayLargest,
			ADDR text,
			largest
	call		Crlf
	exit
main ENDP
END main