		.set noreorder
		.set noat

		.text
		.align  2
		.globl  loop
		.ent    loop
	                
loop:	j loop
		addi $1, $1, 1
		addi $2, $2, 1
		nop

		.end loop
		.size loop, .-loop
