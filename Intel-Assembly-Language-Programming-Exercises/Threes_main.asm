; FindThrees Program	(Threes_main.asm)

;
INCLUDE threes.inc

.DATA
array1	DWORD	1,2,4,5,6,3,3,4,7,8,9,3,3,3,5,6
array2	DWORD	3,3,2,5,6,3,3,7,7,8,3,3,9,0,0,3
array3	DWORD	1,2,3,3,4,4,4,5,5,6,6,5,5,6,5,3,3,3

.CODE
main PROC
	INVOKE FindThrees, ADDR array1, LENGTHOF array1
	call	DumpRegs
	INVOKE FindThrees, ADDR array2, LENGTHOF array2
	call	DumpRegs
	INVOKE FindThrees, ADDR array3, LENGTHOF array3
	call	DumpRegs
	exit
main ENDP
END main