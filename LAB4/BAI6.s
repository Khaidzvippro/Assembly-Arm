; DEM SO PHAN TU AM DUONG
	 AREA RESET,DATA,READONLY
		 DCD  0x20001000     
		 DCD  Main  
       ALIGN 
matrix
    DCD 3, -7, 1, -4, 5
    DCD -8, 3, -1, 4, -2
    DCD 9, -6, 2, -3, 0
    DCD -5, 8, -9, 1, -4    
rows 	DCD 4
columns DCD 5
             
     AREA MYCODE,CODE,READONLY
   	   ENTRY
   	   EXPORT Main
count PROC
	CMP R5, R1
	BGE done
	LDR R6, [R0, R4]
	CMP R6, #0
	BGT YIN
	BLT YANG
	B NEXT
YIN
	ADD R2,R2,#1
	B NEXT
YANG
	ADD R3,R3,#1
NEXT
	ADD R4, #4
	ADD R5, #1
	B count
done
	BX LR
	ENDP

Main 
	LDR R1, rows
	LDR R0, columns
	MUL R1, R1, R0 
	LDR R0, =matrix	
	MOV R2, #0 ; so so duong
	MOV R3, #0 ; so so am
	MOV R4, #0 ; congdan
	MOV R5, #0
	BL count
STOP	
    B STOP
	 END 	