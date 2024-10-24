; DAO NGUOC XAU THEO DO DAI VA KI TU KET THUC
	AREA RESET, DATA, READONLY
    DCD 0x20001000          
    DCD Main                

    AREA Input, DATA, READONLY
InputString
    DCD 14 
    DCB "HELLO, WORLD!", 0   
                   
    AREA Output, DATA, READWRITE
OutputStringLength
    SPACE 14                 
OutputStringTerminator
    SPACE 14                 

    AREA Program, CODE, READONLY
    ENTRY

Main
    BL ReverseByLength
    BL ReverseByTerminator

    SWI &11

ReverseByLength
    LDR R0, =InputString 
    LDRB R1, [R0]        ;r1=14  
	ADD R0,R0,#4
    ADD R1, R1, R0      ;r1 tro den dia chi cuoi cung cua chuoi  
    LDR R2, =OutputStringLength 
	SUBS R1, R1, #1
ReverseLoopLength 
	SUBS R1, R1, #1
    LDRB R3, [R1]              
    STRB R3, [R2], #1          
    CMP R1, R0                 
    BNE ReverseLoopLength       
    MOV R3, #0        ; chuoi sau khi dao nguoc xong, them ki tu ket thuc o cuoi          
    STRB R3, [R2]               
    BX LR                       

ReverseByTerminator
    LDR R0, =InputString 
	ADD R0,R0,#4      ;cong 4byte de bo qua do dai chuoi
    LDR R2, =OutputStringTerminator 
FindNull
    LDRB R1, [R0], #1    
    CMP R1, #0            
    BEQ ReverseLoopTerminator
    B FindNull

ReverseLoopTerminator
    SUB R0, R0, #2       
ReverseLoop
    LDRB R1, [R0]         
    STRB R1, [R2], #1     
    SUB R0, R0, #1        
    CMP R1, #0            
    BNE ReverseLoop  
	
    BX LR                 
    END
