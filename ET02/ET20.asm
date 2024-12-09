#20)
#Escrever um programa que some todos os elementos do vetor e armazene esta soma na primeira
#posição de memória após o vetor. 


#inicio:
.text
.globl main
main:
addi $t0, $zero, 0x1001  # t0 = 0x00001001;
sll  $t0, $t0,   16      # t0 = 0x10010000;
addi $t1, $zero, 100     # t1 = 100;
addi $s0, $zero, 0       # i  = 0;
soma:
lw   $t2, 0($t0)         # t2 = vetor[i];
add  $t3, $t3, $t2       # t3 = t3 + t2;

addi $s0, $s0,   1       # i  = i + 1;
addi $t0, $t0,   4	 # t0 = t0 + 4;
bne  $s0, $t1, soma      # for 1 = 0; i < 100
sw   $t3, 0($t0)         # vetor[i] = t2;

.data 
array: 
.word 45, 12, 78, 3, 89, 32, 50, 67, 90, 15
.word 23, 71, 81, 14, 8, 55, 38, 92, 11, 66
.word 20, 74, 99, 27, 1, 40, 59, 87, 49, 10
.word 34, 61, 70, 28, 6, 77, 98, 18, 46, 63
.word 41, 30, 5, 33, 88, 62, 25, 2, 64, 82
.word 47, 73, 36, 48, 21, 58, 16, 80, 29, 75
.word 43, 22, 85, 13, 4, 31, 93, 24, 53, 42
.word 60, 96, 26, 39, 19, 65, 76, 9, 95, 57
.word 35, 17, 37, 54, 7, 68, 97, 44, 79, 94
.word 56, 72, 83, 84, 86, 52, 69, 51, 91, 100