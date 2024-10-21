    ;TINH TONG CAC SO NHO HON N DUNG SP
	AREA RESET, DATA, READONLY
    DCD 0x20001000              
    DCD Reset_Handler           
              
SUM       DCD 0                 
N         DCD 5               

    AREA MYCODE, CODE, READONLY
    ENTRY
    EXPORT Reset_Handler

SUMF PROC
    POP     {R0, R1}     
	
LOOP
    ADD     R0, R0, R1           
    SUBS    R1, R1, #1           
    BGT     LOOP                 
    BX      LR                  
	ENDP

Reset_Handler 
    LDR     R1, N                
    MOV     R0, #0               
    PUSH    {R0, R1} 
    BL      SUMF  
    LDR     R3, =SUM           
    STR     R0, [R3]             

STOP    
    B       STOP                 
    END
