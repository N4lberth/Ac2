# Programa 3
# x = 3;
# y = 4;
# z = ( 15 * x + 67 * y ) * 4;


#inicio:
.text
.globl main
main:
addi $s0, $zero, 3   # x = 3;
addi $s1, $zero, 4   # y = 4;

# z = ( 15 * x + 67 * y ) * 4;
add  $t0, $t0, $s0   # t0 = x;
add  $t0, $t0, $t0   # t0 = 2x;
add  $t0, $t0, $t0   # t0 = 4x;
add  $t0, $t0, $s0   # t0 = 5x;
add  $t1, $t0, $t0   # t0 = 10x;
add  $t0, $t1, $t0   # t0 = 15x;

add  $t1, $zero, $s1 # t1 = y;
add  $t1, $t1, $t1   # t1 = 2y;
add  $t1, $t1, $t1   # t1 = 4y;
add  $t1, $t1, $t1   # t1 = 8y;
add  $t1, $t1, $t1   # t1 = 16y;
add  $t1, $t1, $t1   # t1 = 32y;
add  $t1, $t1, $t1   # t1 = 64y;
add  $t1, $t1, $s1   # t1 = 65y;
add  $t1, $t1, $s1   # t1 = 66y;
add  $t1, $t1, $s1   # t1 = 67y;

add  $t2, $t0, $t1   # t2 = 15x + 67y;
add  $t2, $t2, $t2   # t2 = 2 * t2;
add  $s2, $t2, $t2   # z  = 4 * t2;