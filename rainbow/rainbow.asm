	processor 6502

	include "vcs.h"
	include "macro.h"

	seg code
	org $F000

START: 
	CLEAN_START

NextFrame: 
	lda #2   ; %00000010
	sta VBLANK ; turn on VBLANK (37 empty scanlines)
	sta VSYNC ; turn on VSYNC (3 first empty scanlines)

	sta WSYNC ; wait for scanline to finish 
	sta WSYNC
	sta WSYNC

	lda #0
	sta VSYNC ; turn OFF the VSYNC 

	ldx #37
LoopVBlank: 
	sta WSYNC 
	dex
	bne LoopVBlank

	lda #0 
	sta VBLANK

	
	ldx #192
LoopVisible: 
	stx COLUBK  ; set the bg color 
	sta WSYNC ; wait for the next scanline
	dex
	bne LoopVisible 

	lda #2
	sta VBLANK

	ldx #30
LoopOverscan: 
	sta WSYNC 
	dex 
	bne LoopOverscan

	jmp NextFrame

	org $FFFC 
	.word START
	.word START
