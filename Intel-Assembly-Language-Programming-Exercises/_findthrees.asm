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
	.IF eax == 3
		inc	counter
	.ELSE
		mov	counter,0
	.ENDIF
	.IF counter == 3
		mov	eax,1
		jmp	done
	.ENDIF
	add	esi,TYPE DWORD
	loop	TraverseArray
	mov	eax,0
done:
	ret
FindThrees ENDP
END