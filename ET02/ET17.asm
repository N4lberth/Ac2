#17)
#Escreva um programa que compute a série de Fibonacci, a série é definida como:
#1, 1, 2, 3, 5, 8, 13, 21, 34, 55, ...
#Cada termo da soma é a soma dos dois termos predecessores.
#Exemplo: o termo 13 é a soma de 5 e 8.
#Escreva o programa que compute os primeiros 100 termos da série. Se não for possível computar estes
#100 termos, identifique a maior quantidade possível suportada pelo emulador.
#Cada termo deverá estar em uma posição da memória. O primeiro termo na primeira posição livre da
#memória.
#int n1=0, n2=1;
#for (i = 0; i < 100; i++) {
#       printf("%d ", n2);  
#       temp = n1 + n2;  
#       n1 = n2;  
#       n2 = temp;         }


#inicio:
.text
.globl main
main:
addi $t0, $zero, 0x1001  # t0  = 0x00001001;
sll  $t0, $t0,   16      # t0  = 0x10010000;
ori  $t1, $zero, 0       # i   = 0;
ori  $s0, $zero, 0       # s0  = 0;
ori  $s1, $zero, 1       # s1  = 1;
ori  $t4, $zero, 100     # t4  = 100;

loop:
sll  $t3, $t1,   2       # t3  = i * 4
add  $t4, $t3,   $t0     # *t3 = array[j]

sw   $s1, 0($t4)         # salva na memoria
add  $t2, $s0,   $s1     # t2  = s1 + s0
add  $s0, $zero, $s1	 # s0  = s1
add  $s1, $zero, $t2	 # s1  = t2

addi $t1, $t1,  1	 # i++

bne  $t1, $t4, loop      # for (i = 0; i < 100; i++)

# Maximo do simulador 45 termos