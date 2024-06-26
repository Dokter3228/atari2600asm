	processor 6502

	include "vcs.h"
	include "macro.h"

	seg code
	org $F000

RESET: 
	CLEAN_START

	ldx #$80
	stx COLUBK

	lda #$1C
	sta COLUPF


StartFrame: 
	lda #02 
	sta VBLANK
	sta VSYNC	

	REPEAT 3 ; DASM hack 
		sta WSYNC ; 3 scanlines 
	REPEND
	lda #0
	sta VSYNC

	REPEAT 30
		sta WSYNC
	REPEND
	sta VBLANK

	
	ldx #%00000001
	stx CTRLPF

	ldx #0
	stx PF0
	stx PF1
	STX PF2
	REPEAT 7
		sta WSYNC
	REPEND


	ldx #%11111111
	stx PF0
	stx PF1
	stx PF2
	REPEAT 7
		sta WSYNC
	REPEND

	ldx #%00110000
	stx PF0
	ldx #0
	stx PF1
	ldx #%10000000
	stx PF2
	REPEAT 164
		sta WSYNC
	REPEND

	ldx #%11111111
	stx PF0
	stx PF1
	stx PF2
	REPEAT 7
		sta WSYNC
	REPEND

	lda #2 
	sta VBLANK
	REPEAT 30
		sta WSYNC
	REPEND
	lda #0 
	sta VBLANK

	jmp StartFrame

	org $FFFC
	.word RESET
	.word RESET

