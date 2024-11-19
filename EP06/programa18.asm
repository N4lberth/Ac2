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
