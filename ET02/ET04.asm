#4)
#x = 3;
#y = x / 4;


#inicio:
.text
.globl main
main:
ori  $s0, $zero, 3   #x  = 3;

#y = x / 4;
srl  $t0, $s0,   2
add  $s1, $zero, $t0