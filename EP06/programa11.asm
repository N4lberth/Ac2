# Programa 11
# Considere o seguinte programa: y = x – z + 300000
# Faça um programa que calcule o valor de y conhecendo os valores de x e z. Os valores de x e z
# estão armazenados na memória e, na posição imediatamente a seguir, o valor de y deverá ser escrito, ou seja:
# .data
# x: .word 100000
# z: .word 200000
# y: .word 0 # esse valor deverá ser sobrescrito após a execução do programa.


#inicio:
.text
.globl main
main:
addi $t0, $zero, 0x1001  # t0 = 0x00001001;
sll  $t0, $t0,   16      # t0 = 0x10010000;

lw   $s0, 0($t0)         # x  = 100000;
lw   $s2, 4($t0)         # z  = 200000;

ori  $t1, $zero, 37500   # t1 = 37500;
sll  $t1, $t1,   3       # t1 = 37500 * 2^3 = 300000;

# y = x – z + 300000;
sub  $t2, $s0, $s2       # t2 = x - z;
add  $s1, $t2, $t1       # y  = t2 + t1;

sw   $s1, 8($t0)         # y  = x – z + 300000;

.data
x: .word 100000
z: .word 200000
y: .word 0 
