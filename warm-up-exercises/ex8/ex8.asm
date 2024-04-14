 processor 6502
 seg code 
 org $F000 
Start:
 ldy #10 ; Initialize the Y register with the decimal value 10

Loop:
 tya ; Transfer Y to A
 sta $80,Y ; Store the value in A inside memory position $80+Y
 dey ; Decrement Y
 bpl Loop ; Branch back to "Loop" until we are done

 jmp Start

 org $FFFC 
 .word Start
 .word Start 
