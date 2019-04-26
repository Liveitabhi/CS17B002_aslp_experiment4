.data

a: .word 1, 2, 3, 4, 5			#array 1
b1: .word 6, 7, 8, 9, 1			#array 2
size : .word 5


.text

main :

la $s0, a 					#address of first array
la $s1, b1 					#address of second array
li $t0, 0 					#counter initialisation
li $t1, 5 					#counter end value

swap :						#swapping loop

beq $t0, $t1, end 			#loop end condition
lw $s2, 0($s0) 				#load element of first array
lw $s3, 0($s1)				#load element of second array
sw $s3, 0($s1)				#store element in first array
sw $s2, 0($s0)				#store element in second array
addi $s0, $s0, 4			#next element address of first array
addi $s1, $s1, 4			#next element address of second array
addi $t0, $t0, 1
j swap

end :
jr $ra