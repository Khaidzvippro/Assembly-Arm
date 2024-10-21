;TINH TONG CAC SO CHAN, LE NHO HON N
	AREA RESET, DATA, READONLY
    DCD 0x20001000              
    DCD Reset_Handler           

    ALIGN                       
SUM_ODD    DCD 0                
SUM_EVEN   DCD 0                
N          DCD 5            

    AREA MYCODE, CODE, READONLY
    ENTRY
    EXPORT Reset_Handler

SUMF PROC
    POP {R0, R1, R2}           
LOOP
    CMP R2, R0                 
    BGT END_OF_FUNC            
    ADD R1, R1, R2              
    ADD R2, R2, #2              
    B LOOP                 
END_OF_FUNC
    PUSH {R1}                  
    BX LR                      
ENDP


Reset_Handler 
    LDR R0, N                   
    ; Tinh tong cac so le
    MOV R1, #0                  
    MOV R2, #1                  
    PUSH {R0, R1, R2}           
    BL SUMF                     
    POP {R1}                    
    LDR R3, =SUM_ODD            
    STR R1, [R3]                

    ; Tinh tong cac so chan
    MOV R1, #0                  
    MOV R2, #2                 
    PUSH {R0, R1, R2}           
    BL SUMF                     
    POP {R1}                    
    LDR R3, =SUM_EVEN           
    STR R1, [R3]                

STOP    
    B STOP                      
    END
