.global	count
.text
count:
	subui	$sp, $sp, 5
	sw	$7, 1($sp)
	sw	$12, 2($sp)
	sw	$13, 3($sp)
	sw	$ra, 4($sp)
	lw	$13, 5($sp)
	lw	$12, 6($sp)
	sne	$13, $13, $12
	bnez	$13, L.2
	lw	$13, 5($sp)
	sw	$13, 0($sp)
	jal	writessd
	jal	delay
	j	L.1
L.2:
	lw	$13, 5($sp)
	lw	$12, 6($sp)
	sge	$13, $13, $12
	bnez	$13, L.4
	lw	$7, 5($sp)
	j	L.9
L.6:
	sw	$7, 0($sp)
	jal	writessd
	jal	delay
L.7:
	addi	$7, $7, 1
L.9:
	lw	$13, 6($sp)
	sle	$13, $7, $13
	bnez	$13, L.6
	j	L.5
L.4:
	lw	$7, 5($sp)
	j	L.13
L.10:
	sw	$7, 0($sp)
	jal	writessd
	jal	delay
L.11:
	subi	$7, $7, 1
L.13:
	lw	$13, 6($sp)
	sge	$13, $7, $13
	bnez	$13, L.10
L.5:
L.1:
	lw	$7, 1($sp)
	lw	$12, 2($sp)
	lw	$13, 3($sp)
	lw	$ra, 4($sp)
	addui	$sp, $sp, 5
	jr	$ra
