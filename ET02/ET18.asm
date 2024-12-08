#18)
#Escreva um programa que leia um número armazenado na primeira posição livre da memória. Após a
#leitura desse número, um registrador qualquer será um flag, isto é, se esse número lido estiver na faixa de
#50 a 100 ou 150 a 200 esse registrador deverá conter um “1”, caso contrário esse registrador deverá conter
#“0”.
#Exemplo:
#leia número;
#se ( 50 <= número <=100 ou 150 <= número <= 200)
#registrador flag = 1;
#caso contrério
#registrador flag = 0;


#inicio:
.text
.globl main
main:
addi $t0, $zero, 0x1001  # t0  = 0x00001001;
sll  $t0, $t0,   16      # t0  = 0x10010000;
lw   $s0, 0($t0)         # x   = 60;
ori  $t1, $zero, 50      # t1 = 50
ori  $t2, $zero, 100      # t2 = 100

slt  $t3, $s0, $t1       # $t3 = ($t0 < 50)? 1 : 0
xori $t3, $t3, 1         # $t3 = ($t0 >= 50)? 1 : 0
slt  $t4, $t2, $s0       # $t4 = ($t0 > 100)? 1 : 0
xori $t4, $t4, 1         # $t4 = ($t0 <= 100)? 1 : 0
and  $t5, $t3, $t4       # $t5 = ($t0 >= 50) && ($t0 <= 100)

ori  $t1, $zero, 150      # t1 = 50
ori  $t2, $zero, 200      # t2 = 100

slt  $t3, $s0, $t1       # $t3 = ($t0 < 150)? 1 : 0
xori $t3, $t3, 1         # $t3 = ($t0 >= 150)? 1 : 0
slt  $t4, $t2, $s0       # $t4 = ($t0 > 200)? 1 : 0
xori $t4, $t4, 1         # $t4 = ($t0 <= 200)? 1 : 0
and  $t6, $t3, $t4       # $t6 = ($t0 >= 150) && ($t0 <= 200)

or   $t7, $t6, $t5       # $t7 = ($t0 >= 150) && ($t0 <= 200) || ($t0 >= 50) && ($t0 <= 100)

sw   $t7, 4($t0)         # flag = $t5


.data
numero:  .word  60
flag:    .word 