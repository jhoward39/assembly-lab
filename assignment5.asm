#Joseph Howard Assignment 5
#RAT
# $s0 is MAX
# $t0 is address of MyArray[index]
# $t1 is index
# $t4 is total


.data
	MyArray: .word -7,6,-5,4,-3,2
	iterator: .word 0
	index: .word 0
	MAX: .word 6
	total: .word 0
.text
	lw $s0, MAX
	lw $t1, index
	la $t0, MyArray
	lw $t4, total
	
	li $v0, 1 #print integers


	
whileloop:
	bge $t1, $s0, endwhile #(index<MAX)
	
	lw $t2, 0($t0)
	addi $t3, $zero, 8
	mult $t4, $t3
	mflo $t5  #$t5 holds result of total*8
	
	add $t4, $zero, $t5 #total = total*8
	
	lw $t6, 0($t0) #t6 holds MyArray[index]
	add $t4, $t4, $t6 #total = total + MyArray[index]
	
	addi $t0, $t0, 4 #iterate one element in Myarray
	addi, $t1, $t1, 1 #add 1 to the index
	
	j whileloop
	
endwhile: 

printing:

	add $a0,$zero, $t4 #load total into $a0
	syscall

	
	
