# Programa 18
# Para a expressão a seguir, escreva um programa que calcule o valor de k:
# k = x^y
# Obs: Você poderá utilizar o exercício anterior.
# O valor de x deve ser lido da primeira posição livre da memória e o valor de y deverá lido da
# segunda posição livre. O valor de k, após calculado, deverá ainda ser escrito na terceira posição livre da memória.
# Dê um valor para x e y (dê valores pequenos !!) e use o MARS para verificar a quantidade de
# instruções conforme o tipo (ULA, Desvios, Mem ou Outras)


#inicio:
.text
.globl main
main:
addi $t0, $zero, 0x1001  # t0 = 0x00001001;
sll  $t0, $t0,   16      # t0 = 0x10010000;
lw   $s0, 0($t0)         # x  = 10;
lw   $s1, 4($t0)         # x  = 5;
addi $t1, $zero, 0       # i  = 0;
addi $s2, $zero, 1	 # k  = 1;

loop:
mul  $s2, $s2,   $s0     # k = x * x;
addi $t1, $t1,   1 	 # i++;
bne  $t1, $s1,   loop    # for 1 = 0; i < y;

sw   $s2, 8($t0)         # k = x * y

.data
x:  .word  2
y:  .word  5