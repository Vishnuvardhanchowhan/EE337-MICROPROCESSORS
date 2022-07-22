ORG 0H
LCD_data equ P2    
LCD_rs   equ P0.0  
LCD_rw   equ P0.1  
LCD_en   equ P0.2  
CALL MAIN
HERE: SJMP HERE
ORG 30H
MAIN:
MOV 70H,#2DH
MOV 71H,#0C3H
MOV A,70H
ORL A,#0F0H
XRL A,#0F0H
SWAP A
MOV R1,A
MOV A,70H
ORL A,#0FH
XRL A,#0FH
MOV R2,A
MOV A,71H
ORL A,#0F0H
XRL A,#0F0H
SWAP A
MOV R3,A
MOV A,71H
ORL A,#0FH
XRL A,#0FH
MOV R4,A

MOV P1,R1
acall lcd_init 
acall delay
acall delay
MOV A,#83H
acall lcd_command
acall delay
mov dptr,#LEVEL_1
acall lcd_sendstring
acall delay
MOV A,#0C3H
acall lcd_command
acall delay
mov dptr,#value
acall lcd_sendstring
acall delay
mov a,#0C9h
acall lcd_command
acall delay
MOV 06H,R1
ACALL HTAS_L1_4
MOV A,R6
acall lcd_senddata
mov a,#0CAh
acall lcd_command
acall delay
MOV 06H,R1
ACALL HTAS_L1_3
MOV A,R6
acall lcd_senddata
mov a,#0CBh
acall lcd_command
acall delay
MOV 06H,R1
ACALL HTAS_L1_2
MOV A,R6
acall lcd_senddata
mov a,#0CCh
acall lcd_command
acall delay
MOV 06H,R1
ACALL HTAS_L1_1
MOV A,R6
acall lcd_senddata
acall delay

CALL DELAY_1S

MOV P1,R2
acall lcd_init 
acall delay
acall delay
MOV A,#83H
acall lcd_command
acall delay
mov dptr,#LEVEL_2
acall lcd_sendstring
acall delay
MOV A,#0C3H
acall lcd_command
acall delay
mov dptr,#VALUE
acall lcd_sendstring
acall delay
mov a,#0C9h
acall lcd_command
acall delay
MOV 06H,R2
ACALL HTAS_L1_4
MOV A,R6
acall lcd_senddata
mov a,#0CAh
acall lcd_command
acall delay
MOV 06H,R2
ACALL HTAS_L1_3
MOV A,R6
acall lcd_senddata
mov a,#0CBh
acall lcd_command
acall delay
MOV 06H,R2
ACALL HTAS_L1_2
MOV A,R6
acall lcd_senddata
mov a,#0CCh
acall lcd_command
acall delay
MOV 06H,R2
ACALL HTAS_L1_1
MOV A,R6
acall lcd_senddata
acall delay

CALL DELAY_1S

MOV P1,R3
acall lcd_init 
acall delay
acall delay
MOV A,#83H
acall lcd_command
acall delay
mov dptr,#LEVEL_3
acall lcd_sendstring
acall delay
MOV A,#0C3H
acall lcd_command
acall delay
mov dptr,#value
acall lcd_sendstring
acall delay
mov a,#0C9h
acall lcd_command
acall delay
MOV 06H,R3
ACALL HTAS_L1_4
MOV A,R6
acall lcd_senddata
mov a,#0CAh
acall lcd_command
acall delay
MOV 06H,R3
ACALL HTAS_L1_3
MOV A,R6
acall lcd_senddata
mov a,#0CBh
acall lcd_command
acall delay
MOV 06H,R3
ACALL HTAS_L1_2
MOV A,R6
acall lcd_senddata
mov a,#0CCh
acall lcd_command
acall delay
MOV 06H,R3
ACALL HTAS_L1_1
MOV A,R6
acall lcd_senddata
acall delay

CALL DELAY_1S

MOV P1,R4
acall lcd_init 
acall delay
acall delay
MOV A,#83H
acall lcd_command
acall delay
mov dptr,#LEVEL_4
acall lcd_sendstring
acall delay
MOV A,#0C3H
acall lcd_command
acall delay
mov dptr,#value
acall lcd_sendstring
acall delay
mov a,#0C9h
acall lcd_command
acall delay
MOV 06H,R4
ACALL HTAS_L1_4
MOV A,R6
acall lcd_senddata
mov a,#0CAh
acall lcd_command
acall delay
MOV 06H,R4
ACALL HTAS_L1_3
MOV A,R6
acall lcd_senddata
mov a,#0CBh
acall lcd_command
acall delay
MOV 06H,R4
ACALL HTAS_L1_2
MOV A,R6
acall lcd_senddata
mov a,#0CCh
acall lcd_command
acall delay
MOV 06H,R4
ACALL HTAS_L1_1
MOV A,R6
acall lcd_senddata
acall delay

CALL DELAY_1S
LJMP MAIN
RET

DELAY_1S:
MOV A,#31
MOV R7,A
LOOP_2: 
DJNZ R7,DELAY_T
RET
DELAY_T:
MOV R5,#0FFH
MOV R6,#0FFH
MOV TMOD,#00000001B
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
SETB TR0
LOOP_1: JNB TF0,LOOP_1
CLR TR0
CLR TF0
LJMP LOOP_2

delay:	 push 0
	     push 1
         mov r0,#1
loop2:	 mov r7,#255
	 loop1:	 djnz r7, loop1
	 djnz r0, loop2
	 pop 1
	 pop 0 
	 ret

ORG 300H
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
HTAS_L1_4:
MOV A,R6
SWAP A
ANL A,#00001000B
CJNE A,#00001000B,ZE
MOV R6,#31H
RET
HTAS_L1_3:
MOV A,R6
SWAP A
ANL A,#00000100B
CJNE A,#00000100B,ZE
MOV R6,#31H
RET
HTAS_L1_2:
MOV A,R6
SWAP A
ANL A,#00000010B
CJNE A,#00000010B,ZE
MOV R6,#31H
RET
HTAS_L1_1:
MOV A,R6
SWAP A
ANL A,#00000001B
CJNE A,#00000001B,ZE
MOV R6,#31H
RET

ZE:
MOV R6,#30H
RET


LEVEL_1:
         DB   "Level 1", 00H
LEVEL_2:
         DB   "Level 2", 00H
LEVEL_3:
         DB   "Level 3", 00H
LEVEL_4:
         DB   "Level 4", 00H
value:
         DB   "Value:", 00H
			 
END

