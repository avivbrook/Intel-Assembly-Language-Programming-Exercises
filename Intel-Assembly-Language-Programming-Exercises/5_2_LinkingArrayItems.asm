TITLE Linking Array Items
; Given the starting index in a list, an array of characters, and an array
; of link index, this program traverses the links and locates the
; characters in their correct sequence. Each character the program
; locates is then copied to a new array.
INCLUDE Irvine32.inc

.DATA
start		DWORD	1
chars		BYTE		'H','A','C','E','B','D','F','G'
links		DWORD	0,4,5,6,2,3,7,0
linksType		BYTE		TYPE links

.DATA?
outputArray	BYTE		LENGTHOF chars DUP(?)

.CODE
main	PROC
	mov	ecx,LENGTHOF outputArray
	mov	edi,OFFSET outputArray
TraverseLinks:
	mov	esi,OFFSET chars
	add	esi,start
	mov	al,[esi]
	mov	[edi],al

	mov	edx,OFFSET links
	mov	eax,start
	mul	linksType
	mov	start,eax
	add	edx,start
	mov	eax,[edx]
	mov	start,eax
	inc	edi
loop TraverseLinks

	exit
main	ENDP
END main