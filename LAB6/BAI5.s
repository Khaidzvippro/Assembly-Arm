; NOI 2 XAU
	AREA RESET, DATA, READONLY
        DCD 0x20002000
        DCD MAIN

    AREA DATA1, DATA, READONLY
DT1 DCB "KHAI", 0           

    AREA DATA2, DATA, READONLY
DT2 DCB "DEP TRAI", 0      

    AREA DATA3, DATA, READWRITE
DT3 DCB 0         

    AREA Program, CODE, READONLY
    ENTRY

ConcatStrings
    PUSH {LR}                
    
LoopCopy
    LDRB R2, [R0], #1       
    CMP R2, #0               
    BEQ Done                
    STRB R2, [R1], #1        
    B LoopCopy               

Done
    POP {LR}                 
    BX LR                    

MAIN
    LDR R0, =DT1             
    LDR R1, =DT3             
    BL ConcatStrings         

    MOV R2, #32              
    STRB R2, [R1], #1        

    LDR R0, =DT2            
    BL ConcatStrings        

    SWI &11                  

    END                      
