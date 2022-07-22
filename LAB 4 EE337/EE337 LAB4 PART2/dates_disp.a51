ORG 0H
LCD_data equ P2    ;LCD Data port
LCD_rs   equ P0.0  ;LCD Register Select
LCD_rw   equ P0.1  ;LCD Read/Write
LCD_en   equ P0.2  ;LCD Enable
LJMP MAIN
ORG 100H
MAIN:
MOV 50H,#2
MOV 51H,#8
MOV 52H,#0
MOV 53H,#9
MOV 54H,#2
MOV 55H,#0
MOV 56H,#0
MOV 57H,#2
MOV R2,50H
MOV R0,#50H
MOV R4,#0
MOV R5,#0
MOV R7,#0
CALL LCD_INIT
CALL DELAY_1MS
MOV A,#081H
CALL LCD_COMMAND
CALL DELAY_1MS
MOV 30H,50H
CALL HEX_ASCII
MOV A,60H
CALL LCD_SENDDATA

MOV A,#082H
CALL LCD_COMMAND
CALL DELAY_1MS
MOV 30H,51H
CALL HEX_ASCII
MOV A,60H
CALL LCD_SENDDATA

MOV A,#083H
CALL LCD_COMMAND
CALL DELAY_1MS
MOV A,#2DH
CALL LCD_SENDDATA

MOV A,#084H
CALL LCD_COMMAND
CALL DELAY_1MS
MOV 30H,52H
CALL HEX_ASCII
MOV A,60H
CALL LCD_SENDDATA

MOV A,#085H
CALL LCD_COMMAND
CALL DELAY_1MS
MOV 30H,53H
CALL HEX_ASCII
MOV A,60H
CALL LCD_SENDDATA

MOV A,#086H
CALL LCD_COMMAND
CALL DELAY_1MS
MOV A,#2DH
CALL LCD_SENDDATA

MOV A,#087H
CALL LCD_COMMAND
CALL DELAY_1MS
MOV 30H,54H
CALL HEX_ASCII
MOV A,60H
CALL LCD_SENDDATA

MOV A,#088H
CALL LCD_COMMAND
CALL DELAY_1MS
MOV 30H,55H
CALL HEX_ASCII
MOV A,60H
CALL LCD_SENDDATA

MOV A,#089H
CALL LCD_COMMAND
CALL DELAY_1MS
MOV 30H,56H
CALL HEX_ASCII
MOV A,60H
CALL LCD_SENDDATA

MOV A,#08AH
CALL LCD_COMMAND
CALL DELAY_1MS
MOV 30H,57H
CALL HEX_ASCII
MOV A,60H
CALL LCD_SENDDATA


CALL DATE
HERE:SJMP HERE

DATE:
MOV A,R2
SWAP A
MOV P1,A
INC R0
MOV 02H,@R0
NEXT:
call delay_200ms
INC R5
CJNE R5,#8,VRF
MOV R4,#0
MOV R2,50H
MOV R0,#50H
MOV R7,#0
MOV R5,#0
MOV A,#0fH
SWAP A
MOV P1,A
call delay_200ms
LJMP DATE
ret

VRF:
inc r7
cjne r7,#6,jump
MOV R4,#0
ljmp date
jump:
INC R4
CJNE R4,#2,DATE 
MOV A,#0fH
SWAP A
MOV P1,A
MOV R4,#0
call delay_200ms
ljmp date
RET

delay_200ms:
mov r3,#200
rep:
call delay_1ms 
djnz r3,rep
mov r3,#200
ret

delay_1ms:
push 00h
mov r6, #4
h2: acall delay_250us
djnz r6, h2
pop 00h
ret
delay_250us:
push 00h
mov r1, #244
h1: djnz r1, h1
pop 00h
ret

ORG 400H

lcd_init:
         mov   LCD_data,#38H  ;Function set: 2 Line, 8-bit, 5x7 dots
         clr   LCD_rs         ;Selected command register
         clr   LCD_rw         ;We are writing in instruction register
         setb  LCD_en  ;Enable H->L
		 acall delay_1ms
         clr   LCD_en
	     acall delay_1ms

         mov   LCD_data,#0CH  ;Display on, Curson off
         clr   LCD_rs         ;Selected instruction register
         clr   LCD_rw         ;We are writing in instruction register
         setb  LCD_en         ;Enable H->L
		 acall delay_1ms
         clr   LCD_en
         
		 acall delay_1ms
         mov   LCD_data,#01H  ;Clear LCD
         clr   LCD_rs         ;Selected command register
         clr   LCD_rw         ;We are writing in instruction register
         setb  LCD_en         ;Enable H->L
		 acall delay_1ms
         clr   LCD_en
         
		 acall delay_1ms

         mov   LCD_data,#06H  ;Entry mode, auto increment with no shift
         clr   LCD_rs         ;Selected command register
         clr   LCD_rw         ;We are writing in instruction register
         setb  LCD_en         ;Enable H->L
		 acall delay_1ms
         clr   LCD_en

		 acall delay_1ms
         
         ret 

 lcd_command:
         mov   LCD_data,A     ;Move the command to LCD port
         clr   LCD_rs         ;Selected command register
         clr   LCD_rw         ;We are writing in instruction register
         setb  LCD_en         ;Enable H->L
		 acall delay_1ms
         clr   LCD_en
		 acall delay_1ms
    
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
		 acall delay_1ms
         clr   LCD_en
         acall delay_1ms
		 acall delay_1ms
         ret
HEX_ASCII:
MOV R6,30H
MOV A,R6
ANL A,#0FH
MOV R1,A
MOV A,R6
ANL A,#0F0H
SWAP A
MOV R2,A
MOV R6,01H
CALL CONVERSION
MOV 60H,03H
MOV R6,02H
CALL CONVERSION
MOV 61H,03H
RET 

CONVERSION:
N0:
CJNE R6,#00H,N1
MOV R3,#30H
RET
N1:
CJNE R6,#01H,N2
MOV R3,#31H
RET
N2:
CJNE R6,#02H,N3
MOV R3,#32H
RET
N3:
CJNE R6,#03H,N4
MOV R3,#33H
RET
N4:
CJNE R6,#04H,N5
MOV R3,#34H
RET
N5:
CJNE R6,#05H,N6
MOV R3,#35H
RET
N6:
CJNE R6,#06H,N7
MOV R3,#36H
RET
N7:
CJNE R6,#07H,N8
MOV R3,#37H
RET
N8:
CJNE R6,#08H,N9
MOV R3,#38H
RET
N9:
CJNE R6,#09H,N10
MOV R3,#39H
RET
N10:
CJNE R6,#0AH,N11
MOV R3,#41H
RET
N11:
CJNE R6,#0BH,N12
MOV R3,#42H
RET
N12:
CJNE R6,#0CH,N13
MOV R3,#43H
RET
N13:
CJNE R6,#0DH,N14
MOV R3,#44H
RET
N14:
CJNE R6,#0EH,N15
MOV R3,#45H
RET
N15:
MOV R3,#46H
RET


	 
END