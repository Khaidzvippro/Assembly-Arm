	AREA RESET, DATA, READONLY
	DCD 0x20000000
	DCD Main
col1 DCB 3
row1 DCB 3
col2 DCB 3
row2 DCB 3
m1 
  DCB 1,2,3
  DCB 1,2,3
  DCB 1,2,3
m2 
  DCB 3,2,1
  DCB 3,2,1
  DCB 3,2,1
	AREA MYDATA, DATA, READWRITE
m3 DCB 0, 0, 0, 0, 0, 0, 0, 0 ,0 

	AREA MYCODE, CODE, READONLY
	ENTRY
Main
	LDRB R0, col1
	LDRB R1, col2

	CMP R0, R1
	BNE Stop

	LDRB R2, row1
	LDRB R3, row2
	BNE Stop

	MUL R0, R0, R2 ; length
    LDR R1, =m1
    LDR R2, =m2
	LDR R3, =m3
Loop
	LDRB R4, [R1], #1
	LDRB R5, [R2], #1
	SUBS  R6, R4, R5
	STRB R6, [R3], #1
	SUBS R0, R0, #1
	BNE  Loop

Stop B Stop
