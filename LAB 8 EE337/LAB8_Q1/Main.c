#include <at89c5131.h>
#include "lcd.h"				//Header file with LCD interfacing functions
#include "MorseCode.h"	//Header file for Morse Code 

sbit LED=P1^7;

/*
Port P0.7 is used for the audio signal output
*/	
//Main function

void main(void)
{
		
	//Call initialization functions
	P1=0x0F;
	if(P1_0==1){
		lcd_init();
		msdelay(1);
		lcd_cmd(0x81);
		msdelay(1);
		lcd_write_string("A");
		msdelay(1);
	morse_a();
	}
	else if(P1_1==1){
		lcd_init();
		msdelay(1);
		lcd_cmd(0x81);
		msdelay(1);
		lcd_write_string("B");
		msdelay(1);
	morse_b();
	}
	else if(P1_2==1){
		lcd_init();
		msdelay(1);
		lcd_cmd(0x81);
		msdelay(1);
		lcd_write_string("C");
		msdelay(1);
	morse_c();
	}
	else if(P1_3==1){
		lcd_init();
		msdelay(1);
		lcd_cmd(0x81);
		msdelay(1);
		lcd_write_string("D");
		msdelay(1);
	morse_d();
	}
	else {
		lcd_init();
		msdelay(1);
		lcd_cmd(0x81);
		msdelay(1);
		lcd_write_string("E");
		msdelay(1);
	morse_e();
	}
	while(1);
}
