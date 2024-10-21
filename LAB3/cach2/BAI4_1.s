;TONG CAC SO NHO HON N VA CHIA HET CHO 5
	AREA RESET, DATA, READONLY
    DCD 0x20001000   
    DCD Reset_Handler 

    ALIGN
SUM DCD 0    
N   DCD 7    

    AREA MYCODE, CODE, READONLY
    ENTRY
    EXPORT Reset_Handler


SUMF PROC
    POP {R0, R1, R2}  ; R0 = N, R1 = tong, R2 = gia tri bat dau

LOOP
    ADD R1, R1, R2    
    ADD R2, R2, #5    
    CMP R2, R0      
    BLE LOOP        
    BX LR       
    ENDP

Reset_Handler 
    LDR R0, N          
    MOV R1, #0         
    MOV R2, #0       
    PUSH {R0, R1, R2}  
    BL SUMF            
    LDR R3, =SUM     
    STR R1, [R3]       

STOP    
    B STOP           

    END
