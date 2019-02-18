main:
	li $s0, 522
    addi $s1, $zero, 0
    addi $s2, $zero, 0
    li $t0, 2
    j L1
L1:
	beq $s0, $zero, L4
    div $s0, $t0
    mfhi $t1
    mflo $s0
    beq $t1, 0, L2
    beq $t1, 1, L3
L2:
	addi $s1, $s1, 1
    j L1
L3:
	addi $s2, $s2, 1
    j L1
L4:
	jr $ra