ORG 0000H
LCD_data equ P2    ;LCD Data port
LCD_rs   equ P0.0  ;LCD Register Select
LCD_rw   equ P0.1  ;LCD Read/Write
LCD_en   equ P0.2  ;LCD Enable
LJMP MAIN
ORG 000BH
LJMP TMRINTR
ORG 0040H
MAIN:
MOV P1,#00H
acall lcd_init 
acall delay
acall delay
MOV A,#81H
acall lcd_command
acall delay
mov dptr,#SLINE1
acall lcd_sendstring
acall delay
MOV A,#0C1H
acall lcd_command
acall delay
mov dptr,#SLINE2
acall lcd_sendstring
acall delay
MOV R1,#2
ACALL DELAY_NS
MOV P1,#1FH
MOV R5,#0FFH
MOV R6,#0FFH
MOV TMOD,#00010001B
MOV A,R5
XRL A,#0FFH
MOV R5,A
MOV A,R6
XRL A,#0FFH
MOV R6,A
MOV A,#1
ADD A,R5
MOV R5,A
CLR A
RRC A
ADD A,R6
MOV R6,A
MOV TL0,R5
MOV TH0,R6
MOV IE,#10000010B
SETB TR0
MOV R3,#00H
REV: CJNE R3,#1,REV 
    ACALL LCD_INIT
	ACALL DELAY
	MOV A,#80H
	ACALL LCD_COMMAND
	ACALL DELAY
	MOV DPTR,#ELINE1
	ACALL LCD_SENDSTRING
	ACALL DELAY
	ACALL DELAY
	acall c_time
	acall decconvert
	MOV A,#0C0H
	ACALL LCD_COMMAND
	ACALL DELAY
	MOV A,63H
	ACALL lcd_senddata
	ACALL DELAY
	ACALL DELAY
	MOV A,#0C1H
	ACALL LCD_COMMAND
	ACALL DELAY
	MOV A,64H
	ACALL lcd_senddata
	ACALL DELAY
	ACALL DELAY
	MOV A,#0C2H
	ACALL LCD_COMMAND
	ACALL DELAY
	MOV A,65H
	ACALL lcd_senddata
	ACALL DELAY
	ACALL DELAY
	MOV A,#0C3H
	ACALL LCD_COMMAND
	ACALL DELAY
	MOV A,66H
	ACALL lcd_senddata
	ACALL DELAY 
	ACALL DELAY
	ACALL DELAY
	MOV A,#0C5H
	ACALL LCD_COMMAND
	ACALL DELAY
	MOV DPTR,#my_string4
	ACALL LCD_SENDSTRING
	ACALL DELAY 
	ACALL DELAY
	MOV R1,#5
    ACALL DELAY_NS
ljmp main

ORG 300H
c_time:
    MOV A,R2
	MOV B,#32
	MUL AB
	MOV 61H,B
	MOV 60H,A
    RET
	
	
decconvert:
	
	MOV A,60H //d1 modulus start
	MOV B,#10
	DIV AB
	MOV R1,B
	MOV A,61H
	MOV B,#10
	DIV AB
	MOV A,#6
	MUL AB
	MOV B,#10
	DIV AB
	MOV A,R1
	ADD A,B
	MOV B,#10
	DIV AB
	MOV A,B
	ADD A,#30H
	MOV 66H,A //d1 modulus ends

	MOV A,60H //d1 division starts
	MOV B,#10
	DIV AB
	MOV R1,A
	MOV R2,B
	MOV A,61H
	MOV B,#10
	DIV AB
	MOV R3,A
	MOV R4,B
	MOV A,#6
	MUL AB
	ADD A,R2
	MOV B,#10
	DIV AB
	MOV R2,A
	MOV A,R4
	MOV B,#25
	MUL AB
	MOV R4,A //d1 division ends

	MOV A,R1 //d2 modulus starts
	MOV B,#10
	DIV AB
	MOV A,B
	ADD A,R2
	MOV 65H,A
	MOV A,R3
	MOV B,#6
	MUL AB
	MOV B,#10
	DIV AB
	MOV A,B
	ADD A,65H
	MOV 65H,A
	MOV A,R4
	MOV B,#10
	DIV AB
	MOV A,B
	ADD A,65H
	MOV B,#10
	DIV AB
	MOV A,B
	ADD A,#30H
	MOV 65H,A //d2 modulus ends

	MOV A,R1 //d2 division starts
	MOV B,#10
	DIV AB
	MOV R1,A
	MOV A,B
	ADD A,R2
	MOV R2,A
	MOV A,R3
	MOV B,#25
	MUL AB
	ADD A,R1
	MOV R1,A
	MOV A,R3
	MOV B,#6
	MUL AB
	ADD A,R2
	MOV R2,A
	MOV A,R4
	MOV B,#10
	DIV AB
	ADD A,R1
	MOV R1,A
	MOV A,B
	ADD A,R2
	MOV B,#10
	DIV AB
	ADD A,R1
	MOV R1,A //d2 division ends
	
	MOV A,R1 //d3,d4 modulus starts
	MOV B,#10
	DIV AB
	MOV R2,A
	MOV A,B
	ADD A,#30H
	MOV 64H,A
	MOV A,R2
	ADD A,#30H
	MOV 63H,A //d3,d4 modulus ends
