#22)
#Escreva uma fun��o que receba como argumentos 2 n�meros inteiros de 32 bits. Essa fun��o dever�
#tamb�m retornar um inteiro.
#O primeiro n�mero recebido como par�metro representa um endere�o de mem�ria e o segundo uma
#quantidade de elementos. Sua fun��o dever� criar um vetor que tem in�cio nesse endere�o de mem�ria
#(primeiro argumento) e a quantidade de elementos desse vetor dadas pelo segundo argumento.
#Cada elemento do vetor � um elemento da s�rie:
#y[i] = 2i � 1 se i for par;
#y[i] = i se i for impar.
#O valor retornado ser� a soma de todos os elementos de y[]


#inicio:
.text
.globl main
main:
addi $t0, $zero, 0x1001   # t0 = 0x00001001;
sll  $t0, $t0,   16       # t0 = 0x10010000;
jal  criar_vetor          # Chama a fun��o


criar_vetor:
addi $sp, $sp, -8         # Reserva espa�o na pilha
sw   $ra, 4($sp)          # Salva $ra
sw   $a0, 0($sp)          # Salva $a0 (endere�o base)

ori  $t5, $zero, 0        # i = 0
ori  $v0, $zero, 0        # Soma = 0

loop:
slt  $at, $t5, $a1        # if( i < quantidade)
beq  $at, $zero, end_loop # if( i < quantidade)

# Calcula y[i]
andi $t1, $t5, 1          # if(t1 = i % 2)
beq  $t1, $zero, even     # if(t1 = i % 2)

odd:
add $t2, $zero, $t5       # y[i] = i 
j store_and_sum

even:
sll  $t2, $t5, 1          # y[i] = 2 * i
addi $t2, $t2, -1         # y[i] = 2 * i - 1

store_and_sum:
ori  $t6, $zero, 4        # t6 = 4
mul  $t3, $t5, $t6        # Deslocamento = 4 * i
add  $t4, $a0, $t3        # Endere�o = base + deslocamento
sw   $t2, 0($t4)          # Armazena y[i] na mem�ria

add  $v0, $v0, $t2        # Soma acumulada += y[i]
addi $t5, $t5, 1          # Incrementa i
j loop

end_loop:
lw   $ra, 4($sp)          # Restaura $ra
lw   $a0, 0($sp)          # Restaura $a0
addi $sp, $sp, 8          # Libera espa�o na pilha
jr   $ra                  # Retorna ao chamador