ORG 0000H
LCD_data equ P2    ;LCD Data port
LCD_rs   equ P0.0  ;LCD Register Select
LCD_rw   equ P0.1  ;LCD Read/Write
LCD_en   equ P0.2  ;LCD Enable
LJMP MAIN
ORG 001BH
LJMP TMRINTR
ORG 0040H
MAIN:
MOV R3,#30
MOV R5,#050H
MOV R6,#0C3H
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
MOV IE,#10001000B
SETB TR1
acall lcd_init 
acall delay
acall delay
MOV A,#81H
acall lcd_command
acall delay
mov dptr,#SLINE1
acall lcd_sendstring
acall delay
MOV R7,#1
CLR P0.0
CLR P0.1
CLR P0.2
N1:
SETB P0.7
ACALL DELAY_N1
CLR p0.7
ACALL DELAY_N1
CJNE R4,#1,N1

RETN2_1:
MOV R4,#0
MOV R7,#2
MOV R3,#30
MOV R5,#050H
MOV R6,#0C3H
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
MOV IE,#10001000B
SETB TR1
N2_1:
SETB P0.7
ACALL DELAY_N2
CLR p0.7
ACALL DELAY_N2
CJNE R4,#1,N2_1

RETN3:
MOV R4,#0
MOV R7,#3
MOV R3,#30
MOV R5,#050H
MOV R6,#0C3H
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
MOV IE,#10001000B
SETB TR1
N3:
SETB P0.7
ACALL DELAY_N3
CLR p0.7
ACALL DELAY_N3
CJNE R4,#1,N3

RETN2_2:
MOV R4,#0
MOV R7,#4
MOV R3,#30
MOV R5,#050H
MOV R6,#0C3H
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
MOV IE,#10001000B
SETB TR1
N2_2:
SETB P0.7
ACALL DELAY_N2
CLR p0.7
ACALL DELAY_N2
CJNE R4,#1,N2_2

RETN4_1:
MOV R4,#0
MOV R7,#5
MOV R3,#40
MOV R5,#050H
MOV R6,#0C3H
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
MOV IE,#10001000B
SETB TR1
N4_1:
SETB P0.7
ACALL DELAY_N4
CLR p0.7
ACALL DELAY_N4
CJNE R4,#1,N4_1

RETSIL:
MOV R4,#0
MOV R7,#6
MOV R3,#20
MOV R5,#050H
MOV R6,#0C3H
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
MOV IE,#10001000B
SETB TR1
NSIL:
CLR P0.7
CJNE R4,#1,NSIL

RETN4_2:
MOV R4,#0
MOV R7,#7
MOV R3,#40
MOV R5,#050H
MOV R6,#0C3H
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
MOV IE,#10001000B
SETB TR1
N4_2:
SETB P0.7
ACALL DELAY_N4
CLR p0.7
ACALL DELAY_N4
CJNE R4,#1,N4_2

RETN5:
MOV R4,#0
MOV R7,#8
MOV R3,#40
MOV R5,#050H
MOV R6,#0C3H
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
MOV IE,#10001000B
SETB TR1
N5:
SETB P0.7
ACALL DELAY_N5
CLR p0.7
ACALL DELAY_N5
CJNE R4,#1,N5

LJMP MAIN


ORG 0200H
	
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
         DB   "ROLLING TIME", 00H

	
DELAY_N1:
MOV R1,#0C1H
MOV R2,#011H
MOV TMOD,#00010001B
MOV A,R1
XRL A,#0FFH
MOV R1,A
MOV A,R2
XRL A,#0FFH
MOV R2,A
MOV A,#1
ADD A,R1
MOV R1,A
CLR A
RRC A
ADD A,R2
MOV R2,A
MOV TL0,R1
MOV TH0,R2
MOV R1,#00H
MOV R2,#00H
SETB TR0
LOOP_N1: JNB TF0,LOOP_N1
CLR TR0
CLR TF0
RET

DELAY_N2:
MOV R1,#0D0H
MOV R2,#0FH
MOV TMOD,#00010001B
MOV A,R1
XRL A,#0FFH
MOV R1,A
MOV A,R2
XRL A,#0FFH
MOV R2,A
MOV A,#1
ADD A,R1
MOV R1,A
CLR A
RRC A
ADD A,R2
MOV R2,A
MOV TL0,R1
MOV TH0,R2
MOV R1,#00H
MOV R2,#00H
SETB TR0
LOOP_N2: JNB TF0,LOOP_N2
CLR TR0
CLR TF0
RET

