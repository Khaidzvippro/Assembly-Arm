; Tinh tong cac phan tu trong chuoi
	AREA    RESET, DATA, READONLY
		DCD  0x20001000    
		DCD  Reset_Handler  

nums	
	DCD 1,5,8,1,6,0,7,3,2,4  ; khai bao chuoi cac phan tu

	AREA    MYCODE, CODE, READONLY
 
	ENTRY  ; khai bao diem vao chuong trinh
	EXPORT Reset_Handler
	
Reset_Handler

length	EQU	10 

start
	LDR R0, =nums     
	MOV R1, #0        
	MOV R2, #0        

loop
	LDR R3, [R0], #4  
	ADD R1, R3  
	ADD R2, #1    
	CMP R2, #length   
	BLT loop      ;nho hon    
	
stop	
	B stop            
	END
