#3)
#x = 3;
#y = x * 1025;


#inicio:
.text
.globl main
main:
ori $s0, $zero, 3     #x  = 3;
ori $t0, $zero, 1025  #t0 = 1025

#y = x * 1025;
mul $s1, $s0, $t0 