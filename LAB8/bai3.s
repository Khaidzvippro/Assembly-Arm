; MA HOA HOAN VI TOAN CUC   
   AREA RESET, DATA, READONLY
        DCD 0x20001000
        DCD Reset_Handler
    ALIGN
XauRo   DCB "HELLOWORLD", 0          
K       DCD 1, 0, 4, 3, 2, 5, 9, 6, 8, 7  
    
    AREA STORE, DATA, READWRITE
XauMa   SPACE 100                   

    AREA MYCODE, CODE, READONLY
    ENTRY

Reset_Handler
    LDR R1, =XauRo          
    LDR R2, =XauMa          
    LDR R3, =K              ;

    MOV R4, #10            
    
LOOP
    LDR R5, [R3], #4        ;
    ADD R6, R1, R5          
    LDRB R7, [R6]           
    STRB R7, [R2], #1       
    SUBS R4, R4, #1         
    BNE LOOP               

STOP
    MOV R7, #0
    STRB R7, [R2]           
    SWI &11                 
    END
