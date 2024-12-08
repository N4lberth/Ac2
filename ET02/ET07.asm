#7)
#A [ 12 ] = h + A [ 8 ];


#inicio:
.text
.globl main
main:
# $s0 = A[0]
# $s1 = h

lw   $t0, 32($s0)   # $t0   = A[8]
add  $t1, $s1, $t0  # $t1   = h + A[8]
sw   $t1, 48($s0)   # A[12] = $t2