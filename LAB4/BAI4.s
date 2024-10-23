	AREA RESET, DATA, READONLY
		DCD 0x20000000
		DCD Main
array	DCD 3,2,1,4,5
length	DCD 5
matrix
    DCD 3, -7, 1, -4, 5
    DCD -8, 3, -1, 4, -2
    DCD 9, -6, 2, -3, 0
    DCD -5, 8, -9, 1, -4   
    DCD -5, 7, -2, 1, 4 
rows DCD 5
columns DCD 5
num1  DCD 7
num2  DCD 8
	AREA mycode, CODE ,READONLY
	EXPORT Main
	ENTRY

;func_1
func_1 PROC
	LDR R0,=array 		
	LDR R1,=length
	LDR R1,[R1]
	MOV R2,#0
	MOV R3,#0
loop_1
	LDR R4,[R0],#4
	ADD R2, R4
	ADD R3,#1
	CMP R3,R1
	BLT loop_1
	BX LR
	ENDP
;func_2
func_2 PROC
	LDR R0, num1
	LDR R1, num2
loop_2 
	CMP R0, R1
	BGT swap_2
next_2
	SUB R1, R0
	CMP R1, R0
	BEQ end_func2
	B loop_2
swap_2
	MOV R2, R0
	MOV R0, R1
	MOV R1, R2
	B next_2
end_func2 
	BX LR
	ENDP
;func_3
func_3 PROC
	LDR R0,=array 		
	LDR R1,=length
	LDR R1,[R1]
	LDR R2, [R0], #4
	MOV R3, R2  ;MAX
	MOV R4, R2  ;MIN
	MOV R5, #1  
loop_3
	CMP R5, R1 
	BEQ done
	LDR R2, [R0], #4 
	CMP R2, R3
	BLE skip_max
	MOV R3, R2
skip_max
    CMP R2, R4           
    BGE skip_min         
    MOV R4, R2           

skip_min
    ADD R5, R5, #1       
    B loop_3               

done
    BX LR                
	ENDP
;func_4
func_4 PROC
	MOV R0, #0    ; ketqua sum
	LDR R2, =array
	MOV R3, #0 		;offset
	LDR R4, length
loop_4
	LDR R5, [R2, R3]  ; R5 = R2 + R3
	ADD R0, R5
	ADD R3, #4
	SUB R4, #1
	CMP R4, #0
	BGT loop_4
	LDR R2, length
	SDIV R0, R0, R2
	BX 	LR
	ENDP
;func_5
func_5 PROC
	LDR R1, rows
	LDR R0, columns
	MUL R1, R1, R0 
	LDR R0, =matrix	
	MOV R2, #0 ; tong
	MOV R3, #0 ; index
	MOV R4, #0 ; congdan
loop_5
	CMP R3, R1
	BGE done_func_5
	LDR R5, [R0, R4]
	ADDS R2, R5
	ADDS R4, #4
	ADDS R3, #1
	B loop_5
done_func_5
	BX LR
	ENDP
;func_6
func_6 PROC
	LDR R1, rows
	LDR R0, columns
	MUL R1, R1, R0 
	LDR R0, =matrix	
	MOV R2, #0 ; so so duong
	MOV R3, #0 ; so so am
	MOV R4, #0 ; congdan
	MOV R5, #0
loop_6
	CMP R5, R1
	BGE done_func_6
	LDR R6, [R0, R4]
	CMP R6, #0
	BGT AM
	BLT loop_6
	B NEXT
AM
	ADD R2,R2,#1
	B NEXT
DUONG
	ADD R3,R3,#1
NEXT
	ADD R4, #4
	ADD R5, #1
	B func_6
done_func_6
	BX LR
	ENDP
;func_7
func_7 PROC
  MOV R0, #4
	LDR R1, rows
	LDR R2, =matrix
	LDR R5, [R2]; max
	LDR R6, [R2]; min 
	; tinh tren duong cheo chinh
