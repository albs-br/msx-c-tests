// ----------------------------------------------------------
//		msxromapp.c - by Danilo Angelo, 2020
//
//		ROM program(cartridge) for MSX example
//		C version
// ----------------------------------------------------------

#include "msx_fusion.h"
#include "vdp_graph2.h"
#include "vdp_sprites.h"
#include "vdp_circle.h"
#include "sprites.c"

#define  HALT __asm halt __endasm   //wait for the next interrupt


// Generates a pause in the execution of n interruptions.
// PAL: 50=1second. ; NTSC: 60=1second. 
void Wait(int cicles)
{
	int i;
	for (i = 0; i < cicles; i++) HALT;
	return;
}

void main(void)
{
	int i = 255;

	Screen(1);
	//Screen(2);

	SpriteReset();
	Sprite16();
	SpriteSmall();
	SpriteOff();

	// The 16 x 16 pixels Sprite is made of 4 patterns
	SetSpritePattern(0, point_pattern0, 8);
	SetSpritePattern(1, point_pattern1, 8);
	SetSpritePattern(2, point_pattern2, 8);
	SetSpritePattern(3, point_pattern3, 8);

	SetSpritePattern(4, point_pattern4, 8);
	SetSpritePattern(5, point_pattern5, 8);
	SetSpritePattern(6, point_pattern6, 8);
	SetSpritePattern(7, point_pattern7, 8);

	PutSprite(1, 0, 128, 96, 8);
	PutSprite(2, 4, 128, 96, 10);

	SpriteOn();

	for (i = 255; i > 155; --i)
	{
		//SC2Circle(100, 100, i - 120, 15);
	}

	WaitForKey();
	Screen(0);

}


/*
#include <stdbool.h>
#include <stdlib.h>
#include <stdio.h>
#include "targetconfig.h"
#include "MSX/BIOS/msxbios.h"
#include "msx_fusion.h"
#include "vdp_graph2.h"
#include "vdp_sprites.h"
#include "sprites.c"


void main(void) {
	KeySound(0);
	SetColors(15, 1, 1);
	Screen(2);

	SpriteReset();
	Sprite16();
	SpriteSmall();
	SpriteOn();

	// The 16 x 16 pixels Sprite is made of 4 patterns
	SetSpritePattern(0, point_pattern0, 8);
	SetSpritePattern(1, point_pattern1, 8);
	SetSpritePattern(2, point_pattern2, 8);
	SetSpritePattern(3, point_pattern3, 8);

	SetSpritePattern(4, point_pattern4, 8);
	SetSpritePattern(5, point_pattern5, 8);
	SetSpritePattern(6, point_pattern6, 8);
	SetSpritePattern(7, point_pattern7, 8);


	char x;
	char y;
	x = 128;
	y = 50;


	//Cls();

	//SetSpritePattern(char pattern_n, char* p_pattern, char s_size);
	//PutSprite( char sprite_n, char pattern_n, char x, char y, char color);

	//SpriteReset();
	//Sprite16( void );
	//SpriteSmall(void);
	//SpriteOn( void );


	//print("Hello MSX from C!\r\n"
	//	"If you don't want your\r\n"
	//	"ROM program to return to\r\n"
	//	"BASIC/MSX-DOS, just avoid\r\n"
	//	"main's return instruction.\r\n\0");

	char keyPressed;


	while (true) {
	//while (Inkey() != 27) {
		unsigned int lastJiffy;

		while (lastJiffy == Peekw(BIOS_JIFFY)) {
			//keyPressed = GetKeyMatrix(8);
		}

		Beep();

		keyPressed = JoystickRead(0);

		if (keyPressed == 7) {
			x--;
		}
		else if (keyPressed == 3) {
			x++;
		}

		PutSprite(1, 0, x, y, 8);
		PutSprite(2, 4, x, y + 40, 10);

		lastJiffy = Peekw(BIOS_JIFFY);
	}
}
*/