.text

B .main
B .exc_handler
#B .int_handler
.exc_handler:
	movz oldSp,SP
	movu sp,0xfffc
	st r2 , -12[sp]
	st r5 , -24[sp]
	st r15 , -60[sp]
	movz r0,oldSp
	st r0,-64[sp]
	movz r0,oldFlags
	st r0,-68[sp]
	movz r0,oldPc
	st r0,-72[sp]
	sub sp,sp,72



	add sp,sp,72
	
	
	ld r2 , -12[sp]
	ld r5 , -24[sp]]
	ld r15 , -60[sp]
	ld sp,-64[sp]
	retz


.main:

	
	mov r5,9
	
	div r5,0
	mov r1,0
	
.end
