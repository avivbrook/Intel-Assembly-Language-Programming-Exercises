TITLE College Registration
; This program determines whether or not a student is able to register
; for class depending on his grade average and number of desired credits.
INCLUDE Irvine32.inc

TRUE = 1
FALSE = 0

.DATA
promptGradeAverage	BYTE	"Please enter your grade average: ",0
promptCredits		BYTE	"Please enter the number of credits you want: ",0
canRegister		BYTE	"The student can register",0Dh,0Ah,0
cannotRegister		BYTE	"The student cannot register",0Dh,0Ah,0
errorMessage		BYTE	"ERROR: Invalid input.",0Dh,0Ah,0

.DATA?
gradeAverage		WORD	?
credits			WORD	?
validInput		BYTE	?
OkToRegister		BYTE	?

.CODE
main PROC
	mov	edx,OFFSET promptGradeAverage	; prompt the user for gradeAverage
	call	WriteString
	call	ReadDec
	mov	gradeAverage,ax
	mov	edx,OFFSET promptCredits		; prompt the user for credits
	call	WriteString
	call	ReadDec
	mov	credits,ax

	call	CheckRange				; validate input
	mov	al,validInput
	; .IF validInput == FALSE
	cmp	al,FALSE					; is input not valid ?
	jne	C1						; if input is valid, proceed
	mov	eax,red + (black * 16)		; print error message in red
	call	SetTextColor
	mov	edx,OFFSET errorMessage		; if not, print error message
	call	WriteString
	mov	eax,lightGray + (black * 16)	; reset color
	call	SetTextColor
	jmp	done
	; .ENDIF
C1:								; input is valid
	call	OkToRegisterOrNot
	mov	al,OkToRegister
	;.IF OkToRegister == TRUE
	cmp	al,TRUE					; OkToRegister?
	jne	cannot
	mov	edx,OFFSET canRegister
	;.ELSE
	jmp	can
cannot:
		mov	edx,OFFSET cannotRegister
	;.ENDIF
can:
	call	WriteString
done:
	exit
main ENDP

; This procedure uses two criteria to determine whether or not a student
; can register: The first is the person's grade average, based on a 0 to
; 400 scale, where 400 is the highest possible grade. The second is the
; number of credits the person wants to take.
; Receives: gradeAverage (0 - 400), credits (1 - 30)
; Returns: OkToRegister
OkToRegisterOrNot PROC USES eax ebx
	mov	OkToRegister,FALSE	; default: not ok to register
	mov	ax,gradeAverage
	mov	bx,credits
	; .IF gradeAverage > 350
	cmp	ax,350			; is gradeAverage > 350 ?
	jbe	C1				; if not, jump to ElseIf1
	mov	OkToRegister,TRUE	; if yes, OkToRegister = TRUE
	; .ELSEIF (gradeAverage > 250) && (credits <= 16)
	jmp	done				; if not, OkToRegister remains FALSE
C1:
	cmp	ax,250			; is gradeAverage > 250 ?
	jbe	C2				; if not, jump to ElseIf2
	cmp	bx,16			; is credits <= 16 ?
	ja	C2				; if not, jump to ElseIf2
	mov	OkToRegister,TRUE	; if yes, OkToRegister = TRUE
	; .ELSEIF (credits <= 12)
	jmp	done				; if not, OkToRegister remains FALSE
C2:
	cmp	bx,12			; is credits <= 12
	ja	done				; if not, OkToRegister remains FALSE
	mov	OkToRegister,TRUE	;if yes, OkToRegister = TRUE
	; .ENDIF
done:
	ret
OkToRegisterOrNot ENDP

; This procedure determines if determines if the grade average and credits
; values are within the valid range. gradeAverage must be between 0 and
; 400, credits must be between 1 and 30.
; Receives: gradeAverage, credits
; Returns: validInput
CheckRange PROC
	mov	validInput,FALSE	; default: input is invalid
	mov	ax,gradeAverage
	mov	bx,credits
	; .IF (gradeAverage >= 0 && gradeAverage <= 400) &&
	; (credits >= 1 && credits <= 30)
	cmp	ax,0				; is gradeAverage >= 0 ?
	jb	done				; if not, input invalid
	cmp	ax,400			; is gradeAverage <= 400 ?
	ja	done				; if not, input invalid
	cmp	bx,1				; is credits >= 1 ?
	jb	done				; if not, input invalid
	cmp	bx,30			; is credits <= 30 ?
	ja	done				; if not, input invalid
	mov	validInput,TRUE	; if all conditions are true, input is valid
	; .ENDIF
done:
	ret
CheckRange ENDP
END main