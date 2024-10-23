; TIM UCLN CUA 2 SO
	 AREA RESET,DATA,READONLY
		 DCD  0x20001000     
		 DCD  Main  
       ALIGN 
SO1  DCD 21
SO2  DCD 5
UCLN DCD 0 ;( gia su so1 >= so2 >=0)
     AREA MYCODE,CODE,READONLY
   	   ENTRY
   	   EXPORT Main
TIM_UCLN PROC
	CMP R1,#0
	BEQ done
	MOV R2,R1
	MOV R3,R0
	MOD R1,R3,R2
	MOV R0,R2
	B TIM_UCLN
done 
	BX LR
	ENDP

Main 
	 LDR R0,SO1 		
	 LDR R1,SO2
	 MOV R2,#0
	 MOV R3,#0
	 BL  TIM_UCLN
	 LDR R4,=UCLN	
	 STR R0, [R4]	
   
STOP	
         B STOP
	 END 	