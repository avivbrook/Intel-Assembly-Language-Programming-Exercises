TITLE Filling an Array
; This program fills an array of doublewords with N random integers in the
; range j...k inclusive.
INCLUDE Irvine32.inc

N = 7

.DATA
promptj	BYTE		"Lowest value in range: ",0
promptk	BYTE		"Highest value in range: ",0

.DATA?
dArray	DWORD	N DUP(?)
j		DWORD	?
k		DWORD	?

.CODE
main PROC
	call	Clrscr
	call	GetInput
	call	FillArray
	mov	esi,OFFSET dArray
	mov	ecx,N
	mov	ebx,TYPE dArray
	call	DumpMem
	call	Crlf
	call	GetInput
	call	FillArray
	mov	esi,OFFSET dArray
	mov	ecx,N
	mov	ebx,TYPE dArray
	call	DumpMem
	call	Crlf
	exit
main ENDP

; Returns:	j = low range, k = high range
GetInput PROC USES edx eax
	mov	edx,OFFSET promptj
	call	WriteString
	call	ReadInt
	mov	j,eax
	mov	edx,OFFSET promptk
	call	WriteString
	call	ReadInt
	mov	k,eax
	ret
GetInput ENDP

; Receives:	ESI = pointer to array, N, j, k
; Returns:	dArray = filled array
FillArray PROC USES esi ecx eax ebx
	mov	esi,OFFSET dArray
	mov	ecx,N
TraverseArray:
	mov	eax,k
	mov	ebx,j
	sub	eax,ebx
	add	eax,1
	call	RandomRange
	add	eax,j
	mov	[esi],eax
	add	esi,TYPE dArray
loop TraverseArray
	ret
FillArray ENDP
END main