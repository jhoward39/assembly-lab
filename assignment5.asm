#Joseph Howard Assignment 5
#RAT
# $s0 is MAX
# $s1 is address of MyArray[index] 
# $s2 is index 
# $s3 is total 


.data
	MyArray: .word -7,6,-5,4,-3,2
	iterator: .word 0
	index: .word 0
	MAX: .word 6
	total: .word 0
.text
	lw $s0, MAX
	lw $s2, index
	la $s1, MyArray
	lw $s3, total
	
	li $v0, 1 #print integers


	
whileloop:
	bge $t1, $s0, endwhile #(index<MAX)
	
	lw $t2, 0($s1)
	addi $t3, $zero, 8
	mult $s3, $t3
	mflo $t5  #$t5 holds result of total*8
	
	add $s3, $zero, $t5 #total = total*8
	
	lw $t6, 0($s1) #t6 holds MyArray[index]
	add $s3, $s3, $t6 #total = total + MyArray[index]
	
	addi $s1, $s1, 4 #iterate one element in Myarray
	addi, $s2, $s2, 1 #add 1 to the index
	
	j whileloop
	
endwhile: 

printing:

	add $a0,$zero, $t4 #load total into $a0
	syscall

	
	
