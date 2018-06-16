TITLE Converting from Big Endian to Little Endian
; This program copies the value from bigEndian to littleEndian, reversing
; the order of the bytes

INCLUDE Irvine32.inc

.DATA
; The number's 32-bit value is understood to be 12345678 hexadecimal
bigEndian	BYTE	12h,34h,56h,78h

.DATA?
littleEndian	DWORD ?

.DATA
bigEndianMem		BYTE	"The data definition:",0Dh,0Ah,0Dh,0Ah
				BYTE	"	bigEndian BYTE 12h,34h,56h,78h",0Dh,0Ah,0Dh,0Ah
				BYTE	"is stored in memory as follows:",0Dh,0Ah,0
bigEndianDWORD		BYTE	0Dh,0Ah
				BYTE "When represented as a DWORD, this is its value:"
				BYTE 0Dh,0Ah,0
littleEndianMem	BYTE "After reversing the order of the bytes, this is how "
				BYTE "the littleEndian variable is stored in memory:"
				BYTE 0Dh,0Ah,0
littleEndianDWORD	BYTE 0Dh,0Ah
				BYTE "and this is its DWORD representation:",0Dh,0Ah,0

.CODE
main PROC
	call Clrscr
	mov	edx,OFFSET bigEndianMem
	call	Writestring
	mov	esi,OFFSET bigEndian
	mov	ecx,LENGTHOF bigEndian
	mov	ebx,TYPE bigEndian
	call	DumpMem
	mov	edx,OFFSET bigEndianDWORD
	call	Writestring
	mov	esi,OFFSET bigEndian
	mov	ecx,1
	mov	ebx,TYPE DWORD
	call	DumpMem

	mov	al,bigEndian[3]
	mov	ah,bigEndian[2]
	mov	WORD PTR littleEndian,ax
	mov	al,bigEndian[1]
	mov	ah,bigEndian
	mov	WORD PTR littleEndian[2],ax

	call Crlf
	mov	edx,OFFSET littleEndianMem
	call WriteString
	mov	esi,OFFSET littleEndian
	mov	ecx,4
	mov	ebx,TYPE BYTE
	call DumpMem
	mov	edx,OFFSET littleEndianDWORD
	call WriteString
	mov	esi,OFFSET littleEndian
	mov	ecx,LENGTHOF littleEndian
	mov	ebx,TYPE littleEndian
	call DumpMem

	call Crlf

	exit
main ENDP
END main