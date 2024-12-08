# Programa 13:
# Escreva um programa que leia um valor A da memória, identifique se o número é negativo ou
# não e encontre o seu módulo. O valor deverá ser reescrito sobre A.


#inicio:
.text
.globl main
main:
addi $t0, $zero, 0x1001  # t0 = 0x00001001;
sll  $t0, $t0,   16      # t0 = 0x10010000;
lw   $s0, 0($t0)         # s0 = A;

slt $t1, $zero, $s0      # if ( A > 0 ) { fim }
bne $t1, $zero, fim      # if ( A > 0 ) { fim }
sub $s0, $zero, $s0      # else { A  = |A| }
sw  $s0, 0($t0)          # else { A  = |A| }
fim:

.data
A:  .word -1
