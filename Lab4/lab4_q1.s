.text
.global main

main:
    jal loop
        
loop:
    jal readswitches
    andi $2, $1, 0xFF
    jal writessd
    j loop