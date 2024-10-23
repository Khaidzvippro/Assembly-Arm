; TINH TONG CAC SO CHAN, SO LE TRONG MA TRAN
	 AREA RESET,DATA,READONLY
		 DCD  0x20001000     
		 DCD  Main  
       ALIGN 
matrix
    DCD 3, 7, 1, 4, 5
    DCD 8, 3, 1, 4, 2
    DCD 9, 6, 2, 3, 0
    DCD 5, 8, 9, 1, 4    
rows 	DCD 4
columns DCD 5
             
     AREA MYCODE,CODE,READONLY
   	   ENTRY
   	   EXPORT Main
CaculateSums PROC
	CMP R5,R1
	BGE done
	LDR R6, [R0, R4]
	AND R7,R6,#1
	CMP R7, 0
	BEQ TONG_CHAN
	ADD R3,R3,R6
	B NEXT
TONG_CHAN
	ADD R2,R2,R6
	B NEXT
NEXT
	ADD R4,#4
	ADD R5,#1
	B CaculateSums
done
	BX LR
	ENDP
Main 
	LDR R1, rows
	LDR R0, columns
	MUL R1, R1, R0 
	LDR R0, =matrix	
	MOV R2, #0 ; TONG CHAN
	MOV R3, #0 ; TONG LE
	MOV R4, #0 ; congdan
	MOV R5, #0
	BL CaculateSums
STOP	
    B STOP
	 END 	