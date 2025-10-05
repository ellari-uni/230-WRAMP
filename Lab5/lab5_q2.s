# Receives characters from serial port 1
# If the character is a lowercase letter, it is sent back unchanged
# If the character is not a lowercase letter, it is replaced with '*'

.text
.global main


main:
    j receive_char

receive_char:
    lw $5, 0x70003($0) # Get status from Serial Status Register of serial port 1
    andi $5, $5, 0x1 # Mask out all but bit 0 (ready to receive)
    beqz $5, receive_char # If not ready, wait

    lw $2, 0x70001($0) # Read character from serial port

check_lower:
    slti $4, $2, 0x61 # Is it less than 'a'?
    bnez $4, handle_other 

    sgti $4, $2, 0x7A # Is it greater than 'z'?
    bnez $4, handle_other

    j wait_to_send

handle_other:
    addi $2, $0, 0x2A # Replace the stored input character with '*'
    j wait_to_send


wait_to_send:
    lw $5, 0x70003($0) # Get status from Serial Status Register of serial port 1
    andi $5, $5, 0x2 # Mask out all but bit 1 (ready to transmit)
    beqz $5, wait_to_send # If not ready, wait

    sw $2, 0x70000($0) # Write character to serial port
    j receive_char # wait for the next character