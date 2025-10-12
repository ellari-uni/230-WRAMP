# Main Entry point for this program
# Reads the switch values from the board
# The lower 8 bits are the start value, the upper 8 bits are the end value
# Calls the count coroutine to output count progress to the seven segment display

.text
.global main

main:
    jal readswitches
    andi $8, $1, 0xFF # mask to get the lower 8 bits
    srli $9, $1, 8    # shift right to get the upper

    subui $sp, $sp, 2 # Create room on stack for variables (2 words)

    sw $9, 1($sp)   # store upper 8 bits (end)
    sw $8, 0($sp)   # store lower 8 bits (start)

    jal count

    addui $sp, $sp, 2 # Revert stack modification

    jr $ra