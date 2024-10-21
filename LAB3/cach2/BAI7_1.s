    AREA RESET, DATA, READONLY
    DCD 0x20001000    
    DCD Reset_Handler 

    ALIGN
UCLN  DCD 0          
SO1   DCD 7          
SO2   DCD 2          

    AREA MYCODE, CODE, READONLY
    ENTRY
    EXPORT Reset_Handler

; Chuong trinh con tinh UCLN
TIM_UCLN PROC
    POP {R0, R1,R2}         
LOOP
    CMP R0, R1           
    BGT HoanDoi           
TiepTuc
    SUB R1, R1, R0        
    CMP R1, R0           
    BEQ END_PROC          
    B LOOP              

HoanDoi
    MOV R2, R0            
    MOV R0, R1           
    MOV R1, R2            
    B TiepTuc            

END_PROC
    BX LR               
    ENDP

; Chuong trinh chinh
Reset_Handler 
    LDR R0, SO1           
    LDR R1, SO2           
    MOV R2, #0  
    PUSH {R0,R1,R2}
    BL TIM_UCLN           
    LDR R3, =UCLN         
    STR R1, [R2]          

STOP    
    B STOP                

    END
