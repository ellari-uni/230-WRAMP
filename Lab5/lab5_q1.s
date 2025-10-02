.text
.global main

main:
    addi $2, $0, 0x61 # 'a', first letter
    addi $3, $0, 0x7B # 'z'+1, last letter +1 to ensure z is included
    jal loop
    
    addi $2, $0, 0x41 # 'A', first letter
    addi $3, $0, 0x5B # 'Z'+1, last letter +1 to ensure Z is included
    jal loop
    
    syscall

loop:
    lw $5, 0x71003($0) # Get status of serial port
    andi $5, $5, 0x2 # Mask out all but bit 1 (ready to transmit)
    beqz $5, loop # If not ready, wait

    sw $2, 0x71000($0) # Write character to serial port
    addi $2, $2, 1 # increment character
    
    seq $4, $2, $3 # Have we reached the end of the alphabet?
    beqz $4, loop # If not, repeat
    
    jr $ra # Return to main