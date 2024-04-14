 processor 6502
 seg code 
 org $F000 
Start:
 lda #100

 clc
 adc #5

 sec
 sbc #10

 jmp Start

 org $FFFC 
 .word Start
 .word Start 
