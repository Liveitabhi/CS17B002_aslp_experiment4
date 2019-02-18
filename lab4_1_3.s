main:
	li $s0, 5229					#number to be checked
	addi $s1, $zero, 0				#zero counter
	addi $s2, $zero, 0				#one counter
	addi $t0, $zero, 2				#divisor
	div $s0, $t0					#divide operation
	beq $s0, $zero, L5				#end if number is zero
	mfhi $t1						#storing remainder
	mflo $s0						#storing quotient in the original number
	beq $t1, $zero, L2				#jump if remainder is zero
	bne $t1, $zero, L3				#jump if remainder is not zero i.e. one

L1:
	div $s0, $t0					#divide operation
	beq $s0, $zero, L5				#end if number is zero
	mfhi $t2						#storing remainder
	mflo $s0						#storing quotient in the original number
	beq $t1, $t2, L1				#current bit is same as previous one
	bne $t1, $t2, L4				#current bit is different from previous one

L2:
	addi $s1, $s1, 1				#increment zero counter
	li $t1, 0						#change previous bit from 1 to 0
	j L1							#jump to main loop
L3:
	addi $s2, $s2, 1				#increment one counter
	li $t1, 1						#change previous bit from 0 to 1
	j L1							#jump to main loop
L4:
	beq $t2, $zero, L2				#jump if remainder is zero
	bne $t2, $zero, L3				#jump if remainder is one

L5:
	jr $ra 							#jump to return address