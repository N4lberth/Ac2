#9)
#A [ j ] = h + A [ i ];


#inicio:
.text
.globl main
main:
# s0 = A[0]
# s1 = h
# s2 = i
# s3 = j

sll $t0, $s2, 2    #t0   = i*4;
sll $t1, $s3, 2    #t1   = j*4;
add $t2, $s0, $t0  #*t2  = A[i];
add $t3, $s0, $t0  #*t3  = A[j];
lw  $t4, 0($t2)    #t4   = A[i];
add $t5, $s1, $t4  #t5   = h + A[i];
sw  $t5, 0($t3)    #A[j] = t5;