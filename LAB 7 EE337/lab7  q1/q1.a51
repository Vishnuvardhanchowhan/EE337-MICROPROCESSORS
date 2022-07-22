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
acall lcd_init 
acall delay
acall delay
MOV A,#81H
acall lcd_command
acall delay
mov dptr,#ELINE1
acall lcd_sendstring
acall delay
MOV A,#0C1H
acall lcd_command
acall delay
mov dptr,#ELINE2
acall lcd_sendstring
acall delay
MOV A,#0CAH
acall lcd_command
acall delay
MOV A,R2
ACALL HEXCONV
MOV A,60H
acall lcd_senddata
ACALL delay
MOV A,#0CBH
acall lcd_command
acall delay
MOV A,61H
acall lcd_senddata
ACALL delay
MOV A,#0CCH
acall lcd_command
acall delay
MOV A,TH0
ACALL HEXCONV
MOV A,60H
acall lcd_senddata
ACALL delay
MOV A,#0CDH
acall lcd_command
acall delay
MOV A,61H
acall lcd_senddata
ACALL delay
MOV A,#0CEH
acall lcd_command
acall delay
MOV A,TL0
ACALL HEXCONV
MOV A,60H
acall lcd_senddata
ACALL delay
MOV A,#0CFH
acall lcd_command
acall delay
MOV A,61H
acall lcd_senddata
MOV R1,#5

ACALL DELAY_NS

LJMP MAIN




ORG 300H
	
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
ELINE2:
         DB   "Count is", 00H

			 
HEXCONV:
MOV B,#10H
DIV AB
MOV R1,A
MOV R2,B
MOV R3,#10
MOV R5,#6
SJMP VRF_A 
VRF_A:
STRT_L_1A:
ADD A,#01H
MOV R1,A
LOOP_1A:
MOV A,R1
CJNE A,03H,NEXT_1A
LOAD_A_1:
CLR A
ADD A,#30H
ADD A,R1
SUBB A,#1
MOV R3,#10
MOV 60H,A
SJMP VRF_B
STRT_L_2A:
CLR A
MOV A,R1
SUBB A,#10
MOV R4,A
LOOP_2A:
MOV A,R4
CJNE A,05H,NEXT_2A
LOAD_A_2:
CLR A
ADD A,#40H
ADD A,R4
MOV 60H,A
SJMP VRF_B
VRF_B:
STRT_L_1B:
CLR A
MOV A,R2
ADD A,#01H
MOV R2,A
LOOP_1B:
MOV A,R2
CJNE A,03H,NEXT_1B
LOAD_B_1:
CLR A
ADD A,#30H
ADD A,R2
SUBB A,#1
MOV 61H,A
MOV R3,#10
SJMP ending
STRT_L_2B:
CLR A
MOV A,R2
SUBB A,#10
MOV R4,A
LOOP_2B:
MOV A,R4
CJNE A,05H,NEXT_2B
LOAD_B_2:
CLR A
ADD A,#40H
ADD A,R4
MOV 61H,A
SJMP ending
NEXT_1A:
DJNZ R3,LOOP_1A
MOV R3,#10
SJMP STRT_L_2A
NEXT_2A:
DJNZ R5,LOOP_2A
MOV R5,#6
SJMP ending
NEXT_1B:
DJNZ R3,LOOP_1B
MOV R3,#10
SJMP STRT_L_2B
NEXT_2B:
DJNZ R5,LOOP_2B
MOV R5,#6
SJMP ending
ending:
ret

			 

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