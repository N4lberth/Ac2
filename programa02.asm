# Programa 2
# x = 1;
# y = 5 * x + 15;


#inicio:
.text
.globl main
main:
addi $s0, $zero, 1 # x = 1;

# y = 5 * x + 15;
add  $t0, $t0, $s0 # t0 = X;
add  $t0, $t0, $s0 # t0 = 2X;
add  $t0, $t0, $s0 # t0 = 3X;
add  $t0, $t0, $s0 # t0 = 4X;
add  $t0, $t0, $s0 # t0 = 5X;

addi $s1, $t0, 15  # y = t0 + 15;