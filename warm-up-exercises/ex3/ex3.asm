 processor 6502
 seg code 
 org $F000 
Start:
 sei 		
 cld		
 ldx #$FF	
 txs

 lda #15; Load the A register with the literal decimal value 15
 tax ; Transfer the value from A to X
 tay ; Transfer the value from A to Y
 txa ; Transfer the value from X to A
 tya ; Transfer the value from Y to A

 ldx #6 ; Load X with the decimal value 6
 txa ; Transfer the value from X to Y 
 tay
 org $FFFC 
 .word Start
 .word Start 
