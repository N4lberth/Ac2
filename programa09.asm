# Programa 9
# Considere a memória inicial da seguinte forma:
# .text
# .data
# x1: .word 15
# x2: .word 25
# x3: .word 13
# x4: .word 17
# soma: .word -1
# Escrever um programa que leia todos os números, calcule e substitua o valor da variável soma por este valor.


#inicio:
.text
.globl main
main:
addi $t0, $zero, 0x1001  # t0 = 0x00001001;
sll  $t0, $t0,   16      # t0 = 0x10010000;

lw  $s0, 0 ($t0)         # x1 = 15;
lw  $s1, 4 ($t0)         # x2 = 25;
lw  $s2, 8 ($t0)         # x3 = 13;
lw  $s3, 12($t0)         # x4 = 17;

add $t1, $s0, $s1        # t1 = x1 + x2;
add $t1, $t1, $s2        # t1 = x1 + x2 + x3;
add $s4, $t1, $s3        # s4 =  x1 + x2 + x3 +x4;

sw  $s4, 16($t0)         # soma = s4;

.data 
x1:   .word  15 
x2:   .word  25 
x3:   .word  13 
x4:   .word  17 
soma: .word -1