main:
	addi $s0, $zero, -786
	blt $s0, $zero, L1
	addi $s1, $zero, 0
	j END
L1:
	li $s1, 1
	j END

END:
	jr $ra