Initial_for_main
	MOV R8, R1
	ADD R8, #1
	MUL R0, R0, R8
	MOV R3, #0; index
	MOV R4, #0; congdan
Loop_main
	CMP R3, R1
	BGE End_main
	LDR R7, [R2, R4]
	CMP R7, R6
	BLT main_swap_min
	CMP R7, R5
	BGT main_swap_max
main_swap_max
	MOV R5, R7
	B main_next
main_swap_min
	MOV R6, R7
main_next
	ADD R4, R0
	ADD R3, #1
	B Loop_main
End_main
	MOV R9, R5
	MOV R10, R6
Initial_for_sub
	MOV R0, #4
	MOV R8, R1
	SUB R8, #1
	MUL R4, R8, R0 ;cong dan
	MOV R3, #0; index
	MUL R8, R8, R0
	LDR R5, [R2,R4]; max
	LDR R6, [R2,R4]; min 
Loop_sub
	CMP R3, R1
	BGE End_sub
	LDR R7, [R2, R4]
	CMP R7, R6
	BLT sub_swap_min
	CMP R7, R5
	BGT sub_swap_max
sub_swap_max
	MOV R5, R7
	B sub_next
sub_swap_min
	MOV R6, R7
sub_next
	ADD R4, R8
	ADD R3, #1
	B Loop_sub
End_sub
	MOV R0, R5
	MOV R1, R6
	ENDP
;func_8
func_8 PROC
	LDR R1, rows
	LDR R0, columns
	MUL R1, R1, R0 
	LDR R0, =matrix	
	MOV R2, #0 ; TONG CHAN
	MOV R3, #0 ; TONG LE
	MOV R4, #0 ; congdan
	MOV R5, #0
loop_8
	CMP R5,R1
	BGE done_func_8
	LDR R6, [R0, R4]
	AND R7,R6,#1
	CMP R7, 0
	BEQ TONG_CHAN
	ADD R3,R3,R6
	B tiep
TONG_CHAN
	ADD R2,R2,R6
	B tiep
tiep
	ADD R4,#4
	ADD R5,#1
	B loop_8
done_func_8
	BX LR
	ENDP
;func_9
func_9 PROC
	LDR R0, =matrix
	LDR R1, rows 
	LDR R2, columns
	MUL R1, R1, R2 ; length
	MOV R2, #0 ; index
	MOV R3, #0 ; index of adress by byte
	MOV R4, #0 ; Tong
loop_9
	CMP R2, R1
	BEQ KetQua_9
	LDR R5, [R0,R3]
	MOV R6, R5
	MOV R8, #5
	SDIV R6, R6, R8
	MUL R6, R6, R8
	SUBS R7, R5, R6
	CMP R7, #0
	BEQ them_9
	B next_9
them_9 
	ADDS R4, R5
next_9
	ADD R2, #1
	ADD R3, #4
	B loop_9
KetQua_9
	MOV R0, R4
	ENDP
;func_10
func_10 PROC
	LDR R3, =array
	LDR R4, length
	CMP R4, #2
	BLT end_func_10
	MOV R5, #0
  LDR R0, [R3, R5]
	ADD R5, #4
	LDR R1, [R3, R5]
	SUB R4, #2
loop_10 
	CMP R1, R0
	BEQ end_sub_10
	CMP R0, R1
	BGT swap_10
next_10
	SUB R1, R0
	CMP R1, R0
	BEQ end_sub_10
	B loop_10
swap_10
	MOV R2, R0
	MOV R0, R1
	MOV R1, R2
	B next_10
end_sub_10
	CMP R4, #0
	BEQ end_func_10
	ADD R5, #4
	LDR R1, [R3, R5]
	SUB R4, #1
	B loop_10
end_func_10
	BX LR
	ENDP
;main func
Main
	BL func_1
	BL func_2
	BL func_3
	BL func_4
	BL func_5
	BL func_6
	BL func_7
	BL func_8
	BL func_9
	BL func_10
	
Stop 
	B Stop
	END