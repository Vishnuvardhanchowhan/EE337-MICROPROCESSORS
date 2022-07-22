ORG 00H
LCD_data equ P2    ;LCD Data port
LCD_rs   equ P0.0  ;LCD Register Select
LCD_rw   equ P0.1  ;LCD Read/Write
LCD_en   equ P0.2  ;LCD Enable
LJMP MAIN
ORG 30H
MAIN:
STATE_0:
       mov P2,#00h
      mov P1,#00h
      acall delay
	  acall delay
	  acall lcd_init  
	  acall delay
	  acall delay
	  acall delay
	  mov a,#83h		 ;Put cursor on first row,5 column
	  acall lcd_command	 ;send command to LCD
	  acall delay
	  mov dptr,#my_string1   ;Load DPTR with sring1 Addr
	  acall lcd_sendstring	   ;call text strings sending routine
	  acall delay
	  mov a,#0C3h		  ;Put cursor on second row,3 column
	  acall lcd_command
	  acall delay
	  mov dptr,#my_string2
	  acall lcd_sendstring
      MOV P1,#0FFH
      CALL DELAY_2S
STATE_1:
      acall delay
	  acall delay
	  acall lcd_init  
	  acall delay
	  acall delay
	  acall delay
	  mov a,#82h		 ;Put cursor on first row,5 column
	  acall lcd_command	 ;send command to LCD
	  acall delay
	  mov dptr,#my_string3   ;Load DPTR with sring1 Addr
	  acall lcd_sendstring	   ;call text strings sending routine
	  acall delay
	  mov a,#0C3h		  ;Put cursor on second row,3 column
	  acall lcd_command
	  acall delay
	  mov dptr,#my_string2
	  acall lcd_sendstring
      MOV P1,#8FH
	  MOV A,P1
	  MOV B,#10H
	  DIV AB
	  MOV R1,B
	  MOV A,R1
	  SWAP A
	  MOV 30H,A
      ACALL DELAY_2S
STATE_2:
      acall delay
	  acall delay
	  acall lcd_init  
	  acall delay
	  acall delay
	  acall delay
	  mov a,#82h		 ;Put cursor on first row,5 column
	  acall lcd_command	 ;send command to LCD
	  acall delay
	  mov dptr,#my_string3   ;Load DPTR with sring1 Addr
	  acall lcd_sendstring	   ;call text strings sending routine
	  acall delay
	  mov a,#0C3h		  ;Put cursor on second row,3 column
	  acall lcd_command
	  acall delay
	  mov dptr,#my_string2
	  acall lcd_sendstring
      MOV P1,#4FH
	  MOV A,P1
	  MOV B,#10H
	  DIV AB
	  CLR A
	  ADD A,30H
	  ADD A,B
	  MOV 30H,A
      ACALL DELAY_2S
STATE_3:
      acall delay
	  acall delay
	  acall lcd_init  
	  acall delay
	  acall delay
	  acall delay
	  mov a,#82h		 ;Put cursor on first row,5 column
	  acall lcd_command	 ;send command to LCD
	  acall delay
	  mov dptr,#my_string3   ;Load DPTR with sring1 Addr
	  acall lcd_sendstring	   ;call text strings sending routine
	  acall delay
	  mov a,#0C3h		  ;Put cursor on second row,3 column
	  acall lcd_command
	  acall delay
	  mov dptr,#my_string2
	  acall lcd_sendstring
      MOV P1,#2FH
	  MOV A,P1
	  MOV B,#10H
	  DIV AB
	  MOV R1,B
	  MOV A,R1
	  SWAP A
	  MOV 31H,A
      CALL DELAY_2S
STATE_4:
      acall delay
	  acall delay
	  acall lcd_init  
	  acall delay
	  acall delay
	  acall delay
	  mov a,#82h		 ;Put cursor on first row,5 column
	  acall lcd_command	 ;send command to LCD
	  acall delay
	  mov dptr,#my_string3   ;Load DPTR with sring1 Addr
	  acall lcd_sendstring	   ;call text strings sending routine
	  acall delay
	  mov a,#0C3h		  ;Put cursor on second row,3 column
	  acall lcd_command
	  acall delay
	  mov dptr,#my_string2
	  acall lcd_sendstring
      MOV P1,#1FH
	  MOV A,P1
	  MOV B,#10H
	  DIV AB
	  CLR A
	  ADD A,31H
	  ADD A,B
	  MOV 31H,A
      ACALL DELAY_2S
