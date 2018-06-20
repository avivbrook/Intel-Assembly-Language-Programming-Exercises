TITLE Boolean Calculator
; This program functions as a simple boolean calculator for 32-bit
; integers.
INCLUDE Irvine32.inc

.DATA
CaseTable	BYTE		'1'		; lookup value
		DWORD	AND_op	; address of procedure
EntrySize = ($ - CaseTable)
		BYTE		'2'
		DWORD	OR_op
		BYTE		'3'
		DWORD	NOT_op
		BYTE		'4'
		DWORD	XOR_op
NumberOfEntries = ($ - CaseTable) / EntrySize
prompt	BYTE	"Please make a selection from the following list by pressing the corresponding digit:",0Dh,0Ah
		BYTE	"1. x AND y",0Dh,0Ah
		BYTE	"2. x OR y",0Dh,0Ah
		BYTE	"3. NOT x",0Dh,0Ah
		BYTE	"4. x XOR y",0Dh,0Ah
		BYTE "5. Exit program",0Dh,0Ah,0Dh,0Ah
		BYTE "Your Selection: ",0
msg1		BYTE	"AND_op",0Dh,0Ah,0
msg2		BYTE	"OR_op",0Dh,0Ah,0
msg3		BYTE	"NOT_op",0Dh,0Ah,0
msg4		BYTE	"XOR_op",0Dh,0Ah,0
xPrompt	BYTE	0Dh,0Ah,"Please enter the value of x in hexadecimal: ",0
yPrompt	BYTE	0Dh,0Ah,"Please enter the value of y in hexadecimal: ",0

.DATA?
x		DWORD	?
y		DWORD	?

.CODE
main PROC
	mov	edx,OFFSET prompt		; ask user for input
	call	WriteString
	call	ReadChar				; read character into AL
	mov	ebx,OFFSET CaseTable	; point EBX to the table
	mov	ecx,NumberOfEntries		; loop counter
TraverseCaseTable:
	cmp	al,[ebx]				; match found?
	jne	Continue				; no: continue
	call	NEAR PTR [ebx + 1]		; yes: call the procedure
	call	Crlf
	jmp	done					; exit the search
Continue:
	add	ebx,EntrySize			; point to the next entry
	loop	TraverseCaseTable
done:
	exit
main ENDP

.DATA
andResult	BYTE	" AND ",0
equals	BYTE	" = ",0

.CODE
AND_op PROC
	mov	edx,OFFSET msg1
	call	GetX
	call	GetY
	call	Crlf

	mov	eax,x
	call	WriteHex				; display x
	mov	edx,OFFSET andResult
	call	WriteString			; display " AND "
	mov	eax,y
	call	WriteHex				; display y
	mov	edx,OFFSET equals
	call	WriteString			; display " = "
	mov	eax,x
	and	eax,y
	call	WriteHex				; display result
	call	Crlf
	ret
AND_op ENDP

.DATA
orResult	BYTE	" OR ",0

.CODE
OR_op PROC
	mov	edx,OFFSET msg2
	call	GetX
	call	GetY
	call	Crlf

	mov	eax,x
	call	WriteHex				; display x
	mov	edx,OFFSET orResult
	call	WriteString			; display " OR "
	mov	eax,y
	call	WriteHex				; display y
	mov	edx,OFFSET equals
	call	WriteString			; display " = "
	mov	eax,x
	or	eax,y
	call	WriteHex				; display result
	call	Crlf
	ret
OR_op ENDP

.DATA
notResult	BYTE	"NOT ",0

.CODE
NOT_op PROC
	mov	edx,OFFSET msg3
	call	GetX
	call	Crlf

	mov	edx,OFFSET notResult
	call	WriteString			; display "NOT "
	mov	eax,x
	call	WriteHex				; display x
	mov	edx,OFFSET equals
	call	WriteString			; display " = "
	mov	eax,x
	not	eax
	call	WriteHex				; display result
	call	Crlf
	ret
NOT_op ENDP

.DATA
xorResult	BYTE	" XOR ",0

.CODE
XOR_op PROC
	mov	edx,OFFSET msg4
	call	GetX
	call	GetY
	call	Crlf

	mov	eax,x
	call	WriteHex				; display x
	mov	edx,OFFSET xorResult
	call	WriteString			; display " XOR "
	mov	eax,y
	call	WriteHex				; display y
	mov	edx,OFFSET equals
	call	WriteString			; display " = "
	mov	eax,x
	xor	eax,y
	call	WriteHex				; display result
	call	Crlf
	ret
XOR_op ENDP

GetX PROC
	call	WriteString			; display message
	mov	edx,OFFSET xPrompt
	call	WriteString			; get x
	call	ReadHex
	mov	x,eax
	ret
GetX ENDP

GetY PROC
	mov	edx,OFFSET yPrompt
	call	WriteString			; get y
	call	ReadHex
	mov	y,eax
	ret
GetY ENDP
END main