#19)
#Escreva um programa que calcule a mediana de 3 números armazenados na memória. Após encontrar
#essa mediana, escrevê-la na posição seguinte aos 3 números.
#Exemplo:
#.data
#A: .word 23
#B: .word 98
#C: .word 17
#Os três números acima serão armazenados na memória quando o programa for iniciado.
#A mediana é maior ou igual a um dos inteiros e menor ou igual ao outro.
#No caso acima, a mediana é o número 23
#Um outro caso possível:
#.data
#A: .word 9
#B: .word 98
#C: .word 9
#Nesse caso a mediana é o "9".
#Considere que os números nas posições A, B e C podem ser trocados de rodada para rodada do seu
#programa.


#inicio:
.text
.globl main
main:
addi $t0, $zero, 0x1001  # t0  = 0x00001001;
sll  $t0, $t0,   16      # t0  = 0x10010000;
lw   $t1, 0($t0)         # A   = 23;
lw   $t2, 4($t0)         # B   = 98;
lw   $t3, 8($t0)         # C   = 17;

slt  $t6, $t1,   $t2     # (t1 < t2) ? 1 : 0
bne  $t6, $zero, prox1   # (t1 < t2) ? 1 : 0
swap1:
sw   $t2, 0($t0)	 # A = B
sw   $t1, 4($t0)	 # B = A
lw   $t1, 0($t0)         # A;
lw   $t2, 4($t0)         # B;
prox1:
slt  $t6, $t2,   $t3     # (t2 < t3) ? 1 : 0
bne  $t6, $zero, prox2   # (t2 < t3) ? 1 : 0
swap2:
sw   $t3, 4($t0)         # B = C
sw   $t2, 8($t0)	 # C = B
lw   $t2, 4($t0)         # B;
lw   $t3, 8($t0)         # C;
prox2:
slt  $t6, $t1,   $t2     # (t1 < t2) ? 1 : 0
bne  $t6, $zero, fim     # (t1 < t2) ? 1 : 0
swap3:
sw   $t2, 0($t0)	 # A = B
sw   $t1, 4($t0)	 # B = A
lw   $t1, 0($t0)         # A;
lw   $t2, 4($t0)         # B;
fim:
sw   $t2, 12($t0)

.data
A: .word 9
B: .word 98
C: .word 9