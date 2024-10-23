; TINH TONG CAC PHAN TU TRONG CHUOI
	 AREA RESET,DATA,READONLY
		 DCD  0x20001000     
		 DCD  Main  
       ALIGN 
array  DCD 3,2,1,4,5
length DCD 5
sum_arr DCD 0
max_arr DCD
min_arr	DCD 0
SVG_arr DCD 0
matrix
    DCD 3, -7, 1, -4, 5
    DCD -8, 3, -1, 4, -2
    DCD 9, -6, 2, -3, 0
    DCD -5, 8, -9, 1, -4   
    DCD -5, 7, -2, 1, 4 
size DCD 5
     AREA MYCODE,CODE,READONLY
   	   ENTRY
   	   EXPORT Main
sum_array PROC
	LDR R4,[R0],#4
	ADD R2, R4
	ADD R3,#1
	CMP R3,R1
	BLT sum_array
	BX LR
	ENDP

Main 
	LDR R0,=array 		
	LDR R1,=length
	LDR R1,[R1]
	MOV R2,#0
	MOV R3,#0
	BL  sum_array
	LDR R4,=tong	
	STR R2, [R4]	
   
STOP	
    B STOP
	 END 	