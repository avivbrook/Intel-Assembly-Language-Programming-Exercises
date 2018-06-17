TITLE Copy a String in Reverse Order
; This program copies a string from source to target, reversing the
; character order in the process.
INCLUDE Irvine32.inc

.DATA
source	BYTE	"This is the source string",0
target	BYTE	SIZEOF source DUP("#")

.CODE
main PROC
	mov	esi,OFFSET source + SIZEOF source - 2
	mov	edi,OFFSET target
	mov	ecx,SIZEOF source - 1
ReverseString:
	mov	al,[esi]
	mov	[edi],al
	inc	edi
	dec	esi
loop ReverseString
	mov	al,0
	mov	[edi],al
	
	call	Clrscr
	mov	edx,OFFSET source
	call	Writestring
	call	Crlf
	mov	edx,OFFSET target
	call	Writestring
	call	Crlf

	exit
main ENDP
END main