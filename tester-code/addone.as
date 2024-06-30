		lw		0		1		two
		lw		0		2		five
		lw		0		3		add1
loop	beq		1		2		end
		add		1		3		1
		beq		0		0		loop
end		noop
		add		0		1		4
		lw		0		1		seven
		sw		0		4		seven
		lw		0		1		seven
		halt
add1	.fill	1
two		.fill	5
five	.fill	2
seven	.fill	7
