#include <at89c5131.h>
#include "endsem.h"

char S_str[6]= {0,0,0,0,0,0};   //String for Balance Sita
char G_str[6] = {0,0,0,0,0,0};  //String for Balance Gita
char n500_s[3]= {0,0,0};    // STRING FOR 500RS NOTE
char n100_s[3]= {0,0,0};    // STRING FOR 100RS NOTE

char password[5] = {0,0,0,0,0} ;   //PASSWORD ARRAY
	
//Main function

//-------------------------------------------------
void main(void)
{
	unsigned char ch='1';
	unsigned char i=0;
	unsigned int l=0;
	unsigned char g=0;
	unsigned int j=0;
	
	uart_init();            // Please finish this function in endsem.h 
    while (1)
    {
     transmit_string("\n\r*Press A for Account display and W for withdrawing cash*\n");
   ch = receive_char();
			if(ch=='A'){
			  transmit_string("\n\r*PLEASE ENTER YOUR ACCOUNT NUMBER*\n");
				ch = receive_char();
				if(ch=='1'){transmit_string("\n\r*Account holder : Sita*\n");
					transmit_string("\n\r*Account balance :10000*\n");}
				else if(ch=='2'){transmit_string("\n\r*Account holder : Gita*\n");
					transmit_string("\n\r*Account balance :10000*\n");}
				else {
					transmit_string("\n\r*no such account,pleae enter valid details*\n");}
				}
			 else if(ch=='a'){
			  transmit_string("\n\r*PLEASE ENTER YOUR ACCOUNT NUMBER*\n");
				ch = receive_char();
				if(ch=='1'){transmit_string("\n\r*Account holder : Sita*\n");
					transmit_string("\n\r*Account balance :10000*\n");}
				else if(ch=='2'){transmit_string("\n\r*Account holder : Gita*\n");
					transmit_string("\n\r*Account balance :10000*\n");}
				else {
					transmit_string("\n\r*no such account,pleae enter valid details*\n");}
				}
			 
			  else if(ch=='W'){ transmit_string("\n\r*withdraw state, enter your account number*\n");
					ch = receive_char();
					
					if(ch=='1'){transmit_string("\n\r*Account holder : Sita*\n");
					transmit_string("\n\r*Account balance :10000*\n");
						transmit_string("\n\r*Enter amount, in hundreds*\n");
						ch = receive_char();
						for (j=1;j<100;j++){
							int_to_string(j,&i);
							if(i==ch){l=j;
						   break;};		}
				    l=l*100;
            if(l<=10000){
							int_to_string(l,&g);
							transmit_char(g);
						}
						else{transmit_string("\n\r*insufficient funds*\n");}
					}
				else if(ch=='2'){transmit_string("\n\r*Account holder : Gita*\n");
					transmit_string("\n\r*Account balance :10000*\n");
				transmit_string("\n\r*Enter amount, in hundreds*\n");
						ch = receive_char();
						for (j=1;j<100;j++){
							int_to_string(j,&i);
							if(i==ch){l=j;
						   break;};		}
				    l=l*100;
            if(l<=10000){unsigned char g;
							int_to_string(l,&g);
							transmit_char(g);
						}
						else{transmit_string("\n\r*insufficient funds*\n");}}
				else {
					transmit_string("\n\r*no such account,pleae enter valid details*\n");}}
				
				 else if(ch=='w'){ transmit_string("\n\r*withdraw state, enter your account number*\n");
					ch = receive_char();
					
					if(ch=='1'){transmit_string("\n\r*Account holder : Sita*\n");
					transmit_string("\n\r*Account balance :10000*\n");
						transmit_string("\n\r*Enter amount, in hundreds*\n");
						ch = receive_char();
						for (j=1;j<100;j++){
							int_to_string(j,&i);
							if(i==ch){l=j;
						   break;};		}
				    l=l*100;
            if(l<=10000){
							int_to_string(l,&g);
							transmit_char(g);
						}
						else{transmit_string("\n\r*insufficient funds*\n");}
					}
				else if(ch=='2'){transmit_string("\n\r*Account holder : Gita*\n");
					transmit_string("\n\r*Account balance :10000*\n");
				transmit_string("\n\r*Enter amount, in hundreds*\n");
						ch = receive_char();
						for (j=1;j<100;j++){
							int_to_string(j,&i);
							if(i==ch){l=j;
						   break;};		}
				    l=l*100;
            if(l<=10000){unsigned char g;
							int_to_string(l,&g);
							transmit_char(g);
						}
						else{transmit_string("\n\r*insufficient funds*\n");}}
				else {
					transmit_string("\n\r*no such account,pleae enter valid details*\n");}}
					
			}
			}
			
			
      			// YOUR CODE GOES HE


