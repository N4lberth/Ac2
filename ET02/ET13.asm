#13)
#Escreva um programa que leia da memória um valor de Temperatura TEMP. Se TEMP>=30 e TEMP
#<=50 uma variável FLAG, também na memória, deverá receber o valor 1, caso contrário, FLAG deverá
#ser zero.


#inicio:
.text
.globl main
main:
addi $t0, $zero, 0x1001  # t0 = 0x00001001;
sll  $t0, $t0,   16      # t0 = 0x10010000;
lw   $s0, 0($t0)         # s0 = TEMP;
ori  $t1, $zero, 30      # t1 = 30
ori  $t2, $zero, 50      # t2 = 50

slt  $t3, $s0, $t1       # $t3 = ($t0 < 30)? 1 : 0
xori $t3, $t3, 1         # $t3 = ($t0 >= 30)? 1 : 0
slt  $t4, $t2, $s0       # $t4 = ($t0 > 50)? 1 : 0
xori $t4, $t4, 1         # $t4 = ($t0 <= 50)? 1 : 0
and  $t5, $t3, $t4       # $t5 = ($t0 >= 30) && ($t0 <= 50)

sw   $t5, 4($t0)         # FLAG = $t5

.data
TEMP:  .word 20
FLAG:  .word 