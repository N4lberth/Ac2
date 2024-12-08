#11)
#j = 0;
#i = 10;
#do {
#j = j + 1;
#} while ( j != i )


#inicio:
.text
.globl main
main:
ori  $s0, $zero, 0   #j = 0;
ori  $s1, $zero, 10  #i = 10;
loop:                #do {
addi $s0, $s0, 1     #j = j + 1
bne  $s1, $s0 loop   #} while ( j != i )