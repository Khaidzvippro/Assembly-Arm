; TIM GTLN GTNN TRONG CHUOI
	 AREA RESET,DATA,READONLY
		 DCD  0x20001000     
		 DCD  Main  
       ALIGN 
array  DCD 3,2,1,4,5
length DCD 5
MAX	   DCD 0
MIN	   DCD 0
     AREA MYCODE,CODE,READONLY
   	   ENTRY
   	   EXPORT Main
find_max_min PROC
	LDR R2, [R0], #4
	MOV R3, R2  ;MAX
	MOV R4, R2  ;MIN
	MOV R5, #1  
loop
	CMP R5, R1 
	BEQ done
	LDR R2, [R0], #4 
	CMP R2, R3
	BLE skip_max
	MOV R3, R2
skip_max
    CMP R2, R4           
    BGE skip_min         
    MOV R4, R2           

skip_min
    ADD R5, R5, #1       
    B loop               

done
    BX LR                
	ENDP

Main 
	LDR R0,=array 		
	LDR R1,=length
	LDR R1,[R1]
	BL  find_max_min
	LDR R5, =MAX   
    STR R3, [R5]
    LDR R5, =MIN   
    STR R4, [R5]
   
STOP	
    B STOP
	 END 	