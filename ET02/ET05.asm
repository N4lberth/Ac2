#5)
#x = 305419896;


#inicio:
.text
.globl main
main:
ori  $s0,  $0,   0x1234  # x  = 0x00001234
sll  $s0,  $s0,  16      # x  = 0x12340000
ori  $s0,  $s0,  0x5678  # x  = 0x12345678