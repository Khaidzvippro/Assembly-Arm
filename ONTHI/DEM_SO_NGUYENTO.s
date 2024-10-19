; DEM SO NGUYEN TO TREN DUONG CHEO CHINH CUA MA TRAN
	AREA RESET, DATA, READONLY
	DCD  0x20001000     
	DCD  Reset_Handler  

Matrix
	DCB 2, 3, 1, 4
	DCB	5, 3, 4, 6
	DCB	4, 2, 7, 5
	DCB 7, 4, 5, -2
size DCD 4
	AREA MYCODE, CODE, READONLY
   	  ENTRY 
   	  EXPORT Reset_Handler
Reset_Handler
	LDR	R0, =Matrix
	LDR R1, size
	MOV R2, #0		;LUU KET QUA
	; Tinh toan dia chi dau tien
	ADD R3, R1, #1
	MOV R6, #3
Loop
	CMP R1, #0         
    BEQ Stop
	
	LDRB R4, [R0]
	ADD R0, R0, R3 
;kiem tra: neu nho hon 2 thi ko phai, neu = 2 la so nguyen to
	CMP R4, #2 
	BLT NotPrime
	BEQ IsPrime
; kiem tra cac so lon hon 2: neu la so chan thi ko phai, neu la so le thi CHECK	            
	AND R5, R4, #1
	CMP R5, #0
	BEQ NotPrime
;NEU LA SO LE BAT DAU CHECK
	CMP R4, #3
	BEQ IsPrime
CheckPrime
	UDIV R7, R4, R6
	MUL R8, R7, R6
	SUB R8, R4, R8
	CMP R8, #0
	BEQ NotPrime
	
	ADD R6, R6, #2
	CMP R6, R4
	BLT CheckPrime

IsPrime
	ADD R2, R2, #1
	SUB R1, R1, #1 
	B Loop

NotPrime
	SUB R1, R1, #1 
	B Loop    

Stop 
	B Stop

	END
	