DELAY_N3:
MOV R1,#49H
MOV R2,#0DH
MOV TMOD,#00010001B
MOV A,R1
XRL A,#0FFH
MOV R1,A
MOV A,R2
XRL A,#0FFH
MOV R2,A
MOV A,#1
ADD A,R1
MOV R1,A
CLR A
RRC A
ADD A,R2
MOV R2,A
MOV TL0,R1
MOV TH0,R2
MOV R1,#00H
MOV R2,#00H
SETB TR0
LOOP_N3: JNB TF0,LOOP_N3
CLR TR0
CLR TF0
RET

DELAY_N4:
MOV R1,#08EH
MOV R2,#0AH
MOV TMOD,#00010001B
MOV A,R1
XRL A,#0FFH
MOV R1,A
MOV A,R2
XRL A,#0FFH
MOV R2,A
MOV A,#1
ADD A,R1
MOV R1,A
CLR A
RRC A
ADD A,R2
MOV R2,A
MOV TL0,R1
MOV TH0,R2
MOV R1,#00H
MOV R2,#00H
SETB TR0
LOOP_N4: JNB TF0,LOOP_N4
CLR TR0
CLR TF0
RET

DELAY_N5:
MOV R1,#0D6H
MOV R2,#0BH
MOV TMOD,#00010001B
MOV A,R1
XRL A,#0FFH
MOV R1,A
MOV A,R2
XRL A,#0FFH
MOV R2,A
MOV A,#1
ADD A,R1
MOV R1,A
CLR A
RRC A
ADD A,R2
MOV R2,A
MOV TL0,R1
MOV TH0,R2
MOV R1,#00H
MOV R2,#00H
SETB TR0
LOOP_N5: JNB TF0,LOOP_N5
CLR TR0
CLR TF0
RET


ORG 1000H
TMRINTR:

STRT_N1:
CJNE R7,#1,STRT_N2_1
DJNZ R3,T1N1
CLR TR1
CLR TF1
MOV R4,#1
RETI
T1N1:
CLR TR1
CLR TF1
MOV TMOD,#00010001B
MOV TL1,R5
MOV TH1,R6
MOV IE,#10001000B
SETB TR1
RETI

STRT_N2_1:
CJNE R7,#2,STRT_N3
DJNZ R3,T1N2_1
CLR TR1
CLR TF1
MOV R4,#1
RETI
T1N2_1:
CLR TR1
CLR TF1
MOV TMOD,#00010001B
MOV TL1,R5
MOV TH1,R6
MOV IE,#10001000B
SETB TR1
RETI

STRT_N3:
CJNE R7,#3,STRT_N2_2
DJNZ R3,T1N3
CLR TR1
CLR TF1
MOV R4,#1
RETI
T1N3:
CLR TR1
CLR TF1
MOV TMOD,#00010001B
MOV TL1,R5
MOV TH1,R6
MOV IE,#10001000B
SETB TR1
RETI

STRT_N2_2:
CJNE R7,#4,STRT_N4_1
DJNZ R3,T1N2_2
CLR TR1
MOV R4,#1
RETI
T1N2_2:
CLR TR1
CLR TF1
MOV TMOD,#00010001B
MOV TL1,R5
MOV TH1,R6
MOV IE,#10001000B
SETB TR1
RETI

STRT_N4_1:
CJNE R7,#5,STRT_SIL
DJNZ R3,T1N4_1
CLR TR1
CLR TF1
MOV R4,#1
RETI
T1N4_1:
CLR TR1
CLR TF1
MOV TMOD,#00010001B
MOV TL1,R5
MOV TH1,R6
MOV IE,#10001000B
SETB TR1
RETI

STRT_SIL:
CJNE R7,#6,STRT_N4_2
DJNZ R3,T1SIL
CLR TR1
CLR TF1
MOV R4,#1
RETI
T1SIL:
CLR TR1
CLR TF1
MOV TMOD,#00010001B
MOV TL1,R5
MOV TH1,R6
MOV IE,#10001000B
SETB TR1
RETI

STRT_N4_2:
CJNE R7,#7,STRT_N5
DJNZ R3,T1N4_2
CLR TR1
CLR TF1
MOV R4,#1
RETI
T1N4_2:
CLR TR1
CLR TF1
MOV TMOD,#00010001B
MOV TL1,R5
MOV TH1,R6
MOV IE,#10001000B
SETB TR1
RETI

STRT_N5:
CJNE R7,#8,ENDING
DJNZ R3,T1N5
CLR TR1
CLR TF1
MOV R4,#1
RETI
T1N5:
CLR TR1
CLR TF1
MOV TMOD,#00010001B
MOV TL1,R5
MOV TH1,R6
MOV IE,#10001000B
SETB TR1
RETI

ENDING:
RETI

END





