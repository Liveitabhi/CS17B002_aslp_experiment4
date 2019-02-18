        .data
first_arr:    .space 20            
size1:  .word  5             
second_arr:    .space 20
size2:  .word  5
   
        .text
main:   
        lb   $s0,size1                          #size of first array
        lb   $s1,size2                          #size of second array
        la   $s2,first_arr                      #address of first array
        la   $s3,second_arr                      #address of second array
        move $s4,$s2                            #copy address of first array
        move $s5,$s3                            #copy address of second array
        li   $t0,0                              #initialising counter1
        li   $t1,0                              #initialising counter2
        li   $t2,'x'                              #initialising initialiser for first array
        li   $t3,'s'                              #initialising initialiser for second array

arrayInitialisation: 
        beq  $t0,$s0,arraySwap                         #end loop if counter is equal to array size
        sb   $s2,($s2)                          
        sb   $t2,0($s2)                         #storing the value at first array's current index 
        sb   $s3,($s3)       
        sb   $t3,0($s3)                         #storing the value at second array's current index
        addi $t2,$t2,6                          #incrementing the initialiser for first array
        addi $t3,$t3,7                          #incrementing the initialiser for second array
        addi $s2,$s2,1                          #incrementing the register to access the value at next index of first array
        addi $s3,$s3,1                          #incrementing the register to access the value at next index of second array
        addi $t0,$t0,1                          #incrementing counter
        b arrayInitialisation                                    #continuing loop

arraySwap:   
        beq  $t1,$s0,EnD                        #end loop if counter is equal to array size
        lb $t4,0($s4)                           #loading current element of first array in temporary register
        sb $s5,0($s4)                           #storing current element of second array in first array
        lb $t5,0($s5)                           #loading current element of second array in temporary register
        sb $t4,0($s5)                           #storing current element of first array in second array
        addi $s4,$s4,1                          #incrementing the register to access the value at next index of first array
        addi $s5,$s5,1                          #incrementing the register to access the value at next index of second array
        addi $t1,$t1,1                          #incrementing counter
        b arraySwap                             #continuing loop


EnD:
        jr $ra                                  #jump to return address