;tinh x mu n 
AREA RESET, DATA, READONLY
		DCD 0x20000000
		DCD START
X 		DCD 2
	AREA SOURCE, CODE, READONLY
		ENTRY

N EQU 3

START
	MOV R0, #1 
	MOV R1, #1
	LDR R2, X
LOOP
	CMP R1, #N ;lon hon
	BGT STOP
	MUL R0, R0, R2 
	ADD R1, #1
	B LOOP
STOP 
	B STOP
	END