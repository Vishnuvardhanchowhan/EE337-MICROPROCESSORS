ORG 0H
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
MOV R3,#200
MOV R4,#0
MOV R5,#0
MOV R7,#0bH
CALL DATE
HERE:SJMP HERE
DATE:
MOV A,R2
SWAP A
MOV P1,A
INC R0
MOV 02H,@R0
CALL delay_10ms
ret
delay_10ms:
push 00h
mov r6, #40
h2: acall delay_250us
djnz r6, h2
pop 00h
SJMP NEXT
ret
NEXT:
DJNZ R3,delay_10ms 
MOV R3,#100
DJNZ R7,VRF1
MOV R2,50H
MOV R0,#50H
MOV R7,#0bH
MOV R4,#0
INC R5
LJMP DATE
ret
delay_250us:
push 00h
mov r1, #244
h1: djnz r1, h1
pop 00h
ret
VRF1:
INC R5
CJNE R5,#8,VRF
MOV R4,#0
MOV R5,#-3
LJMP DATE
VRF:
INC R4
CJNE R4,#2,DATE 
MOV A,#0fH
SWAP A
MOV P1,A
MOV R4,#-1
LJMP delay_10ms
RET
END