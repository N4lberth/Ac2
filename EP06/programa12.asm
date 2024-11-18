# Programa 12
# Considere a seguinte situação:
# int ***x;
# onde x contem um ponteiro para um ponteiro para um ponteiro para um inteiro.
# Nessa situação, considere que a posição inicial de memória contenha o inteiro em questão.
# Coloque todos os outros valores em registradores, use os endereços de memória que quiser dentro
# do espaço de endereçamento do Mips.
# Resumo do problema:
# k = MEM [ MEM [MEM [ x ] ] ].
# Crie um programa que implemente a estrutura de dados acima, leia o valor de K, o multiplique por
# 2 e o reescreva no local correto conhecendo-se apenas o valor de x.


#inicio:
.text
.globl main
main:
addi $t0, $zero, 0x1001  # t0   = 0x00001001;
sll  $t0, $t0,   16      # t0   = 0x10010000;
addi $t1, $t0,   4       # t1   = 0x10010004;
addi $t2, $t0,   8       # t2   = 0x10010008;
addi $t3, $t0,   12      # t3   = 0x10010012;

sw   $t0, 4 ($t0)        # px   = 0x00001001;
sw   $t1, 8 ($t0)        # ppx  = 0x00001001;
sw   $t2, 12($t0)        # pppx = 0x00001001;

lw   $s0, 0 ($t3)        # s0 = t3 = k;
lw   $s1, 0 ($t2)        # s1 = t2 = k;
lw   $s2, 0 ($t1)        # s2 = t1 = k;
lw   $s3, 0 ($t0)        # s4 = t0 = k;

add  $t4, $s3, $s3       # t4 = 2 * k;

sw   $t4, 0($t1)         # x = 2 * k;

.data
x:    .word 10
px:   .word 0
ppx:  .word 0
pppx: .word 0