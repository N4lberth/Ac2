#24)
#Voc� dever� criar duas fun��es nesse exerc�cio. Uma fun��o que receba como argumentos 2 n�meros
#inteiros de 32 bits. Essa fun��o dever� tamb�m retornar um inteiro. O primeiro n�mero recebido como
#par�metro representa um endere�o de mem�ria e o segundo uma quantidade de elementos. A quantidade
#de elementos m�xima � 30, se o numero recebido for superior a 30 sua fun��o dever� usar 30.
#Os dois n�meros acima dever�o estar nas duas primeiras posi��es livres da mem�ria (portanto devem ser
#lidos da mem�ria para serem passados � fun��o).
#Sua fun��o dever� criar um vetor que tem in�cio no endere�o de mem�ria recebido como primeiro
#rgumento e com a quantidade de elementos recebida como o segundo argumento.
#Uma segunda fun��o que receba um n�mero (este n�mero ter� no m�ximo 16 bits) e retorne o seu
#quadrado.
#Cada elemento do vetor y ser� dado como:
#y[i] = 2i 2 +2i+1 se i for par;
#y[i] = i 2 se i for impar.
#O valor retornado ser� a soma de todos os elementos de y[].


.text
.globl main
main:
addi $t0, $zero, 0x1001   # t0 = 0x00001001;
sll  $t0, $t0,   16       # t0 = 0x10010000;
lw  $s0, 0($t0)           # $s0 = n
lw  $s1, 4($t0)      	  # $s1 = &array[0]
or  $a0, $s1, $zero  	  # $a0 = &array[0]
or  $a1, $s0, $zero  	  # $a1 = n
jal create           	 
or  $s2, $v0, $zero  	  # $s2 = &array[0]
j   fim               	  

create:
addi $sp, $sp, -12       # Cria um novo frame
sw   $ra, 4($sp)         # Salva $ra
sw   $s0, 0($sp)         # Salva $s0

ori  $t2, $zero, 30      # $t2 = 30
slt  $t3, $t2, $a1       # if (30 < n)
bne  $t3, $zero, fix     # if(true) ajusta n
j    start

fix:
ori  $a1, $zero, 30      # Ajusta $a1 para 30

start:
ori  $v0, $zero, 0       # soma = 0
ori  $t4, $zero, 0       # i = 0

loop:
beq  $t4, $a1, end       # if (i == n)

andi $t5, $t4, 1         # $t5 = i % 2
bne  $t5, $zero, impar   # if (i % 2 != 0)

par:
sw   $v0, 12($sp)        # Salva soma (v0) na pilha
or   $a3, $t4, $zero     # $a3 = i
jal  square              # Calcula i^2
lw   $t6, 12($sp)        # Restaura soma acumulada da pilha
sll  $t7, $v0, 1         # $t7 = 2 * i^2
sll  $t8, $t4, 1         # $t8 = 2 * i
add  $t7, $t7, $t8       # $t7 = 2 * i^2 + 2*i
addi $t7, $t7, 1         # $t7 = 2 * i^2 + 2*i + 1
sw   $t7, 0($a0)         # array[i] = $t7
add  $t6, $t6, $t7       # soma += array[i]
or   $v0, $t6, $zero     # Atualiza $v0 com a nova soma
j    inc

impar:
sw   $v0, 12($sp)        # Salva soma (v0) na pilha
or   $a3, $t4, $zero     # $a3 = i
jal  square              # i^2
sw   $v0, 0($a0)         # array[i] = i^2
lw   $t6, 12($sp)        # Restaura soma (v0) da pilha
add  $v0, $v0, $t6       # soma += array[i] 
j    inc

inc:
addi $t4, $t4, 1         # i++
addi $a0, $a0, 4         # &array[i] += 4
j    loop                
end:
lw   $ra, 4($sp)         # Restaura $ra
lw   $s0, 0($sp)         # Restaura $s0
addi $sp, $sp, 12        # Restaura o frame anterior
jr   $ra                 

square:
mult $a3, $a3            # x * x
mflo $v0                 # $v0 = x^2
jr   $ra                 
fim: