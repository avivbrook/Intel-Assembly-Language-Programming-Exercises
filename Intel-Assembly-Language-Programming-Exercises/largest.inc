; Include file for the FindLargest Program	(largest.inc)

INCLUDE Irvine32.inc

FindLargest PROTO,
	ptrSDWORDArray:PTR SDWORD,	; points to the array
	arraySize:DWORD				; size of the array

DisplayLargest PROTO,
	ptrPrompt:PTR BYTE,			; prompt string
	result:DWORD				; the largest element in the array