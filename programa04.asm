# Programa 4
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
sll  $t0, $s0, 4     # t0 = x * 2^4;
sub  $t0, $t0, $s0   # t0 = 15x;

sll  $t1, $s1, 6     # t1 = y * 2^6;
add  $t1, $t1, $s1   # t1 = 65y;
add  $t1, $t1, $s1   # t1 = 66y;
add  $t1, $t1, $s1   # t1 = 67y;

add  $s2, $t0, $t1   # z = t0 + t1;
sll  $s2, $s2, 2     # z = z * 2^2;