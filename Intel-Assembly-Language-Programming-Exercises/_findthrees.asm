; FindThrees Procedure	(_findthrees.asm)
INCLUDE threes.inc

.CODE
;-----------------------------------------------------
FindThrees PROC,
	arrayPtr:PTR DWORD,
	arraySize:DWORD
	LOCAL counter:DWORD
;
; Returns 1 if an array has three consecutive values of 3 somewhere in the
; array. Otherwise, return 0.
; Returns: EAX = result.
	mov	esi,arrayPtr
	mov	ecx,arraySize
	mov	counter,0
TraverseArray:
	mov	eax,[esi]
	cmp	eax,3
	jne	Not3
	inc	counter
	jmp	Is3
Not3:
	mov	counter,0
Is3:
	cmp	counter,3
	jne	Increment
	mov	eax,1
	jmp	done
Increment:
	add	esi,TYPE DWORD
	loop	TraverseArray
	mov	eax,0
done:
	ret
FindThrees ENDP
END