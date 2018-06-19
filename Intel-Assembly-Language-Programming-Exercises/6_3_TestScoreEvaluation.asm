TITLE Test Score Evaluation
; This program generates 10 random scores between 50 and 100 inclusive and
; passes each of them to the CalcGrade procedure which returns the
; corresponding letter grade for each score.
INCLUDE Irvine32.inc

.DATA
tableHeader	BYTE	"Score	Letter",0Dh,0Ah,0

.CODE
main PROC
	mov	edx,OFFSET tableHeader
	call	WriteString	; print table header
	call	Randomize		; initialise the starting seed value
	mov	ecx,10		; generate 10 grades
GenerateGrades:
	mov	eax,51		; produce a random integer (0 -> 50)
	call	RandomRange
	add	eax,50		; (0 -> 50) + 50 = (50 -> 100)
	call	WriteDec		; print score to console window
	push	eax
	mov	al,9			; ASCII code for tab
	call	WriteChar		; print a tab
	pop	eax
	call	CalcGrade		; get letter grade
	call	WriteChar		; print the letter grade
	call	Crlf
	loop	GenerateGrades
	call	Crlf
	exit
main ENDP

; This program receives a score and returns the corresponding letter grade
; for that value.
; Receives: EAX = an integer value (0 - 100)
; Returns: AL = a single capital letter
CalcGrade PROC
	cmp	eax,90	; is score >= 90
	jae	GradeA	; if yes, grade = A
	cmp	eax,80	; is score >= 80
	jae	GradeB	; if yes, grade = B
	cmp	eax,70	; is score >= 70
	jae	GradeC	; if yes, grade = C
	cmp	eax,60	; is score >= 60
	jae	GradeD	; if yes, grade = D
	jmp	GradeF	; if score < 60, grade = F
GradeA:
	mov	al,'A'
	jmp	done
GradeB:
	mov	al,'B'
	jmp	done
GradeC:
	mov	al,'C'
	jmp	done
GradeD:
	mov	al,'D'
	jmp	done
GradeF:
	mov	al,'F'
done:
	ret
CalcGrade ENDP
END main