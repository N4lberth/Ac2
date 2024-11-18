# Programa 16
# Escreva um programa que avalie a expressão: (x*y)/z.
# Use x = 1600000 (=0x186A00), y = 80000 (=0x13880), e z = 400000 (=0x61A80). Inicializar os
# registradores com os valores acima.


#inicio:
.text
.globl main
main:
addi $s0, $zero, 0x186A  # x = 0x0000186A;
sll  $s0, $s0,   8       # x = 0x00186A00;
addi $s1, $zero, 0x1388  # y = 0x00001388;
sll  $s1, $s1,   4       # y = 0x00013880;
addi $s2, $zero, 0x61A8  # z = 0x000061A8;
sll  $s2, $s2,   4       # z = 0x00061A80;

# ( x * y ) / z;
mul  $t0, $s0,   $s1     # t0 = x * y

mfhi $t0		 # t0 = hi
sll  $t0, $t0,   24	 # t0 = hi
mflo $t1		 # ti = lo
srl  $t1, $t1,   8       # ti = lo
add  $t0, $t0,   $t1     # t0 = hi + lo 

srl  $t2, $s2,   4 	 # t2 = 0x000061A8;

div  $t0, $t2            # t0 = t0 / z

mflo $s3		 # s3 = lo
sll  $s3, $s3,   4	 # s3 = resultado