; TINH TONG CAC SO CHIA HET CHO 5
	 AREA RESET,DATA,READONLY
		 DCD  0x20001000     
		 DCD  Main  
       ALIGN 
matrix
    DCD 10, 3, 15, 8, 5
    DCD 20, 7, 25, 4, 2
    DCD 9, 30, 12, 3, 35
    DCD 6, 18, 21, 5, 0  
rows 	DCD 4
columns DCD 5
             
     AREA MYCODE,CODE,READONLY
   	   ENTRY
   	   EXPORT Main
SUM PROC
	CMP R5, R1
	BGE done
	LDR R6, [R0, R4]
	;CHUA XONG
	B NEXT
NEXT
	ADD R4, #4
	ADD R5, #1
	B SUM
done
	BX LR
	ENDP

Main 
	LDR R1, rows
	LDR R0, columns
	MUL R1, R1, R0 
	LDR R0, =matrix	
	MOV R2, #0 ; TONG
	MOV R3, #0 
	MOV R4, #0 
	MOV R5, #0
	BL SUM
STOP	
    B STOP
	 END 	