STATE_5:
CLR P1.4
CLR P1.5
CLR P1.6
CLR P1.7
acall delay
acall delay
acall lcd_init  
acall delay
acall delay
acall delay
mov a,#82h		 ;Put cursor on first row,5 column
acall lcd_command	 ;send command to LCD
acall delay
mov dptr,#my_string4   ;Load DPTR with sring1 Addr
acall lcd_sendstring	   ;call text strings sending routine
acall delay
acall conversion_1
acall conversion_2
mov a,#0C1h		  ;Put cursor on second row,3 column
acall lcd_command
acall delay
mov dptr,#my_string5
acall lcd_sendstring
mov a,#0C8h		  ;Put cursor on second row,3 column
acall lcd_command
acall delay
mov dptr,#my_string8
acall lcd_sendstring
mov a,#0C9h		  ;Put cursor on second row,3 column
acall lcd_command
acall delay
mov dptr,#my_string6
acall lcd_sendstring
mov a,#0C6h		  ;Put cursor on second row,3 column
acall lcd_command
acall delay
MOV A,60H
acall lcd_senddata
mov a,#0C7h		  ;Put cursor on second row,3 column
acall lcd_command
acall delay
MOV A,61H
acall lcd_senddata
mov a,#0CEh		  ;Put cursor on second row,3 column
acall lcd_command
acall delay
MOV A,62H
acall lcd_senddata
mov a,#0CFh		  ;Put cursor on second row,3 column
acall lcd_command
acall delay
MOV A,63H
acall lcd_senddata
ACALL DELAY_2S
MOV A,30H
MOV B,31H
MUL AB
MOV 51H,B
MOV 50H,A
ACALL DELAY_2S

STATE_6:
acall delay
acall delay
acall lcd_init  
acall delay
acall delay
acall delay
mov a,#0C1h		  ;Put cursor on second row,3 column
acall lcd_command
acall delay
mov dptr,#my_string5
acall lcd_sendstring
mov a,#0C8h		  ;Put cursor on second row,3 column
acall lcd_command
acall delay
mov dptr,#my_string8
acall lcd_sendstring
mov a,#0C9h		  ;Put cursor on second row,3 column
acall lcd_command
acall delay
mov dptr,#my_string6
acall lcd_sendstring
mov a,#0C6h		  ;Put cursor on second row,3 column
acall lcd_command
acall delay
MOV A,60H
acall lcd_senddata
mov a,#0C7h		  ;Put cursor on second row,3 column
acall lcd_command
acall delay
MOV A,61H
acall lcd_senddata
mov a,#0CEh		  ;Put cursor on second row,3 column
acall lcd_command
acall delay
MOV A,62H
acall lcd_senddata
mov a,#0CFh		  ;Put cursor on second row,3 column
acall lcd_command
acall delay
MOV A,63H
acall lcd_senddata
MOV 30H,50H
MOV 31H,51H
acall conversion_1
acall conversion_2
mov a,#82h		 ;Put cursor on first row,5 column
acall lcd_command	 ;send command to LCD
acall delay
mov dptr,#my_string7  ;Load DPTR with sring1 Addr
acall lcd_sendstring;call text strings sending routine
mov a,#089h		  ;Put cursor on second row,3 column
acall lcd_command
acall delay
MOV A,62H
acall lcd_senddata
mov a,#08Ah		  ;Put cursor on second row,3 column
acall lcd_command
acall delay
MOV A,63H
acall lcd_senddata
mov a,#08Bh		  ;Put cursor on second row,3 column
acall lcd_command
acall delay
MOV A,60H
acall lcd_senddata
mov a,#08Ch		  ;Put cursor on second row,3 column
acall lcd_command
acall delay
MOV A,61H
acall lcd_senddata
acall delay
ACALL DELAY_2S
HERE: SJMP HERE	

