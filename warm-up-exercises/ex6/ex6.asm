 processor 6502
 seg code 
 org $F000 
Start:

 lda #1; Load the A register with the decimal value 1
 ldx #2; Load the X register with the decimal value 2
 ldy #3; Load the Y register with the decimal value 3
 
 inx ; Increment X
 iny ; Increment Y
 
 clc
 adc #1 ; Increment A
 
 dex; Decrement X
 dey ; Decrement Y
 
 sec
 sbc #1; Decrement A
 
 jmp Start

 org $FFFC 
 .word Start
 .word Start 
