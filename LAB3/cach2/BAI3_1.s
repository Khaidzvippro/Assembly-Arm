; TINH GIAI THUA
	AREA RESET, DATA, READONLY
    DCD 0x20001000    
    DCD Reset_Handler 

    ALIGN
FAC DCD 0    
N   DCD 5    

    AREA MYCODE, CODE, READONLY
    ENTRY
    EXPORT Reset_Handler

FACTORIAL PROC
    POP {R0, R1}     

LOOP    
    MUL R1, R0, R1   
    SUBS R0, R0, #1  
    BGT LOOP         
    BX LR        
    ENDP

Reset_Handler 
    LDR R0, N         
    MOV R1, #1       
    PUSH {R0, R1}     
    BL FACTORIAL      
    LDR R2, =FAC      
    STR R1, [R2]      
STOP    
    B STOP            

    END
