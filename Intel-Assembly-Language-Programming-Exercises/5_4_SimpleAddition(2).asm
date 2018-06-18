TITLE Simple Addition (2)
; This program does the same thing as Simple Addition (1) but repeats it
; three times with a loop
INCLUDE Irvine32.inc

.DATA
prompt1	BYTE		"Enter the first integer: ",0
prompt2	BYTE		"Enter the second integer: ",0
result	BYTE		"The sum of the two integers is: ",0

.DATA?
integer1	DWORD	?
integer2	DWORD	?
sum		DWORD	?

.CODE
main PROC
	mov	ecx,3
RunProgram:
	call	GetInput
	mov	eax,integer1
	add	eax,integer2
	mov	sum,eax
	mov	dh,15
	mov	dl,36
	call	Gotoxy
	mov	edx,OFFSET result
	call	Writestring
	mov	eax,sum
	call	Writeint
	call	Crlf
	mov	dh,17
	mov	dl,40
	call	Gotoxy
	cmp	ecx,1
	je next
	call WaitMsg
loop RunProgram
next:
	exit
main ENDP

GetInput PROC
	call	Clrscr
	mov	dh,12
	mov	dl,40
	call	Gotoxy
	mov	edx,OFFSET prompt1
	call	Writestring
	call	Readint
	mov	integer1,eax
	mov	dh,13
	mov	dl,40
	call	Gotoxy
	mov	edx,OFFSET prompt2
	call	WriteString
	call	Readint
	mov	integer2,eax
	ret
GetInput ENDP
END main