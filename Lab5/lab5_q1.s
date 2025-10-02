.text
.global main

main:
    addi $2, $0, 0x61
    addi $3, $0, 0x7A
    jal loop
    addi $2, $0, 0x41
    addi $3, $0, 0x5A
    jal loop
    syscall

loop:
    sw $2, 0x710000($0)
    addi $2, $2, 1
    beq $2, $3, $ra
    j loop

