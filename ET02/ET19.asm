#19)
#Escreva um programa que calcule a mediana de 3 números armazenados na memória. Após encontrar
#essa mediana, escrevê-la na posição seguinte aos 3 números.
#Exemplo:
#.data
#A: .word 23
#B: .word 98
#C: .word 17
#Os três números acima serão armazenados na memória quando o programa for iniciado.
#A mediana é maior ou igual a um dos inteiros e menor ou igual ao outro.
#No caso acima, a mediana é o número 23
#Um outro caso possível:
#.data
#A: .word 9
#B: .word 98
#C: .word 9
#Nesse caso a mediana é o "9".
#Considere que os números nas posições A, B e C podem ser trocados de rodada para rodada do seu
#programa.


#inicio:
.text
.globl main
main: