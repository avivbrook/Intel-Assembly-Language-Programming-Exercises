TITLE Prime Numbers
; This program generates all prime numbers between 2 and 1000, using the
; Sieve of Eratosthenes method and displays them.
INCLUDE Irvine32.inc

TRUE = 1
FALSE = 0
n = 1000
sqrt_n = 31

.DATA?
A	BYTE	n DUP(?)

.CODE
main PROC
	mov	edi,OFFSET A + 2	; initial index = 2
	mov	ecx,n - 2
	mov	eax,1
	rep	stosb
	mov	WORD PTR [A],FALSE	; set 0 & 1 to FALSE
	mov	esi,1			; initial value = 2, inc at start of loop
OuterLoop:
	inc	esi				; next value
	cmp	esi,sqrt_n		; ESI > sqrt_n ?
	ja	Display			; yes: done, display values
	cmp	A[esi],TRUE		; A[ESI] == true ?
	jne	OuterLoop			; no: continue loop
	mov	edi,esi
	imul	edi,edi			; InnerLoop initial val = ESI^2
InnerLoop:
	cmp	edi,n			; EDI > n ?
	jae	OuterLoop			; yes: continue outer loop
	mov	A[edi],FALSE		; no: value is not prime
	add	edi,esi			; EDI = ESI^2 + ESI, ESI^2 + 2 * ESI ...
	jmp	InnerLoop
Display:
	mov	esi,1			; initial value = 2, inc at start of loop
DisplayPrimeNumbers:
	inc	esi
	cmp	esi,n				; ESI >= n ?
	jae	Done					; yes: done
	cmp	BYTE PTR A[esi],TRUE	; A[ESI] == TRUE ?
	jne	DisplayPrimeNumbers		; no: value is not prime, continue loop
	mov	eax,esi				; yes: value is prime, display it
	call	WriteDec
	call	Crlf
	jmp	DisplayPrimeNumbers
Done:
	exit
main ENDP
END main