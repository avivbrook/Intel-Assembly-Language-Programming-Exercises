TITLE Finding Multiples of K
; This program finds all multiples of K that are less than N.
INCLUDE Irvine32.inc

N = 50

.DATA
bArray	BYTE		N DUP(0)
partOne	BYTE		"All multiples of ",0
partTwo	BYTE		" that are less than ",0

.DATA?
K		DWORD	?

.CODE
main PROC
	call	Clrscr
	mov	K,2
	mov	edx,OFFSET partOne
	call	WriteString
	mov	eax,K
	call	WriteDec
	mov	edx,OFFSET partTwo
	call	WriteString
	mov	eax,N
	call	WriteDec
	call	Crlf
	call	FindMultiplesOfK
	call	Crlf

	mov	K,3
	mov	edx,OFFSET partOne
	call	WriteString
	mov	eax,K
	call	WriteDec
	mov	edx,OFFSET partTwo
	call	WriteString
	mov	eax,N
	call	WriteDec
	call	Crlf
	call	FindMultiplesOfK
	call	Crlf
	exit
main ENDP

; In a byte array of size N, this procedure finds all multiples of K that
; are less than N.
; Receives:	bArray =	uninitialised byte array, N = array size,
;			K =		number whose multiples are searched for
; Returns:	bArray =	corresponding array elements of multiples are
;					marked
FindMultiplesOfK PROC USES ebx ecx edx esi
	mov	esi,OFFSET bArray
	mov	ecx,N
	mov	edx,1
	mov	ebx,K
TraverseValues:
	cmp	ebx,edx
	jne	NotMultiple
	mov	BYTE PTR [esi],1
	add	ebx,K
	mov	eax,edx
	call	WriteDec
	call	Crlf
NotMultiple:
	inc	edx
	add	esi,TYPE bArray
loop TraverseValues
	ret
FindMultiplesOfK ENDP
END main