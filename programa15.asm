# Programa 15:
# Escrever um programa que crie um vetor de 100 elementos na memória onde vetor[i] = 2*i + 1.
# Após a última posição do vetor criado, escrever a soma de todos os valores armazenados do vetor.
# Use o MARS para verificar a quantidade de instruções conforme o tipo (ULA, Desvios, Mem ou Outras)


#inicio:
.text
.globl main
main:
addi $t0, $zero, 0x1001  # t0 = 0x00001001;
sll  $t0, $t0,   16      # t0 = 0x10010000;
addi $t1, $zero, 100     # t1 = 100;
addi $s0, $zero, 0       # i  = 0;

loop:
# 2 * i + 1;
add  $t2, $s0,   $s0     # t2 = 2 * i;			
addi $t2, $t2,   1       # t2 = 2 * i + 1;
sw   $t2, 0($t0)         # vetor[i] = t2;

addi $s0, $s0,   1       # i  = i + 1;
addi $t0, $t0,   4	 # t0 = t0 + 4;
bne  $s0, $t1, loop      # for 1 = 0; i < 100

addi $t0, $zero, 0x1001  # t0 = 0x00001001;
sll  $t0, $t0,   16      # t0 = 0x10010000;
addi $s0, $zero, 0       # i  = 0;
soma:
lw   $t2, 0($t0)         # t2 = vetor[i];
add  $t3, $t3, $t2       # t3 = t3 + t2;

addi $s0, $s0,   1       # i  = i + 1;
addi $t0, $t0,   4	 # t0 = t0 + 4;
bne  $s0, $t1, soma      # for 1 = 0; i < 100
sw   $t3, 0($t0)         # vetor[i] = t2;