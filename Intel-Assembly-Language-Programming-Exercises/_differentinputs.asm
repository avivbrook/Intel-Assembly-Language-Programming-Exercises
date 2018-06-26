; DifferentInputs Procedure	(_differentinputs.asm)
INCLUDE inputs.inc

.CODE
;-----------------------------------------------------
DifferentInputs PROC USES ebx edx,
	input1:DWORD,
	input2:DWORD,
	input3:DWORD
;
; Returns 1 if the values of the three input parameters are all different;
; otherwise returns 0.
; Returns: EAX
;-----------------------------------------------------
	mov	ebx,input1
	mov	edx,input2
	cmp	ebx,edx
	je	Equal
	cmp	ebx,input3
	je	Equal
	cmp	edx,input3
	je	Equal
	mov	eax,1
	jmp	Done
Equal:
	mov	eax,0
Done:
	ret
DifferentInputs ENDP
END