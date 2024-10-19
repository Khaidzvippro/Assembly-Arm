; TICH CHINH HOP CHAP K CUA N THEO GIAI THUA
	AREA RESET, DATA, READONLY
	DCD 0x20001000
	DCD Main
N	DCD 5 
K	DCD 3
	AREA MYCODE, CODE, READONLY
	ENTRY
Main
	LDR R0, N
	LDR R1, K
	MOV R2, #1 ;Numerator
	MOV R3, #1 ;Denominator
Init
	CMP R0, R1
	BEQ CalNumerator
	SUB R1, R0, R1
CalDenominator
	MUL  R3, R3, R1
	SUBS R1, R1, #1
	BNE  CalDenominator
CalNumerator
	MUL  R2, R2, R0
	SUBS R0, R0, #1
	BNE  CalNumerator	
	
Calculate
	UDIV R4, R2, R3
	
	SWI &11
	
	END