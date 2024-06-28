		lw		0		1		five
		lw		0		2		two
		lw		0		3		neg1
loop	beq		1		2		end
		add		1		3		1
		beq		0		0		loop
end		noop
		add		0		1		4
		lw		0		1		seven
		sw		0		4		seven
		lw		0		1		seven
		halt
neg1	.fill	-1
two		.fill	2
five	.fill	5
seven	.fill	7
