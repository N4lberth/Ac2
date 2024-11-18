# Programa 5
# x = 100000;
# y = 200000;
# z = x + y;


#inicio:
.text
.globl main
main:
addi $t0, $zero, 2400  # t0 = 2400;
addi $s0, $zero, 100   # x = 100;
sll  $s0, $s0,   10    # x = 100 * 2^10 = 102400;
sub  $s0, $s0,   $t0   # x = 102400 - 2400 = 100000;
add  $s1, $s0,   $s0   # y = 2x = 200000;

# z = x + y;
add  $s2, $s0,   $s1   # z = x + y;