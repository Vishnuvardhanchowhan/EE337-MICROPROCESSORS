ORG 0H
LJMP MAIN
ORG 100H
MAIN:
CALL ADD16
HERE: SJMP HERE
ORG 130H
ADD16:
ADDC A,71H
ADDC A,73H
MOV 76H,A
CLR A
ADDC A,70H
ADDC A,72H
MOV 75H,A
CLR A
RLC A
MOV 74H,A
RET
END