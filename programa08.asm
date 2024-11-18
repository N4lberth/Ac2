# Programa 8 
# Inicialmente escreva um programa que faça: 
# $8 = 0x12345678. 
# A partir do registrador $8 acima, usando apenas instruções lógicas (or, ori, and, andi, 
# xor, xori) e instruções de deslocamento (sll, srl e sra), você deverá obter os seguintes 
# valores nos respectivos registradores: 
# $9 = 0x12 
# $10 = 0x34 
# $11 = 0x56 
# $12 = 0x78 


#inicio:
.text
.globl main
main:
ori  $8,  $0,  0x1234  # $8  = 0x00001234
sll  $8,  $8,  16      # $8  = 0x12340000
ori  $8,  $8,  0x5678  # $8  = 0x12345678

srl  $9,  $8,  24      # $9  = 0x00000012

srl  $10, $8,  16      # $10 = 0x00001234
andi $10, $10, 0xff    # $10 = 0x00000034

srl  $11, $8,  8       # $11 = 0x00123456
andi $11, $11, 0xff    # $11 = 0x00000056

andi $12, $8,  0xff    # $12 = 0x00000056

