.data
res:    .space 20                
 
.text
main:
#register for storing result
li $s0,0                         
li $s1,0                         
li $s2,0                        
li $s3,0

#register for storing temp and final carry
li $t8,0                         
li $s4,0

#register with first number in four parts
li $t0,4294967295                
li $t1,2147483648
li $t2,4294967295  
li $t3,2147483648

#register with second number in four parts
li $t4,2147483648                
li $t5,4294967295  
li $t6,2147483648
li $t7,4294967295   
              
la $s5,res				

#first part addition and carry calculation
addu  $s0,$t0,$t4                
sltu  $t8,$s0,$t4                
addu  $t1,$t1,$t8                

#second part addition and carry calculation
addu  $s1,$t1,$t5                
sltu  $t8,$s1,$t5                
addu  $t2,$t2,$t8

#third part addition and carry calculation
addu  $s2,$t2,$t6
sltu  $t8,$s2,$t6                
addu  $t3,$t3,$t8

#final part addition and final carry calculation
addu  $s3,$t3,$t7
sltu  $s4,$s3,$t7


#storing final result in res array
li    $t0,0	                 
sw    $s4,res($t0)               
addi  $t0,$t0,4
sw    $s3,res($t0)
addi  $t0,$t0,4
sw    $s2,res($t0)
addi  $t0,$t0,4
sw    $s1,res($t0)
addi  $t0,$t0,4
sw    $s0,res($t0)


jr $ra  
.end main 