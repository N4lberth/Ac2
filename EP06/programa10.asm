# Programa 10
# Considere o seguinte programa: y = 127x – 65z + 1
# Faça um programa que calcule o valor de y conhecendo os valores de x e z. Os valores de x e z
# estão armazenados na memória e, na posição imediatamente a seguir, o valor de y deverá ser
# escrito, ou seja:
# .data
# x: .word 5
# z: .word 7
# y: .word 0 # esse valor deverá ser sobrescrito após a execução do programa.


#inicio:
.text
.globl main
main:
addi $t0, $zero, 0x1001  # t0 = 0x00001001;
sll  $t0, $t0,   16      # t0 = 0x10010000;

lw   $s0, 0($t0)        # x = 5;
lw   $s2, 4($t0)        # z = 7;

# y = 127x – 65z + 1;
sll  $t1, $s0, 7         # t1 = x * 2^7;
sub  $t1, $t1, $s0       # t1 = 128x - x;
sll  $t2, $s2, 6         # t2 = z * 2^6;
add  $t2, $t2, $s2       # t2 = 64z + z;
sub  $t3, $t2, $t1       # t3 = 127x - 65z;
addi $s1, $t3, 1         # y  = 127x – 65z + 1; 

sw   $s1, 8($t0)         # y  = 127x – 65z + 1; 

.data
x: .word 5
z: .word 7
y: .word 0