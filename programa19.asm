# Programa 19
# Escrever um programa que leia dois números da memória, a primeira e segunda posições
# respectivamente (os coloque em $s0 e $s1) e determine a quantidade de bits significantes de cada um.
# Coloque as respostas em $t0 e $t1, a partir desse resultado faça a multiplicação. 
# Caso o número de bits significantes de ambos seja menor do que 32 a resposta deverá estar apenas em $s2, 
# caso contrário a resposta estará em $s2 e $s3 (LO e HI respectivamente).


#inicio:
.text
.globl main
main:
addi $t0, $zero, 0x1001  # t0 = 0x00001001;
sll  $t0, $t0,   16      # t0 = 0x10010000;
lw   $s0, 0($t0)         # s0  = x;
lw   $s1, 4($t0)         # s1  = y;
lw   $t4, 0($t0)         # t4  = x;
lw   $t5, 4($t0)         # t5  = y;
addi $t0, $zero, 0       # i = 0;

significativox:
beq  $t4, $zero, endx    # while x != 0;
srl  $t4, $t4, 1         # conta os bits sgnificativos;
addi $t0, $t0, 1         # i++;
j significativox

endx:
addi $t1, $zero, 0       # j = 0;
significativoy:
beq  $t5, $zero, endy    # while y != 0;
srl  $t5, $t5, 1         # conta os bits sgnificativos;
addi $t1, $t1, 1         # j++;
j significativoy

endy:
mult  $s0, $s1           # s0 * s1;

addi $t2, $zero, 32      # t2 = 32
slt  $t3, $t2, $t0      
beq  $t2, $zero, menor   # Se $t3 == 0, x <= 32
slt  $t3, $t2, $t1      
beq  $t2, $zero, menor   # Se $t3 == 0, x <= 32
mflo $s2                 # s2 = lo
mfhi $s3 		 # s3 = hi 
menor:
mflo $s2                 # s2 = lo

.data
x:  .word  100000
y:  .word  100000