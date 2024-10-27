    AREA RESET, DATA, READONLY
    DCD 0x20001000
    DCD Main

    ALIGN
K     DCD 3                      
XauRo DCB "HELLO WORLD", 0       
Length   DCB 11                     

    AREA STORE, DATA, READWRITE
XauMa SPACE 100                  

    AREA MYCODE, CODE, READONLY
    ENTRY

Main
    LDR R0, =XauRo               
    LDR R1, =XauMa               
    LDR R2, K                    
    LDRB R3, Length                 

    MOV R4, #0                   ; Hang
    MOV R5, #0                   ; Cot
    MOV R6, #0                   ; hien tai
								 
NextRow
    CMP R5, R2                   ; so sanh cot 
    BEQ Done                     

    MOV R4, #0                   
    B ReadColumn                 

ReadColumn
    MUL R6, R4, R2               ; hang * k + cot
    ADD R6, R6, R5               

    CMP R6, R3                   
    BGE NextColumn                 

    LDRB R7, [R0, R6]            
    STRB R7, [R1], #1            

    ADD R4, R4, #1               
    B ReadColumn                

NextColumn
    ADD R5, R5, #1               
    B NextRow                 

Done
    MOV R7, #0                   
    STRB R7, [R1]
    SWI &11                     

    END
