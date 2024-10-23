; TIM MAX MIN TREN DUONG CHEO CHINH DUONG CHEO PHU
	 AREA RESET,DATA,READONLY
		 DCD  0x20001000     
		 DCD  Main  
       ALIGN 
matrix
    DCD 3, -7, 1, -4
    DCD -8, 3, -1, 4
    DCD 9, -6, 2, -3
    DCD -5, 8, -9, 1   
size 	DCD 4
             
     AREA MYCODE,CODE,READONLY
   	   ENTRY
   	   EXPORT Main
find_max_min PROC
	
Main 
    LDR R0, =matrix  
    LDR R1, size
	LDR R2, [R0]
	LDR 
	BL count
STOP	
    B STOP
	 END 	