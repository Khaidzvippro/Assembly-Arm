;Tong cac so <= n chia het cho 5
	AREA RESET, DATA, READONLY
		DCD 0x20000000
		DCD Start
	
	AREA MAINSOURCE, CODE, READONLY
		ENTRY
		
N EQU 18
	
Start
	MOV R1, #0
	MOV R2, #5

Loop
	CMP R2, N
	BGT Stop
	ADD R1, R2
	ADD R2, #5
	B Loop

Stop 
	B Stop
	END
	