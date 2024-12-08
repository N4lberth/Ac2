#6)
#x = -1;
#y = x / 32 ;


#inicio:
.text
.globl main
main:
addi  $s0, $zero, -1   #x  = -1;

#y = x / 32;
sra  $t0, $s0,   5
add  $s1, $zero, $t0