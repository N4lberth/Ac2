#10)
#h = A [ i ] ;
#A[ i ] = A [ i + 1] ;
#A [ i + 1] = h ;


#inicio:
.text
.globl main
main:
# s0 = A[0]
# s1 = i

sll $t0, $s1, 2      #t0     = i*4;
add $t1, $s0, $t0    #*t1    = A[i];
lw  $s2, 0($t1)      #h      = A[i];
lw  $t2, 4($t1)      #t2     = A[i+1];
sw  $t2, 0($t1)      #A[i]   = A[i+1];
sw  $s2, 4($t1)      #A[i+1] = h;

