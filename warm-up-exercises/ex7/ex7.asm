 processor 6502
 seg code 
 org $F000 
Start:

 lda #10; Load the A register with the decimal value 10
 sta $80; Store the value from A into memory position $80

 inc $80; Increment the value inside a (zero page) memory position $80
 dec $80; Decrement the value inside a (zero page) memory position $80
  
 jmp Start

 org $FFFC 
 .word Start
 .word Start 
