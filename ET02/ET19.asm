#19)
#Escreva um programa que calcule a mediana de 3 n�meros armazenados na mem�ria. Ap�s encontrar
#essa mediana, escrev�-la na posi��o seguinte aos 3 n�meros.
#Exemplo:
#.data
#A: .word 23
#B: .word 98
#C: .word 17
#Os tr�s n�meros acima ser�o armazenados na mem�ria quando o programa for iniciado.
#A mediana � maior ou igual a um dos inteiros e menor ou igual ao outro.
#No caso acima, a mediana � o n�mero 23
#Um outro caso poss�vel:
#.data
#A: .word 9
#B: .word 98
#C: .word 9
#Nesse caso a mediana � o "9".
#Considere que os n�meros nas posi��es A, B e C podem ser trocados de rodada para rodada do seu
#programa.


#inicio:
.text
.globl main
main: