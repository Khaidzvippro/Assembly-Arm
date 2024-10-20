;TIM MIN, MAX VA DEM SO PHAN TU LON HON TRUNG BINH CONG
	AREA RESET , DATA ,READONLY
		DCD 0x20000000 
		DCD Start 
	ALIGN 
chuoi DCD 1,2,3,4,5
length DCD 5

	AREA KQ, DATA ,READWRITE

	AREA mycode, CODE ,READONLY
	ENTRY
Start
	MOV R0, #0		
	LDR R1, =chuoi		
	LDR R2, length 		
	LDR R3, [R1]	;MIN
	LDR R4, [R1]	;MAX	
	MOV R5, R3			
	MOV R6, #1		
	MOV R7, #4		
	BL Loop
	SDIV R9, R5, R2		
	BL demLonHon_TBC		
	B Stop

Loop	PROC
	CMP R6, R2		
	BEQ return		
	LDR R8, [R1, R7]	
	ADD R5, R8		
	CMP R3, R8		
	BLT checkMax		
	MOV R3, R8		
	B tiepTuc	

checkMax
	CMP R4, R8		
	BGT tiepTuc		
	MOV R4, R8		
tiepTuc
	ADD R6, #1		
	ADD R7, #4		
	B Loop
return 
	BX LR
	ENDP

demLonHon_TBC PROC
	MOV R6, #0		
	MOV R7, #0		
Loop_TBC
	CMP R6, R2		
	BEQ return
	LDR R8, [R1, R7]
	CMP R8, R9		
	BLE tiepTuc_TBC		
	ADD R0, #1		
tiepTuc_TBC
	ADD R6, #1
	ADD R7, #4
	B Loop_TBC

Stop
	B Stop
	END