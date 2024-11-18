# Programa 6
# x = o maior inteiro possivel;
# y = 300000;
# z = x - ( 4 * y );


#inicio:
.text
.globl main
main:
addi $s0, $zero, -1     # x = -1;
srl  $s0, $s0,    1     # x = o maior inteiro possivel;
addi $t0, $zero,  7200  # t0 = 7200;
addi $s1, $zero,  300   # y = 300;
sll  $s1, $s1,    10    # y = 300 * 2^10;
sub  $s1, $s1,    $t0   # y = 307200 - 7200;

# z = x - ( 4 * y );
sll  $t0, $s1,    2     # t0 = y * 2^2;
sub  $s2, $s0,    $t0   # z = x - ( 4 * y );