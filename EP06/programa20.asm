# Programa 20 
# y = x^4 + x^3 - 2x^2       se x for par 
#     x^5 – x^3 + 1          se x for impar 
# Os valores de x devem ser lidos da primeira posição livre da memória
# e o valor de y deverá ser escrito na segunda posição livre. 


#inicio:
.text
.globl main
main:
addi $t0, $zero, 0x1001  # t0  = 0x00001001;
sll  $t0, $t0,   16      # t0  = 0x10010000;
lw   $s0, 0($t0)         # x   = 2;
addi $t3, $zero, 1       # t3  = 1;
addi $t4, $zero, 1       # t4  = 1;

andi $t2, $s0, 1         # AND 1 ;
beq  $t2, $zero, par     # if ( A % 2 = 0 ) { par }
impar:
addi $t1, $zero, 0       # i   = 0;
addi $t5, $zero, 5       # t5  = 5;
# x^5 – x^3 + 1;
loop_i1:
mul  $t3, $t3, $s0       # t3 = x^5;
addi $t1, $t1,   1 	 # i++;
bne  $t1, $t5,   loop_i1 # for 1 = 0; i < t5

addi $t5, $zero, 3       # t5  = 3;
addi $t1, $zero, 0       # i   = 0;
loop_i2:
mul  $t4, $t4, $s0       # t4 = x^3;
addi $t1, $t1,   1 	 # i++;
bne  $t1, $t5,   loop_i2 # for 1 = 0; i < t5

sub  $s1, $t3, $t4       # y = x^5 – x^3;
addi $s1, $s1, 1        # y = x^5 – x^3 + 1;
j fim			 # fim

par:
addi $t1, $zero, 0       # i   = 0;
addi $t5, $zero, 4       # t5  = 4;

# x^4 + x^3 - 2x^2;
loop_p1:
mul  $t3, $t3, $s0       # t3 = x^4;
addi $t1, $t1,   1 	 # i++;
bne  $t1, $t5,   loop_p1 # for 1 = 0; i < t5

addi $t5, $zero, 3       # t5  = 3;
addi $t1, $zero, 0       # i   = 0;
loop_p2:
mul  $t4, $t4, $s0       # t4 = x^3;
addi $t1, $t1,   1 	 # i++;
bne  $t1, $t5,   loop_p2 # for 1 = 0; i < t5

add  $s1, $t3, $t4       # y = x^4 + x^3;
mul  $t3, $s0, $s0       # x^2;
add  $t3, $t3, $t3       # 2x^2;
sub  $s1, $s1, $t3       # y = x^4 + x^3 - 2x^2;
j fim			 # fim

fim:
sw   $s1, 4($t0)         # memoria

.data
x:  .word  2