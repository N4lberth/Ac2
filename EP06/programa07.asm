# Programa 7
# Considere a seguinte instru��o iniciando um programa:
# ori $8, $0, 0x01
# Usando apenas instru��es reg-reg l�gicas e/ou instru��es de deslocamento (sll, srl e
# sra), continuar o programa de forma que ao final, tenhamos o seguinte conte�do no
# registrador $8:
# $8 = 0xFFFFFFFF


#inicio:
.text
.globl main
main:
ori $8, $0, 0x01  # $8 = 1;
sll $8, $8, 31    # $8 = 0x10000000;
sra $8, $8, 31    # $8 = 0xFFFFFFFF;