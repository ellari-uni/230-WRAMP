.text
.global main

main:
    jal readswitches
    andi $8, $1, 0xFF # mask to get the lower 8 bits
    srli $9, $1, 8    # shift right to get the upper

    subui $sp, $sp, 2
    sw $9, 1($sp)   # store upper 8 bits (end)
    sw $8, 0($sp)   # store lower 8 bits (start)

    jal count

    addui $sp, $sp, 2
    syscall