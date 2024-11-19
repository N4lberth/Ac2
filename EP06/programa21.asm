# Programa 21 
# y =  x^3 + 1            se x > 0 
#      x^4 - 1            se x <= 0 
# Os valores de x devem ser lidos da primeira posição livre da memória
# e o valor de y deverá ser escrito na segunda posição livre.


#inicio:
.text
.globl main
main:
addi $t0, $zero, 0x1001  # t0  = 0x00001001;
sll  $t0, $t0,   16      # t0  = 0x10010000;
lw   $s0, 0($t0)         # x   = 2;
addi $t1, $zero, 0       # i   = 0;
addi $t2, $zero, 1       # t2  = 1;
addi $s2, $zero, 1       # s2  = 1;

slt $t4, $zero, $s0      # if ( x > 0 ) { maior }
bne $t4, $zero, maior    # if ( x > 0 ) { maior }
menor:
addi $t3, $zero, 4       # t3  = 4;
loop1:
# x^4 - 1;
mul  $t2, $t2, $s0       # t2 = x^4;
addi $t1, $t1,   1 	 # i++;
bne  $t1, $t3,   loop1   # for 1 = 0; i < t3

sub  $s1, $t2, $s2       # y = x^4 - 1;
j fim

maior:
addi $t3, $zero, 3       # t3  = 3;
loop2:
# x^3 + 1;
mul  $t2, $t2, $s0       # t2 = x^3;
addi $t1, $t1,   1 	 # i++;
bne  $t1, $t3,   loop2   # for 1 = 0; i < t3

addi $s1, $t2, 1         # y = x^3 + 1;
j fim

fim:
sw   $s1, 4($t0)         # memoria

.data
x:  .word  -2