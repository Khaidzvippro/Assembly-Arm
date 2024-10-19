;DEM PHAN TU CHAN TREN DUONG CHEO PHU
	AREA RESET, DATA, READONLY
	DCD  0x20001000     
	DCD  Reset_Handler  

Matrix
	DCB 2, 3, 1, 4
	DCB	5, 3, 4, 6
	DCB	4, 2, 3, 5
	DCB 7, 4, 5, 6
size DCD 4
	AREA MYCODE, CODE, READONLY
   	  ENTRY 
   	  EXPORT Reset_Handler
Reset_Handler
	LDR	R0, =Matrix
	LDR R1, size
	MOV R2, #0		;LUU KET QUA
	; Tinh toan dia chi dau tien
	SUB R3, R1, #1
	ADD R0, R0, R3
Loop
	CMP R1, #0         
    BEQ Stop
	
	LDRB R4, [R0]
	AND R5, R4, #1
	CMP R5, #0
	BNE NEXT
	ADD R2, R2, #1
	
NEXT	
	SUB R1, R1, #1     
    ADD R0, R0, R3    

    B Loop 
	

Stop 
	B Stop

	END
	