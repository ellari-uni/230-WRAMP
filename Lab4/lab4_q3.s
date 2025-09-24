.text
.global main

main:
    jal loop
        
loop:
    jal readswitches
    andi $2, $1, 0xFF
    add $3, $0, $0 # counter
    add $4, $0, $0 # iterations
    la $7, encryption

# Don't need a jump bitcount as it will continue regardless
bitcount:
    andi $6, $2, 1 # GET LSB
    add $3, $3, $6 # Add value of LSB to counter
    srli $2, $2, 1 # Shift right (prepare for next bit)
    addi $4, $4, 1 # Increment iterations
    seqi $5, $4, 8 # Value of  4 == 8 (have done all 8 bits?)
    beqz $5, bitcount # If not, repeat


    add $7, $7, $3 # Get address of encrypted value
    lw $2, 0($7)   # Load encrypted value from table
    jal writessd # Write to SSD
    j loop # Repeat forever


.data
encryption:
    .word 0xA3 # 0 switches selected
    .word 0x70 # 1 switch selected
    .word 0x6B # 2 switches selected
    .word 0x0D # 3 switches selected
    .word 0x49 # 4 switches selected
    .word 0x42 # 5 switches selected
    .word 0x7F # 6 switches selected
    .word 0xB8 # 7 switches selected
    .word 0x51 # 8 switches selected
