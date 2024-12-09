#23)
#Escreva um programa que solicite ao usuário que digite dois números, seu programa deverá conter uma
#função que receba esses dois números e retorne o primeiro elevado ao segundo. Esse resultado deverá ser
#mostrado na tela. O programa rodará indefinidamente até que o primeiro número digitado seja 0 (zero).
#Obs.: Caso você não tenha visto a utilização de handlers e a leitura de valores pelo teclado, os dois
#números deverão ser lidos da primeira e segunda posição livre da memória. O resultado será
#escrito na terceira posição livre da memória e o programa irá executar apenas uma vez.


#inicio:
.text
.globl main
main:
addi $t0, $zero, 0x1001   # t0 = 0x00001001;
sll  $t0, $t0,   16       # t0 = 0x10010000;
lw  $s0, 0($t0)           # $s0 = x
lw  $s1, 4($t0)           # $s1 = y
or  $a0, $s0, $zero       # $a0 = x
or  $a1, $s1, $zero       # $a1 = y
jal pow
sw  $v0, 8($t0)           # Salva o resultado em k
j fim
    
pow:
ori $v0, $zero, 1         # $v0 = k = 1 
or  $t1, $zero, $a1       # $t1 = y 
f:
beq $t1, $zero, end       # if ( y == 0 )
ori $t2, $zero, 0         # x = 0 
or  $t3, $zero, $v0       # $t3 = k 
multi:
add  $t2, $t2, $a0        # $t2 = $t2 + x
addi $t3, $t3, -1         # $t3 = $t3 - 1
bne  $t3, $zero, multi    # if( $t3 != 0 )
or  $v0, $t2, $zero       # $v0 = $t2 
addi $t1, $t1, -1         # y = y - 1
j f                       # f
end:
jr $ra
fim: