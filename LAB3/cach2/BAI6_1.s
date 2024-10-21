; TINH TONG 1 + X^2 +....+ X^N
	AREA RESET, DATA, READONLY
    DCD 0x20001000    
    DCD Reset_Handler

    ALIGN
FX  DCD 0    
N   DCD 7    
X   DCD 2 

    AREA MYCODE, CODE, READONLY
    ENTRY
    EXPORT Reset_Handler
BIEUTHUC PROC
    POP {R0, R1, R2, R3}  ; R0 = N, R1 = X, R2 = ket qua (1), R3 = tong (1)
LOOP
    MUL R2, R2, R1        
    ADD R3, R3, R2       
    SUBS R0, R0, #1       
    BGT LOOP             

    ; truong hop N < 1
    LDR R0, N
    CMP R0, #1
    BLT END_PROC
    SUBS R3, R3, R1     
END_PROC
    BX LR               
    ENDP

Reset_Handler 
    LDR R0, N             
    LDR R1, X             
    MOV R2, #1           
    MOV R3, #1            
    PUSH {R0, R1, R2, R3}  
    BL BIEUTHUC          
    LDR R4, =FX           
    STR R3, [R4]          

STOP    
    B STOP                

    END
