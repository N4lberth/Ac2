#2)
#x = 3;
#y = x * 4 ;


#inicio:
.text
.globl main
main:
ori $s0, $zero, 3   #x  = 3;
ori $t0, $zero, 4   #t0 = 4;

#y = x * 4 ;
mul $s1, $s0, $t0 