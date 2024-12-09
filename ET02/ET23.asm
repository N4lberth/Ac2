#23)
#Escreva um programa que solicite ao usu�rio que digite dois n�meros, seu programa dever� conter uma
#fun��o que receba esses dois n�meros e retorne o primeiro elevado ao segundo. Esse resultado dever� ser
#mostrado na tela. O programa rodar� indefinidamente at� que o primeiro n�mero digitado seja 0 (zero).
#Obs.: Caso voc� n�o tenha visto a utiliza��o de handlers e a leitura de valores pelo teclado, os dois
#n�meros dever�o ser lidos da primeira e segunda posi��o livre da mem�ria. O resultado ser�
#escrito na terceira posi��o livre da mem�ria e o programa ir� executar apenas uma vez.


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