#1)
#a = 10;
#b = -1;
#a = a + 1;
#c = a + b;


#inicio:
.text
.globl main
main:
ori  $s0, $zero, 10   #a = 10;
addi $s1, $zero, -1   #b = -1;

#a = a + 1;
addi $s0, $s0,    1

#c = a + b;
add  $s2, $s0,   $s1