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
lw   $s0, 0($t0)         # x  = 2;
lw   $s1, 4($t0)         # y  = 5;
addi $t1, $zero, 0       # i  = 0;
addi $s2, $zero, 1	 # k  = 1;

loopi:
beq  $s1, $zero, fim     # if (y == 0) {x^0 = 1}
    

addi $t2, $zero, 0       # t2 = 0;
addi $t3, $zero, 0       # t3 = 0;
loopj:
    beq  $t3, $s0, multf # if ( j == x ) { multf }
    add  $t2, $t2, $s2   # t2 = k + k;
    addi $t3, $t3, 1     # j ++;
    j    loopj           # loopi;
multf:
    add  $s2, $zero, $t2 # k = x^y;
    addi $s1, $s1, -1    # y --;
    j    loopi           # loopi;

fim:
    sw   $s2, 8($t0)     # memoria;

.data
x:  .word  2
y:  .word  5
