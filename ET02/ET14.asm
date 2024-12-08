#14)
#Considere que a partir da primeira posição livre da memória temos um vetor com 100 elementos.
#Escrever um programa que ordene esse vetor de acordo com o algoritmo da bolha. Faça o teste colocando
#um vetor totalmente desordenado e verifique se o algoritmo funciona.
#void bolha(int *array, int n){
#    int i, j;
#    for (i = (n-1); i > 0; i--) {
#      for (j = 0; j < (n-1); j++) {
#         if (array[j] > array[j + 1]) {
#            swap(&array[j], &array[j + 1]); }}}}

#inicio:
.text
.globl main
main:
addi $t0, $zero, 0x1001  # t0  = 0x00001001;
sll  $t0, $t0,   16      # t0  = 0x10010000;

ori  $s0, $zero, 99      # i   = n - 1
ori  $s1, $zero, 0       # j   = 0
ori  $s2, $zero, 100     # n   = 100
ori  $t6, $zero, 1       # t6  = 1
sub  $t1, $s2,   $t6     # t1  = n - 1


loop0:
loop1:
sll  $t2, $s1, 2         # t2  = j * 4
add  $t2, $t2, $t0       # *t2 = array[j]
lw   $t3, 0($t2)         # t3  = array[j]
lw   $t4, 4($t2)         # t3  = array[j + 1]

slt  $t5, $t3, $t4       #(array[j] > array[j + 1]) ? 1 : 0
bne  $t5, $zero, else    #(array[j] > array[j + 1]) ? 1 : 
swap:
sw   $t4, 0($t2)         # array[j]    = t4
sw   $t3, 4($t2)         # array[j+1]  = t3

else:
addi $s1, $s1,   1       # j++
bne  $s1, $t1,   loop1   # for (j = 0; j < (n-1); j++)
sub  $s0, $s0,   $t6     # i--
ori  $s1, $zero, 0       # j   = 0
bne  $s0, $zero, loop0   # for (i = (n-1); i > 0; i--)
fim:

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

