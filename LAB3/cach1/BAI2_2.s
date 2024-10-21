;TINH TONG CAC SO CHAN, LE NHO HON N
	    AREA RESET, DATA, READONLY
    DCD 0x20001000              
    DCD Reset_Handler           

    ALIGN                       
SUM_ODD    DCD 0                
SUM_EVEN   DCD 0                
N          DCD 10           

    AREA MYCODE, CODE, READONLY
    ENTRY
    EXPORT Reset_Handler

SUMF PROC         
    CMP R2, R0                 
    BGT END_OF_FUNC            
    ADD R1, R1, R2              
    ADD R2, R2, #2              
    B SUMF                
END_OF_FUNC
    BX LR                      
ENDP


Reset_Handler 
    LDR R0, N                   
    ; Tinh tong cac so le
    MOV R1, #0                  
    MOV R2, #1                         
    BL SUMF                                        
    LDR R3, =SUM_ODD            
    STR R1, [R3]                

    ; Tinh tong cac so chan
    MOV R1, #0                  
    MOV R2, #2                          
    BL SUMF                                         
    LDR R3, =SUM_EVEN           
    STR R1, [R3]                

STOP    
    B STOP                      
    END
