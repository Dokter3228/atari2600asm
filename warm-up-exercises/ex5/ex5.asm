 processor 6502
 seg code 
 org $F000 
Start:

 lda #$A; Load the A register with the hexadecimal value $A
 lda #%1010 ; Load the X register with the binary value %1010

 sta $80 ; Store the value in the A register into (zero page) memory address $80
 stx $81 ; Store the value in the X register into (zero page) memory address $81

 lda #10; Load A with the decimal value 10
 
 clc
 adc $80; Add to A the value inside RAM address $80
 adc $81; Add to A the value inside RAM address $81
  ; A should contain (#10 + $A + %1010) = #30 (or $1E in hexadecimal)
 
 sta $82; Store the value of A into RAM position $82 
 
 jmp Start

 org $FFFC 
 .word Start
 .word Start 
