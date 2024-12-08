#8)
#h = k + A [ i ];


#inicio:
.text
.globl main
main:
# $s0 = A[0]
# $s1 = k
# $s2 = i

sll $t0, $s2, 2    #t0  = i*4;
add $t1, $s0, $t0  #*t1 = A[i];
lw  $t2, 0($t0)    #t2  = A[i];
add $s3, $s1, $t2  #h   = k + t2;