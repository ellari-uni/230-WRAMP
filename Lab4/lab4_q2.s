.text
.global main

main:
    jal loop
        
loop:
    jal readswitches
    andi $2, $1, 0xFF
    add $3, $0, $0 # counter
    add $4, $0, $0 # iterations

# Don't need a jump bitcount as it will continue regardless
bitcount:
    andi $6, $2, 1 # GET LSB
    add $3, $3, $6 # Add value of LSB to counter
    srli $2, $2, 1 # Shift right (prepare for next bit)
    addi $4, $4, 1 # Increment iterations
    seqi $5, $4, 8 # Value of  4 == 8 (have done all 8 bits?)
    beqz $5, bitcount # If not, repeat

    add $2, $3, $0 # Once complete, move current count to $2
    jal writessd # Write to SSD
    j loop # Repeat forever
