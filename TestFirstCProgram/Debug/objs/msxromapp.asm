;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.0 #12072 (MINGW64)
;--------------------------------------------------------
	.module msxromapp
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _Wait
	.globl _SetSpritePattern
	.globl _PutSprite
	.globl _SpriteReset
	.globl _SpriteOn
	.globl _SpriteOff
	.globl _SpriteSmall
	.globl _Sprite16
	.globl _WaitKey
	.globl _Screen
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;msxromapp.c:19: void Wait(int cicles)
;	---------------------------------
; Function Wait
; ---------------------------------
_Wait::
;msxromapp.c:22: for (i = 0; i < cicles; i++) HALT;
	ld	bc, #0x0000
00103$:
	ld	hl, #2
	add	hl, sp
	ld	a, c
	sub	a, (hl)
	ld	a, b
	inc	hl
	sbc	a, (hl)
	jp	PO, 00118$
	xor	a, #0x80
00118$:
	ret	P
	halt	
	inc	bc
;msxromapp.c:23: return;
;msxromapp.c:24: }
	jr	00103$
_Done_Version:
	.ascii "Made with FUSION-C 1.2 (ebsoft)"
	.db 0x00
_point_pattern0:
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
_point_pattern1:
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
_point_pattern2:
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
_point_pattern3:
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xff	; 255
_point_pattern4:
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x15	; 21
	.db #0x55	; 85	'U'
	.db #0x5f	; 95
_point_pattern5:
	.db #0xa0	; 160
	.db #0xa0	; 160
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x3f	; 63
_point_pattern6:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xa0	; 160
	.db #0x20	; 32
_point_pattern7:
	.db #0x20	; 32
	.db #0x60	; 96
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
;msxromapp.c:26: void main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main::
;msxromapp.c:30: Screen(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_Screen
	inc	sp
;msxromapp.c:33: SpriteReset();
	call	_SpriteReset
;msxromapp.c:34: Sprite16();
	call	_Sprite16
;msxromapp.c:35: SpriteSmall();
	call	_SpriteSmall
;msxromapp.c:36: SpriteOff();
	call	_SpriteOff
;msxromapp.c:39: SetSpritePattern(0, point_pattern0, 8);
	ld	a, #0x08
	push	af
	inc	sp
	ld	hl, #_point_pattern0
	push	hl
	xor	a, a
	push	af
	inc	sp
	call	_SetSpritePattern
	pop	af
;msxromapp.c:40: SetSpritePattern(1, point_pattern1, 8);
	ld	h,#0x08
	ex	(sp),hl
	inc	sp
	ld	hl, #_point_pattern1
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	call	_SetSpritePattern
	pop	af
;msxromapp.c:41: SetSpritePattern(2, point_pattern2, 8);
	ld	h,#0x08
	ex	(sp),hl
	inc	sp
	ld	hl, #_point_pattern2
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_SetSpritePattern
	pop	af
;msxromapp.c:42: SetSpritePattern(3, point_pattern3, 8);
	ld	h,#0x08
	ex	(sp),hl
	inc	sp
	ld	hl, #_point_pattern3
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	call	_SetSpritePattern
	pop	af
;msxromapp.c:44: SetSpritePattern(4, point_pattern4, 8);
	ld	h,#0x08
	ex	(sp),hl
	inc	sp
	ld	hl, #_point_pattern4
	push	hl
	ld	a, #0x04
	push	af
	inc	sp
	call	_SetSpritePattern
	pop	af
;msxromapp.c:45: SetSpritePattern(5, point_pattern5, 8);
	ld	h,#0x08
	ex	(sp),hl
	inc	sp
	ld	hl, #_point_pattern5
	push	hl
	ld	a, #0x05
	push	af
	inc	sp
	call	_SetSpritePattern
	pop	af
;msxromapp.c:46: SetSpritePattern(6, point_pattern6, 8);
	ld	h,#0x08
	ex	(sp),hl
	inc	sp
	ld	hl, #_point_pattern6
	push	hl
	ld	a, #0x06
	push	af
	inc	sp
	call	_SetSpritePattern
	pop	af
;msxromapp.c:47: SetSpritePattern(7, point_pattern7, 8);
	ld	h,#0x08
	ex	(sp),hl
	inc	sp
	ld	hl, #_point_pattern7
	push	hl
	ld	a, #0x07
	push	af
	inc	sp
	call	_SetSpritePattern
	pop	af
	pop	af
;msxromapp.c:49: PutSprite(1, 0, 128, 96, 8);
	ld	de, #0x0860
	push	de
	ld	a, #0x80
	push	af
	inc	sp
	xor	a, a
	ld	d,a
	ld	e,#0x01
	push	de
	call	_PutSprite
	pop	af
	pop	af
	inc	sp
;msxromapp.c:50: PutSprite(2, 4, 128, 96, 10);
	ld	de, #0x0a60
	push	de
	ld	de, #0x8004
	push	de
	ld	a, #0x02
	push	af
	inc	sp
	call	_PutSprite
	pop	af
	pop	af
	inc	sp
;msxromapp.c:52: SpriteOn();
	call	_SpriteOn
;msxromapp.c:54: for (i = 255; i > 155; --i)
	ld	bc, #0x00ff
00103$:
	dec	bc
	ld	a, #0x9b
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	jp	PO, 00117$
	xor	a, #0x80
00117$:
	jp	M, 00103$
;msxromapp.c:59: WaitForKey();
	call	_WaitKey
;msxromapp.c:60: Screen(0);
	xor	a, a
	push	af
	inc	sp
	call	_Screen
	inc	sp
;msxromapp.c:62: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