ORG 300H

lcd_init:
         mov   LCD_data,#38H  ;Function set: 2 Line, 8-bit, 5x7 dots
         clr   LCD_rs         ;Selected command register
         clr   LCD_rw         ;We are writing in instruction register
         setb  LCD_en         ;Enable H->L
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
delay_250us:
         push 00h
         mov r1, #244
         h1: djnz r1, h1
         pop 00h
         ret
DELAY_10MS:
         push 00h
         mov r6, #40
         h2: acall delay_250us
         djnz r6, h2
         pop 00h
         RET
DELAY_2S:
         push 00h
         MOV R7,#200
         REP:ACALL DELAY_10MS
         DJNZ R7,REP
		 pop 00h
         RET		 
delay:	 push 0
	     push 1
         mov r0,#1
loop2:	 mov r1,#255
	 loop1:	 djnz r1, loop1
	 djnz r0, loop2
	 pop 1
	 pop 0 
	 ret
org 400h
	
conversion_1:
MOV A,30H
MOV B,#10H
DIV AB
MOV R1,A
MOV R2,B
MOV R3,#10
MOV R5,#6
SJMP VRF_A 
VRF_A:
STRT_L_1A:
CLR A
MOV A,R1
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

conversion_2:
MOV A,31H
MOV B,#10H
DIV AB
MOV R1,A
MOV R2,B
MOV R3,#10
MOV R5,#6
SJMP VRF_A_2 
VRF_A_2:
STRT_L_1A_2:
CLR A
MOV A,R1
ADD A,#01H
MOV R1,A
LOOP_1A_2:
MOV A,R1
CJNE A,03H,NEXT_1A_2
LOAD_A_1_2:
CLR A
ADD A,#30H
ADD A,R1
SUBB A,#1
MOV R3,#10
MOV 62H,A
SJMP VRF_B_2
STRT_L_2A_2:
CLR A
MOV A,R1
SUBB A,#10
MOV R4,A
LOOP_2A_2:
MOV A,R4
CJNE A,05H,NEXT_2A_2
LOAD_A_2_2:
CLR A
ADD A,#40H
ADD A,R4
MOV 62H,A
SJMP VRF_B_2
VRF_B_2:
STRT_L_1B_2:
CLR A
MOV A,R2
ADD A,#01H
MOV R2,A
LOOP_1B_2:
MOV A,R2
CJNE A,03H,NEXT_1B_2
LOAD_B_1_2:
CLR A
ADD A,#30H
ADD A,R2
SUBB A,#1
MOV 63H,A
MOV R3,#10
SJMP ending_2
STRT_L_2B_2:
CLR A
MOV A,R2
SUBB A,#10
MOV R4,A
LOOP_2B_2:
MOV A,R4
CJNE A,05H,NEXT_2B_2
LOAD_B_2_2:
CLR A
ADD A,#40H
ADD A,R4
MOV 63H,A
SJMP ending_2
NEXT_1A_2:
DJNZ R3,LOOP_1A_2
MOV R3,#10
SJMP STRT_L_2A_2
NEXT_2A_2:
DJNZ R5,LOOP_2A_2
MOV R5,#6
SJMP ending_2
NEXT_1B_2:
DJNZ R3,LOOP_1B_2
MOV R3,#10
SJMP STRT_L_2B_2
NEXT_2B_2:
DJNZ R5,LOOP_2B_2
MOV R5,#6
SJMP ending_2
ending_2:
ret

my_string1:
         DB   "Enter Inputs", 00H
my_string2:
		 DB   "EE337-2022", 00H
my_string3:
		 DB   "Reading Inputs", 00H
my_string4:
		 DB   "Compute result", 00H
my_string5:
         DB   "Num1:", 00H
my_string6:
         DB   "Num2:", 00H			 
my_string7:
         DB   "Result=", 00H
my_string8:
         DB   ",", 00H


			 
			
end	