	processor 6502

	seg code 
	org $F000	; Define the code origin at $F000

Start:
	sei 		; Disable interrupts
	cld		; Disable the BCD decimal math mode
	ldx #$FF	; Load the X register with #$FF
	txs		; Transfer the X register to the (S)tack pointer register

	lda #0
	ldx #$FF

MemLoop: 
	sta $0000,X	; Store A into the address $0000 + X
	dex			; Decrement X
	bne MemLoop	; Branch to MemLoop if Z flag is not set (X not 0)

	org $FFFC
	.word Start	; Reset vector
	.word Start	; IRQ vector (you might want to change this if needed)


