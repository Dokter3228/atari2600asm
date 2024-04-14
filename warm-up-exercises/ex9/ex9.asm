 processor 6502
 seg code 
 org $F000 
Start:
 lda #1 ; Initialize the A register with the decimal value 1

Loop:
 clc
 adc #1; Increment A
 cmp #10; Compare the value in A with the decimal value 10
 bne Loop ; Branch back to loop if the comparison was not equal (to zero)

 jmp Start

 org $FFFC 
 .word Start
 .word Start 
