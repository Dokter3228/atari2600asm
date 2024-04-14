 processor 6502
 seg code 
 org $F000 
Start:
 lda #$82
 lda #82
 lda $82

 org $FFFC 
 .word Start
 .word Start 