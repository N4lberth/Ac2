# Programa 14:
# Escreva um programa que leia um valor A da mem�ria, identifique se o n�mero � par ou n�o.
# Um valor dever� ser escrito na segunda posi��o livre da mem�ria (0 para par e 1 para �mpar)


#inicio:
.text
.globl main
main:
addi $t0, $zero, 0x1001  # t0 = 0x00001001;
sll  $t0, $t0,   16      # t0 = 0x10010000;
lw   $s0, 0($t0)         # s0 = A;

andi $t1, $s0, 1         # AND 1 
beq  $t1, $zero, par     # if ( A % 2 = 0 ) { par }
sw   $t1, 4($t0)	 # else { 0x10010004 = 1 }
j    fim		 # fim

par:			 # par
sw   $t1, 4($t0)	 # 0x10010004 = 0

fim:

.data
A:  .word 15