RET
DELAY_NS:
MOV A,#31
MOV B,R1
MUL AB
MOV R3,A
LOOP_2: 
DJNZ R3,DELAY_T
RET

DELAY_T:
MOV R5,#0FFH
MOV R6,#0FFH
MOV TMOD,#00010001B
MOV A,R5
XRL A,#0FFH
MOV R5,A
MOV A,R6
XRL A,#0FFH
MOV R6,A
MOV A,#1
ADD A,R5
MOV R5,A
CLR A
RRC A
ADD A,R6
MOV R6,A
MOV TL1,R5
MOV TH1,R6
SETB TR1
LOOP_1: JNB TF1,LOOP_1
CLR TR1
CLR TF1
LJMP LOOP_2

lcd_init:
         mov   LCD_data,#38H  ;Function set: 2 Line, 8-bit, 5x7 dots
         clr   LCD_rs         ;Selected command register
         clr   LCD_rw         ;We are writing in instruction register
         setb  LCD_en  ;Enable H->L
		 acall delay
         clr   LCD_en
	     acall delay

         mov   LCD_data,#0CH  ;Display on, Curson off
         clr   LCD_rs         ;Selected instruction register
         clr   LCD_rw         ;We are writing in instruction register
         setb  LCD_en         ;Enable H->L
		 acall delay
         clr   LCD_en
         
		 acall delay
         mov   LCD_data,#01H  ;Clear LCD
         clr   LCD_rs         ;Selected command register
         clr   LCD_rw         ;We are writing in instruction register
         setb  LCD_en         ;Enable H->L
		 acall delay
         clr   LCD_en
         
		 acall delay

         mov   LCD_data,#06H  ;Entry mode, auto increment with no shift
         clr   LCD_rs         ;Selected command register
         clr   LCD_rw         ;We are writing in instruction register
         setb  LCD_en         ;Enable H->L
		 acall delay
         clr   LCD_en

		 acall delay
         
         ret 

 lcd_command:
         mov   LCD_data,A     ;Move the command to LCD port
         clr   LCD_rs         ;Selected command register
         clr   LCD_rw         ;We are writing in instruction register
         setb  LCD_en         ;Enable H->L
		 acall delay
         clr   LCD_en
		 acall delay
    
         ret  
lcd_sendstring:
	push 0e0h
	lcd_sendstring_loop:
	 	     clr   a                 ;clear Accumulator for any previous data
	         movc  a,@a+dptr         ;load the first character in accumulator
	         jz    exit              ;go to exit if zero
	         acall lcd_senddata      ;send first char
	         inc   dptr              ;increment data pointer
	         sjmp  LCD_sendstring_loop    ;jump back to send the next character
exit:    pop 0e0h
         ret 

lcd_senddata:
         mov   LCD_data,A     ;Move the command to LCD port
         setb  LCD_rs         ;Selected data register
         clr   LCD_rw         ;We are writing
         setb  LCD_en         ;Enable H->L
		 acall delay
         clr   LCD_en
         acall delay
		 acall delay
         ret
delay:	 push 0
	     push 1
         mov r0,#1
loop2:	 mov r7,#255
	 loop1:	 djnz r7, loop1
	 djnz r0, loop2
	 pop 1
	 pop 0 
	 ret
	 
SLINE1:
         DB   "Toggle SW1", 00H
SLINE2:
         DB   "if LED glows", 00H
ELINE1:
         DB   "Reaction Time", 00H

my_string4: DB "milliseconds",00H

ORG 1000H
TMRINTR:
MOV R4,P1
CJNE R4,#11H,COUNT
MOV P1,#00H
MOV R3,#1
CLR TR0
CLR TF0
RETI

COUNT:
INC R2
CLR TR0
CLR TF0
MOV TL0,R5
MOV TH0,R6
SETB TR0
RETI


END