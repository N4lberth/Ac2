# Programa 18
# Para a express�o a seguir, escreva um programa que calcule o valor de k:
# k = x^y
# Obs: Voc� poder� utilizar o exerc�cio anterior.
# O valor de x deve ser lido da primeira posi��o livre da mem�ria e o valor de y dever� lido da
# segunda posi��o livre. O valor de k, ap�s calculado, dever� ainda ser escrito na terceira posi��o livre da mem�ria.
# D� um valor para x e y (d� valores pequenos !!) e use o MARS para verificar a quantidade de
# instru��es conforme o tipo (ULA, Desvios, Mem ou Outras)


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