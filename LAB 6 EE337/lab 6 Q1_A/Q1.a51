ORG 0H
CALL MAIN
HERE: SJMP HERE
ORG 200H
MAIN:
MOV R1,#10H
MOV R2,#0H
MOV TMOD,#00000001B
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
SETB TR0
LOOP: JNB TF0,LOOP
CLR TR0
CLR TF0
RET
END



	