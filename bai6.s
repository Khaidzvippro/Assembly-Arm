;tinh tong 1 + x^2 + x^3+....
	AREA RESET, DATA, READONLY
		DCD 0x20000000
		DCD Start
	AREA MAINSOURCE, CODE, READONLY
		ENTRY

N EQU 3
X EQU 4

Start
	MOV R4, #1 
	MOV R3, #X 
	MOV R0, #X
	MOV R1, #1 
Loop 
	CMP R1, #N
	BEQ Stop
	MUL R0, R3
	ADD R4, R0
	ADD R1, #1
	B Loop
Stop 
	B Stop
	END
	
	