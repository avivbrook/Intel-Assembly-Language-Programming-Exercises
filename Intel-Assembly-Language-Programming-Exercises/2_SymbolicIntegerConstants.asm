TITLE Symbolic Integer Constants
; This program defines symbolic constants for all seven days of the week
; and creates an array variable that uses the symbols as initialisers.

INCLUDE Irvine32.inc

SUN	EQU	<"Sunday",0>
MON	EQU	<"Monday",0>
TUE	EQU	<"Tuesday",0>
WED	EQU	<"Wednesday",0>
THU	EQU	<"Thursday",0>
FRI	EQU	<"Friday",0>
SAT	EQU	<"Saturday",0>
NUMBER_OF_DAYS = 7

.DATA
weekdays	BYTE	SUN,MON,TUE,WED,THU,FRI,SAT

.CODE
main PROC
	call Clrscr
	mov	edi,OFFSET weekdays
	mov	ecx,NUMBER_OF_DAYS

PrintDay:
	mov	edx,edi
	call Writestring
	call Crlf
FindNextNumber:
	inc	edi
	cmp	BYTE PTR [edi],0
	jnz	FindNextNumber
	inc	edi
loop PrintDay

	exit
main ENDP
END main