; CHUONG TRINH SO SANH 2 XAU THEO DO DAI
    AREA RESET, DATA, READONLY
    DCD 0x20001000
    DCD Main
    
    AREA Program, CODE, READONLY 
    ENTRY 

Main 
    LDR R0, =Data1        
    LDR R1, =Data2        
    LDR R2, =Match       

    LDR R3, [R0], #4      
    LDR R4, [R1], #4      
    CMP R3, R4            
    BNE Done              

    CMP R3, #0            
    BEQ Same              

Loop 
    LDRB R5, [R0], #1     
    LDRB R6, [R1], #1     
    CMP R5, R6            
    BNE Done              

    SUBS R3, R3, #1       
    BEQ Same              

    B Loop               

Same 
    MOV R2, #0            
Done 
    LDR R7, =Match        
    STR R2, [R7]          
    SWI &11               

    AREA Data1, DATA, READONLY
Data1 
    DCD 3                  
    DCB "CAT"              

    AREA Data2, DATA, READONLY
Data2 
    DCD 3                  
    DCB "CAT"              

    AREA Result, DATA 
Match 
    DCD &ff                

    END
