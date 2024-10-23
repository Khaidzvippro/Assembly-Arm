; TINH TONG CAC PHAN TU TRONG MA TRAN
	 AREA RESET,DATA,READONLY
		 DCD  0x20001000     
		 DCD  Main  
       ALIGN 
matrix  DCD 1, -2, 3        
        DCD 4, 5, 6        
rows 	DCD 3
columns DCD 2            
     AREA MYCODE,CODE,READONLY
   	   ENTRY
   	   EXPORT Main
sum PROC
	CMP R3, R1
	BGE done
	LDR R5, [R0, R4]
	ADDS R2, R5
	ADDS R4, #4
	ADDS R3, #1
	B sum
done
	BX LR
	ENDP

Main 
	LDR R1, rows
	LDR R0, columns
	MUL R1, R1, R0 
	LDR R0, =matrix	
	MOV R2, #0 ; tong
	MOV R3, #0 ; index
	MOV R4, #0 ; congdan
	BL sum
STOP	
    B STOP
	 END 	