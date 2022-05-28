	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"report2.c"
	.comm	p,4,4
	.global	cx
	.bss
	.align	1
	.type	cx, %object
	.size	cx, 2
cx:
	.space	2
	.global	cy
	.align	1
	.type	cy, %object
	.size	cy, 2
cy:
	.space	2
	.global	x
	.data
	.align	2
	.type	x, %object
	.size	x, 4
x:
	.word	90
	.global	y
	.align	2
	.type	y, %object
	.size	y, 4
y:
	.word	90
	.global	time
	.bss
	.align	1
	.type	time, %object
	.size	time, 2
time:
	.space	2
	.global	tmp
	.align	1
	.type	tmp, %object
	.size	tmp, 2
tmp:
	.space	2
	.comm	cnt,4,4
	.global	coin_x
	.data
	.align	2
	.type	coin_x, %object
	.size	coin_x, 20
coin_x:
	.word	200
	.word	200
	.word	200
	.word	200
	.word	200
	.global	coin_y
	.align	2
	.type	coin_y, %object
	.size	coin_y, 20
coin_y:
	.word	80
	.word	40
	.word	50
	.word	120
	.word	60
	.global	coin_j
	.bss
	.align	2
	.type	coin_j, %object
	.size	coin_j, 20
coin_j:
	.space	20
	.global	f_coin_x
	.data
	.align	2
	.type	f_coin_x, %object
	.size	f_coin_x, 20
f_coin_x:
	.word	200
	.word	200
	.word	200
	.word	200
	.word	200
	.global	f_coin_y
	.align	2
	.type	f_coin_y, %object
	.size	f_coin_y, 20
f_coin_y:
	.word	80
	.word	40
	.word	50
	.word	120
	.word	60
	.global	f_coin_j
	.bss
	.align	2
	.type	f_coin_j, %object
	.size	f_coin_j, 20
f_coin_j:
	.space	20
	.global	th_coin
	.align	2
	.type	th_coin, %object
	.size	th_coin, 4
th_coin:
	.space	4
	.global	n_coin
	.align	2
	.type	n_coin, %object
	.size	n_coin, 4
n_coin:
	.space	4
	.global	n_heart
	.data
	.align	2
	.type	n_heart, %object
	.size	n_heart, 4
n_heart:
	.word	4
	.global	laiser_j
	.bss
	.align	2
	.type	laiser_j, %object
	.size	laiser_j, 20
laiser_j:
	.space	20
	.global	laiser_x
	.data
	.align	2
	.type	laiser_x, %object
	.size	laiser_x, 20
laiser_x:
	.word	160
	.word	180
	.word	200
	.word	200
	.word	190
	.global	laiser_y
	.align	2
	.type	laiser_y, %object
	.size	laiser_y, 20
laiser_y:
	.word	30
	.word	60
	.word	90
	.word	120
	.word	140
	.global	f_laiser_x
	.align	2
	.type	f_laiser_x, %object
	.size	f_laiser_x, 20
f_laiser_x:
	.word	160
	.word	180
	.word	200
	.word	200
	.word	190
	.global	f_laiser_y
	.align	2
	.type	f_laiser_y, %object
	.size	f_laiser_y, 20
f_laiser_y:
	.word	30
	.word	60
	.word	90
	.word	120
	.word	140
	.global	f_laiser_j
	.bss
	.align	2
	.type	f_laiser_j, %object
	.size	f_laiser_j, 20
f_laiser_j:
	.space	20
	.global	difficulty
	.data
	.align	1
	.type	difficulty, %object
	.size	difficulty, 2
difficulty:
	.short	10
	.global	col_num
	.align	2
	.type	col_num, %object
	.size	col_num, 4
col_num:
	.word	3
	.global	cols
	.align	2
	.type	cols, %object
	.size	cols, 12
cols:
	.short	5285
	.short	992
	.short	31
	.short	1023
	.short	14350
	.short	32767
	.comm	plane_color,2,2
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	mov	r3, #67108864
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldr	r2, .L3
	strh	r2, [r3]	@ movhi
	bl	black_back
.L2:
	bl	init_param
	bl	play
	b	.L2
.L4:
	.align	2
.L3:
	.word	3843
	.size	main, .-main
	.section	.rodata
	.align	2
.LC0:
	.ascii	"TIME\000"
	.text
	.align	2
	.global	int_handler
	.type	int_handler, %function
int_handler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	bl	start_interruption
	ldr	r3, .L9
	ldrh	r3, [r3]
	and	r3, r3, #32
	cmp	r3, #0
	beq	.L6
	ldr	r3, .L9+4
	ldrh	r3, [r3]
	ldr	r2, .L9+8
	strh	r3, [r2]	@ movhi
	ldr	r2, .L9+12
	sub	r3, fp, #12
	mov	r1, r2
	mov	r2, #4
	mov	r0, r3
	bl	memcpy
	mov	r0, #18
	mov	r1, #1
	bl	locate
	ldr	r0, .L9+16
	bl	prints
	mov	r0, #25
	mov	r1, #1
	bl	locate
	ldr	r3, .L9+8
	ldrh	r3, [r3]	@ movhi
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldr	r3, .L9+20
	ldrh	r3, [r3]
	rsb	r3, r3, r2
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r0, r3
	bl	display_time
	ldr	r3, .L9+24
	ldr	r3, [r3]
	ldr	r2, .L9+28
	ldr	r2, [r2, r3, asl #2]
	sub	r2, r2, #1
	ldr	r1, .L9+28
	str	r2, [r1, r3, asl #2]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L7
.L8:
	ldr	r2, .L9+32
	ldr	r3, [fp, #-8]
	ldr	r3, [r2, r3, asl #2]
	sub	r2, r3, #1
	ldr	r1, .L9+32
	ldr	r3, [fp, #-8]
	str	r2, [r1, r3, asl #2]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L7:
	ldr	r3, [fp, #-8]
	cmp	r3, #4
	ble	.L8
	ldr	r3, .L9+12
	mov	r1, r3
	sub	r3, fp, #12
	mov	r2, #4
	mov	r0, r1
	mov	r1, r3
	bl	memcpy
.L6:
	bl	end_interruption
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, lr}
	bx	lr
.L10:
	.align	2
.L9:
	.word	67109378
	.word	67109132
	.word	time
	.word	p
	.word	.LC0
	.word	tmp
	.word	th_coin
	.word	coin_x
	.word	laiser_x
	.size	int_handler, .-int_handler
	.align	2
	.global	start_interruption
	.type	start_interruption, %function
start_interruption:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r3, .L12
	mov	r2, #0
	strh	r2, [r3]	@ movhi
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L13:
	.align	2
.L12:
	.word	67109384
	.size	start_interruption, .-start_interruption
	.align	2
	.global	end_interruption
	.type	end_interruption, %function
end_interruption:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r3, .L15
	mov	r2, #32
	strh	r2, [r3]	@ movhi
	ldr	r3, .L15+4
	mov	r2, #1
	strh	r2, [r3]	@ movhi
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L16:
	.align	2
.L15:
	.word	67109378
	.word	67109384
	.size	end_interruption, .-end_interruption
	.align	2
	.global	init_interruption
	.type	init_interruption, %function
init_interruption:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r3, .L18
	mov	r2, #32
	strh	r2, [r3]	@ movhi
	ldr	r3, .L18+4
	mov	r2, #1
	strh	r2, [r3]	@ movhi
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L19:
	.align	2
.L18:
	.word	67109376
	.word	67109384
	.size	init_interruption, .-init_interruption
	.align	2
	.global	init_timer
	.type	init_timer, %function
init_timer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r3, .L21
	ldr	r2, .L21+4
	strh	r2, [r3]	@ movhi
	ldr	r2, .L21+8
	ldr	r3, .L21+12
	ldrh	r3, [r3]
	rsb	r3, r3, #0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [r2]	@ movhi
	ldr	r3, .L21+16
	mvn	r2, #9
	strh	r2, [r3]	@ movhi
	ldr	r3, .L21+20
	mov	r2, #0
	strh	r2, [r3]	@ movhi
	ldr	r3, .L21+24
	mov	r2, #0
	strh	r2, [r3]	@ movhi
	ldr	r3, .L21+28
	mov	r2, #132
	strh	r2, [r3]	@ movhi
	ldr	r3, .L21+32
	mov	r2, #196
	strh	r2, [r3]	@ movhi
	ldr	r3, .L21+36
	mov	r2, #132
	strh	r2, [r3]	@ movhi
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L22:
	.align	2
.L21:
	.word	67109120
	.word	-1678
	.word	67109124
	.word	difficulty
	.word	67109128
	.word	67109132
	.word	67109122
	.word	67109126
	.word	67109130
	.word	67109134
	.size	init_timer, .-init_timer
	.align	2
	.global	timer_on
	.type	timer_on, %function
timer_on:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r3, .L24
	mov	r2, #128
	strh	r2, [r3]	@ movhi
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L25:
	.align	2
.L24:
	.word	67109122
	.size	timer_on, .-timer_on
	.align	2
	.global	timer_off
	.type	timer_off, %function
timer_off:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r3, .L27
	mov	r2, #0
	strh	r2, [r3]	@ movhi
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L28:
	.align	2
.L27:
	.word	67109122
	.size	timer_off, .-timer_off
	.section	.rodata
	.align	2
.LC1:
	.ascii	"Collect 4 coins\000"
	.align	2
.LC2:
	.ascii	"But Avoid laisers\000"
	.align	2
.LC3:
	.ascii	"PRESS_A\000"
	.align	2
.LC4:
	.ascii	"Select color\000"
	.align	2
.LC5:
	.ascii	"With L and R button\000"
	.align	2
.LC6:
	.ascii	"You can change color\000"
	.align	2
.LC7:
	.ascii	"PRESS_A to fix color\000"
	.align	2
.LC8:
	.ascii	"Select game mode\000"
	.align	2
.LC9:
	.ascii	"START button  normal mode \000"
	.align	2
.LC10:
	.ascii	"SELECT button  easy mode\000"
	.text
	.align	2
	.global	init_param
	.type	init_param, %function
init_param:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	mov	r0, #2
	mov	r1, #2
	bl	locate
	ldr	r0, .L57
	bl	prints
	mov	r0, #2
	mov	r1, #4
	bl	locate
	ldr	r0, .L57+4
	bl	prints
	mov	r0, #12
	mov	r1, #9
	bl	locate
	ldr	r0, .L57+8
	bl	prints
	b	.L30
.L31:
	ldr	r3, .L57+12
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r2, .L57+12
	str	r3, [r2]
	ldr	r3, .L57+12
	ldr	r3, [r3]
	cmp	r3, #5
	ble	.L30
	ldr	r3, .L57+12
	mov	r2, #1
	str	r2, [r3]
.L30:
	ldr	r3, .L57+16
	ldrh	r3, [r3]
	mvn	r3, r3
	mov	r3, r3, asl #22
	mov	r3, r3, lsr #22
	cmp	r3, #1
	bne	.L31
	b	.L32
.L33:
	bl	black_back
.L32:
	ldr	r3, .L57+16
	ldrh	r3, [r3]
	mvn	r3, r3
	mov	r3, r3, asl #22
	mov	r3, r3, lsr #22
	cmp	r3, #1
	beq	.L33
	mov	r0, #2
	mov	r1, #2
	bl	locate
	ldr	r0, .L57+20
	bl	prints
	mov	r0, #2
	mov	r1, #4
	bl	locate
	ldr	r0, .L57+24
	bl	prints
	mov	r0, #2
	mov	r1, #6
	bl	locate
	ldr	r0, .L57+28
	bl	prints
	mov	r0, #5
	mov	r1, #9
	bl	locate
	ldr	r0, .L57+32
	bl	prints
	b	.L34
.L42:
	ldr	r3, .L57+16
	ldrh	r3, [r3]
	mvn	r3, r3
	mov	r3, r3, asl #22
	mov	r3, r3, lsr #22
	cmp	r3, #256
	beq	.L56
	cmp	r3, #512
	bne	.L35
	mov	r0, r0	@ nop
.L38:
	ldr	r3, .L57+16
	ldrh	r3, [r3]
	mvn	r3, r3
	mov	r3, r3, asl #22
	mov	r3, r3, lsr #22
	cmp	r3, #512
	beq	.L38
	ldr	r3, .L57+36
	ldr	r3, [r3]
	sub	r3, r3, #1
	ldr	r2, .L57+36
	str	r3, [r2]
	ldr	r3, .L57+36
	ldr	r3, [r3]
	cmp	r3, #0
	bge	.L39
	ldr	r3, .L57+36
	mov	r2, #5
	str	r2, [r3]
	b	.L35
.L39:
	b	.L35
.L56:
	mov	r0, r0	@ nop
.L40:
	ldr	r3, .L57+16
	ldrh	r3, [r3]
	mvn	r3, r3
	mov	r3, r3, asl #22
	mov	r3, r3, lsr #22
	cmp	r3, #256
	beq	.L40
	ldr	r3, .L57+36
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r2, .L57+36
	str	r3, [r2]
	ldr	r3, .L57+36
	ldr	r3, [r3]
	cmp	r3, #5
	ble	.L41
	ldr	r3, .L57+36
	mov	r2, #0
	str	r2, [r3]
	b	.L55
.L41:
.L55:
	mov	r0, r0	@ nop
.L35:
	ldr	r3, .L57+36
	ldr	r3, [r3]
	ldr	r2, .L57+40
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldrh	r3, [r3]
	mov	r0, #120
	mov	r1, #120
	mov	r2, r3
	bl	pop_g_p
.L34:
	ldr	r3, .L57+16
	ldrh	r3, [r3]
	mvn	r3, r3
	mov	r3, r3, asl #22
	mov	r3, r3, lsr #22
	cmp	r3, #1
	bne	.L42
	b	.L43
.L44:
	ldr	r3, .L57+36
	ldr	r3, [r3]
	ldr	r2, .L57+40
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldrh	r3, [r3]
	ldr	r2, .L57+44
	strh	r3, [r2]	@ movhi
.L43:
	ldr	r3, .L57+16
	ldrh	r3, [r3]
	mvn	r3, r3
	mov	r3, r3, asl #22
	mov	r3, r3, lsr #22
	cmp	r3, #1
	beq	.L44
	bl	black_back
	mov	r0, #2
	mov	r1, #2
	bl	locate
	ldr	r0, .L57+48
	bl	prints
	mov	r0, #2
	mov	r1, #4
	bl	locate
	ldr	r0, .L57+52
	bl	prints
	mov	r0, #2
	mov	r1, #6
	bl	locate
	ldr	r0, .L57+56
	bl	prints
.L50:
	ldr	r3, .L57+16
	ldrh	r3, [r3]
	mvn	r3, r3
	mov	r3, r3, asl #22
	mov	r3, r3, lsr #22
	cmp	r3, #8
	bne	.L45
	mov	r0, r0	@ nop
.L46:
	ldr	r3, .L57+16
	ldrh	r3, [r3]
	mvn	r3, r3
	mov	r3, r3, asl #22
	mov	r3, r3, lsr #22
	cmp	r3, #8
	beq	.L46
	ldr	r3, .L57+60
	mov	r2, #10
	strh	r2, [r3]	@ movhi
	b	.L47
.L45:
	ldr	r3, .L57+16
	ldrh	r3, [r3]
	mvn	r3, r3
	mov	r3, r3, asl #22
	mov	r3, r3, lsr #22
	cmp	r3, #4
	bne	.L48
	mov	r0, r0	@ nop
.L49:
	ldr	r3, .L57+16
	ldrh	r3, [r3]
	mvn	r3, r3
	mov	r3, r3, asl #22
	mov	r3, r3, lsr #22
	cmp	r3, #4
	beq	.L49
	ldr	r3, .L57+60
	mov	r2, #100
	strh	r2, [r3]	@ movhi
	b	.L47
.L48:
	b	.L50
.L47:
	bl	init_timer
	bl	init_interruption
	bl	back
	bl	fil_st
	bl	timer_on
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L51
.L52:
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #1
	mov	r0, r3
	mov	r1, #10
	mov	r2, #31
	bl	pop_heart
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L51:
	ldr	r3, .L57+64
	ldr	r3, [r3]
	ldr	r2, [fp, #-8]
	cmp	r2, r3
	blt	.L52
	ldr	r3, .L57+68
	ldr	r1, [r3]
	ldr	r3, .L57+72
	ldr	r2, [r3]
	ldr	r3, .L57+44
	ldrh	r3, [r3]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	pop_g_p
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L53
.L54:
	ldr	r2, .L57+76
	ldr	r3, [fp, #-8]
	ldr	r2, [r2, r3, asl #2]
	ldr	r1, .L57+80
	ldr	r3, [fp, #-8]
	str	r2, [r1, r3, asl #2]
	ldr	r2, .L57+84
	ldr	r3, [fp, #-8]
	ldr	r2, [r2, r3, asl #2]
	ldr	r3, .L57+12
	ldr	r3, [r3]
	ldr	r1, [fp, #-8]
	mul	r3, r1, r3
	add	r2, r2, r3
	ldr	r1, .L57+88
	ldr	r3, [fp, #-8]
	str	r2, [r1, r3, asl #2]
	ldr	r2, .L57+92
	ldr	r3, [fp, #-8]
	ldr	r2, [r2, r3, asl #2]
	ldr	r3, .L57+12
	ldr	r3, [r3]
	ldr	r1, [fp, #-8]
	mul	r3, r1, r3
	add	r2, r2, r3
	ldr	r1, .L57+96
	ldr	r3, [fp, #-8]
	str	r2, [r1, r3, asl #2]
	ldr	r2, .L57+100
	ldr	r3, [fp, #-8]
	ldr	r2, [r2, r3, asl #2]
	ldr	r1, .L57+104
	ldr	r3, [fp, #-8]
	str	r2, [r1, r3, asl #2]
	ldr	r2, .L57+108
	ldr	r3, [fp, #-8]
	ldr	r2, [r2, r3, asl #2]
	ldr	r3, .L57+12
	ldr	r3, [r3]
	add	r2, r2, r3
	ldr	r1, .L57+112
	ldr	r3, [fp, #-8]
	str	r2, [r1, r3, asl #2]
	ldr	r2, .L57+116
	ldr	r3, [fp, #-8]
	ldr	r2, [r2, r3, asl #2]
	ldr	r3, .L57+12
	ldr	r3, [r3]
	add	r2, r2, r3
	ldr	r1, .L57+120
	ldr	r3, [fp, #-8]
	str	r2, [r1, r3, asl #2]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L53:
	ldr	r3, [fp, #-8]
	cmp	r3, #4
	ble	.L54
	mov	r0, r0	@ nop
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, lr}
	bx	lr
.L58:
	.align	2
.L57:
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	cnt
	.word	67109168
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	col_num
	.word	cols
	.word	plane_color
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.word	difficulty
	.word	n_heart
	.word	x
	.word	y
	.word	f_laiser_j
	.word	laiser_j
	.word	f_laiser_x
	.word	laiser_x
	.word	f_laiser_y
	.word	laiser_y
	.word	f_coin_j
	.word	coin_j
	.word	f_coin_x
	.word	coin_x
	.word	f_coin_y
	.word	coin_y
	.size	init_param, .-init_param
	.section	.rodata
	.align	2
.LC11:
	.ascii	"YOU_WIN\000"
	.align	2
.LC12:
	.ascii	"YOU_LOSE\000"
	.text
	.align	2
	.global	play
	.type	play, %function
play:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
.L71:
	ldr	r3, .L73
	ldr	r3, [r3]
	cmp	r3, #4
	beq	.L60
	ldr	r3, .L73+4
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L61
.L60:
	bl	timer_off
	ldr	r3, .L73
	ldr	r3, [r3]
	cmp	r3, #4
	bne	.L62
	bl	black_back
	mov	r0, #18
	mov	r1, #1
	bl	locate
	ldr	r0, .L73+8
	bl	prints
	mov	r0, #25
	mov	r1, #1
	bl	locate
	ldr	r3, .L73+12
	ldrh	r3, [r3]	@ movhi
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldr	r3, .L73+16
	ldrh	r3, [r3]
	rsb	r3, r3, r2
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r0, r3
	bl	display_time
	mov	r0, #12
	mov	r1, #7
	bl	locate
	ldr	r0, .L73+20
	bl	prints
	mov	r0, #12
	mov	r1, #11
	bl	locate
	ldr	r0, .L73+24
	bl	prints
	mov	r0, r0	@ nop
.L63:
	ldr	r3, .L73+28
	ldrh	r3, [r3]
	mvn	r3, r3
	mov	r3, r3, asl #22
	mov	r3, r3, lsr #22
	cmp	r3, #1
	bne	.L63
	b	.L64
.L65:
	bl	black_back
.L64:
	ldr	r3, .L73+28
	ldrh	r3, [r3]
	mvn	r3, r3
	mov	r3, r3, asl #22
	mov	r3, r3, lsr #22
	cmp	r3, #1
	beq	.L65
	b	.L66
.L62:
	ldr	r3, .L73+4
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L66
	bl	black_back
	mov	r0, #18
	mov	r1, #1
	bl	locate
	ldr	r0, .L73+8
	bl	prints
	mov	r0, #25
	mov	r1, #1
	bl	locate
	ldr	r3, .L73+12
	ldrh	r3, [r3]	@ movhi
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldr	r3, .L73+16
	ldrh	r3, [r3]
	rsb	r3, r3, r2
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r0, r3
	bl	display_time
	mov	r0, #12
	mov	r1, #7
	bl	locate
	ldr	r0, .L73+32
	bl	prints
	mov	r0, #12
	mov	r1, #11
	bl	locate
	ldr	r0, .L73+24
	bl	prints
	mov	r0, r0	@ nop
.L67:
	ldr	r3, .L73+28
	ldrh	r3, [r3]
	mvn	r3, r3
	mov	r3, r3, asl #22
	mov	r3, r3, lsr #22
	cmp	r3, #1
	bne	.L67
	b	.L68
.L69:
	bl	black_back
.L68:
	ldr	r3, .L73+28
	ldrh	r3, [r3]
	mvn	r3, r3
	mov	r3, r3, asl #22
	mov	r3, r3, lsr #22
	cmp	r3, #1
	beq	.L69
.L66:
	ldr	r3, .L73+36
	mov	r2, #0
	str	r2, [r3]
	ldr	r3, .L73+40
	mov	r2, #0
	str	r2, [r3]
	ldr	r3, .L73
	mov	r2, #0
	str	r2, [r3]
	ldr	r3, .L73+4
	mov	r2, #4
	str	r2, [r3]
	ldr	r3, .L73+12
	ldrh	r3, [r3]	@ movhi
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	ldr	r2, .L73+16
	strh	r3, [r2]	@ movhi
	b	.L72
.L61:
	bl	ctl_laiser
	bl	ctl_coins
	bl	key_check
	b	.L71
.L72:
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, lr}
	bx	lr
.L74:
	.align	2
.L73:
	.word	n_coin
	.word	n_heart
	.word	.LC0
	.word	time
	.word	tmp
	.word	.LC11
	.word	.LC3
	.word	67109168
	.word	.LC12
	.word	cnt
	.word	th_coin
	.size	play, .-play
	.align	2
	.global	ctl_coins
	.type	ctl_coins, %function
ctl_coins:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	ldr	r3, .L82
	ldr	r0, [r3]
	ldr	r3, .L82+4
	ldr	r1, [r3]
	ldr	r3, .L82+8
	ldr	r3, [r3]
	ldr	r2, .L82+12
	ldr	ip, [r2, r3, asl #2]
	ldr	r3, .L82+8
	ldr	r3, [r3]
	ldr	r2, .L82+16
	ldr	r3, [r2, r3, asl #2]
	mov	r2, ip
	bl	distance
	mov	r3, r0
	cmp	r3, #0
	bne	.L76
	ldr	r3, .L82+8
	ldr	r3, [r3]
	ldr	r2, .L82+20
	ldr	r3, [r2, r3, asl #2]
	cmp	r3, #0
	bne	.L76
	ldr	r3, .L82+8
	ldr	r3, [r3]
	ldr	r2, .L82+12
	ldr	r1, [r2, r3, asl #2]
	ldr	r3, .L82+8
	ldr	r3, [r3]
	ldr	r2, .L82+16
	ldr	r3, [r2, r3, asl #2]
	mov	r0, r1
	mov	r1, r3
	mov	r2, #4
	ldr	r3, .L82+24
	bl	move_coin
	b	.L77
.L76:
	ldr	r3, .L82+8
	ldr	r3, [r3]
	ldr	r2, .L82+20
	ldr	r3, [r2, r3, asl #2]
	cmp	r3, #0
	bne	.L78
	ldr	r3, .L82+8
	ldr	r3, [r3]
	ldr	r2, .L82+12
	ldr	r1, [r2, r3, asl #2]
	ldr	r3, .L82+8
	ldr	r3, [r3]
	ldr	r2, .L82+16
	ldr	r3, [r2, r3, asl #2]
	mov	r0, r1
	mov	r1, r3
	mov	r2, #6
	ldr	r3, .L82+28
	bl	pop_coin
	ldr	r3, .L82+32
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r2, .L82+32
	str	r3, [r2]
	ldr	r3, .L82+32
	ldr	r3, [r3]
	sub	r2, r3, #1
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, #80
	mov	r0, r3
	mov	r1, #10
	mov	r2, #4
	ldr	r3, .L82+24
	bl	pop_coin
.L78:
	ldr	r3, .L82+8
	ldr	r3, [r3]
	ldr	r2, .L82+20
	ldr	r2, [r2, r3, asl #2]
	add	r2, r2, #1
	ldr	r1, .L82+20
	str	r2, [r1, r3, asl #2]
	ldr	r3, .L82+8
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r2, .L82+8
	str	r3, [r2]
	ldr	r3, .L82+8
	ldr	r3, [r3]
	cmp	r3, #6
	bne	.L77
	ldr	r3, .L82+8
	mov	r2, #0
	str	r2, [r3]
.L77:
	ldr	r3, .L82+8
	ldr	r3, [r3]
	ldr	r2, .L82+12
	ldr	r3, [r2, r3, asl #2]
	cmp	r3, #0
	bne	.L75
	ldr	r3, .L82+8
	ldr	r3, [r3]
	ldr	r2, .L82+12
	ldr	r1, [r2, r3, asl #2]
	ldr	r3, .L82+8
	ldr	r3, [r3]
	ldr	r2, .L82+16
	ldr	r3, [r2, r3, asl #2]
	mov	r0, r1
	mov	r1, r3
	mov	r2, #5
	ldr	r3, .L82+28
	bl	pop_coin
	ldr	r3, .L82+8
	ldr	r3, [r3]
	ldr	r2, .L82+12
	mov	r1, #200
	str	r1, [r2, r3, asl #2]
	ldr	r3, .L82+8
	ldr	r3, [r3]
	ldr	r2, .L82+16
	ldr	r3, [r2, r3, asl #2]
	add	r3, r3, #40
	cmp	r3, #159
	bgt	.L80
	ldr	r3, .L82+8
	ldr	r3, [r3]
	ldr	r2, .L82+8
	ldr	r2, [r2]
	ldr	r1, .L82+16
	ldr	r2, [r1, r2, asl #2]
	add	r2, r2, #40
	ldr	r1, .L82+16
	str	r2, [r1, r3, asl #2]
	b	.L75
.L80:
	ldr	r3, .L82+8
	ldr	r3, [r3]
	ldr	r2, .L82+16
	ldr	r3, [r2, r3, asl #2]
	sub	r3, r3, #140
	cmp	r3, #20
	ble	.L81
	ldr	r3, .L82+8
	ldr	r3, [r3]
	ldr	r2, .L82+8
	ldr	r2, [r2]
	ldr	r1, .L82+16
	ldr	r2, [r1, r2, asl #2]
	sub	r2, r2, #140
	ldr	r1, .L82+16
	str	r2, [r1, r3, asl #2]
	b	.L75
.L81:
	ldr	r3, .L82+8
	ldr	r3, [r3]
	ldr	r2, .L82+8
	ldr	r2, [r2]
	ldr	r1, .L82+16
	ldr	r2, [r1, r2, asl #2]
	sub	r2, r2, #10
	ldr	r1, .L82+16
	str	r2, [r1, r3, asl #2]
.L75:
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, lr}
	bx	lr
.L83:
	.align	2
.L82:
	.word	x
	.word	y
	.word	th_coin
	.word	coin_x
	.word	coin_y
	.word	coin_j
	.word	1023
	.word	32736
	.word	n_coin
	.size	ctl_coins, .-ctl_coins
	.align	2
	.global	ctl_laiser
	.type	ctl_laiser, %function
ctl_laiser:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L85
.L93:
	ldr	r3, .L94
	ldr	r0, [r3]
	ldr	r3, .L94+4
	ldr	r1, [r3]
	ldr	r2, .L94+8
	ldr	r3, [fp, #-8]
	ldr	ip, [r2, r3, asl #2]
	ldr	r2, .L94+12
	ldr	r3, [fp, #-8]
	ldr	r3, [r2, r3, asl #2]
	mov	r2, ip
	bl	distance
	mov	r3, r0
	cmp	r3, #0
	bne	.L86
	ldr	r2, .L94+16
	ldr	r3, [fp, #-8]
	ldr	r3, [r2, r3, asl #2]
	cmp	r3, #0
	bne	.L86
	ldr	r2, .L94+8
	ldr	r3, [fp, #-8]
	ldr	r1, [r2, r3, asl #2]
	ldr	r2, .L94+12
	ldr	r3, [fp, #-8]
	ldr	r3, [r2, r3, asl #2]
	mov	r0, r1
	mov	r1, r3
	ldr	r2, .L94+20
	bl	move_laiser
	b	.L87
.L86:
	ldr	r2, .L94+16
	ldr	r3, [fp, #-8]
	ldr	r3, [r2, r3, asl #2]
	cmp	r3, #0
	bne	.L88
	ldr	r2, .L94+8
	ldr	r3, [fp, #-8]
	ldr	r1, [r2, r3, asl #2]
	ldr	r2, .L94+12
	ldr	r3, [fp, #-8]
	ldr	r3, [r2, r3, asl #2]
	mov	r0, r1
	mov	r1, r3
	bl	d_laiser
	ldr	r3, .L94+24
	ldr	r2, [r3]
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #1
	mov	r0, r3
	mov	r1, #10
	mov	r2, #0
	bl	pop_heart
	ldr	r3, .L94+24
	ldr	r3, [r3]
	sub	r3, r3, #1
	ldr	r2, .L94+24
	str	r3, [r2]
.L88:
	ldr	r2, .L94+16
	ldr	r3, [fp, #-8]
	ldr	r3, [r2, r3, asl #2]
	add	r2, r3, #1
	ldr	r1, .L94+16
	ldr	r3, [fp, #-8]
	str	r2, [r1, r3, asl #2]
.L87:
	ldr	r2, .L94+8
	ldr	r3, [fp, #-8]
	ldr	r3, [r2, r3, asl #2]
	cmp	r3, #0
	bne	.L89
	ldr	r2, .L94+8
	ldr	r3, [fp, #-8]
	ldr	r1, [r2, r3, asl #2]
	ldr	r2, .L94+12
	ldr	r3, [fp, #-8]
	ldr	r3, [r2, r3, asl #2]
	mov	r0, r1
	mov	r1, r3
	bl	d_laiser
	ldr	r2, .L94+28
	ldr	r3, [fp, #-8]
	ldr	r2, [r2, r3, asl #2]
	ldr	r1, .L94+8
	ldr	r3, [fp, #-8]
	str	r2, [r1, r3, asl #2]
	ldr	r2, .L94+12
	ldr	r3, [fp, #-8]
	ldr	r1, [r2, r3, asl #2]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r1, r3
	cmp	r3, #159
	bgt	.L90
	ldr	r2, .L94+12
	ldr	r3, [fp, #-8]
	ldr	r1, [r2, r3, asl #2]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r2, r1, r3
	ldr	r1, .L94+12
	ldr	r3, [fp, #-8]
	str	r2, [r1, r3, asl #2]
	b	.L89
.L90:
	ldr	r2, .L94+12
	ldr	r3, [fp, #-8]
	ldr	r1, [r2, r3, asl #2]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r2, r2, asl #4
	rsb	r3, r2, r3
	mov	r3, r3, asl #1
	add	r3, r1, r3
	cmp	r3, #20
	ble	.L91
	ldr	r2, .L94+12
	ldr	r3, [fp, #-8]
	ldr	r1, [r2, r3, asl #2]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r2, r2, asl #4
	rsb	r3, r2, r3
	mov	r3, r3, asl #1
	add	r2, r1, r3
	ldr	r1, .L94+12
	ldr	r3, [fp, #-8]
	str	r2, [r1, r3, asl #2]
	b	.L89
.L91:
	ldr	r2, .L94+12
	ldr	r3, [fp, #-8]
	ldr	r1, [r2, r3, asl #2]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #27
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	rsb	r3, r2, r3
	mov	r3, r3, asl #3
	add	r3, r1, r3
	cmp	r3, #20
	ble	.L92
	ldr	r2, .L94+12
	ldr	r3, [fp, #-8]
	ldr	r1, [r2, r3, asl #2]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #27
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	rsb	r3, r2, r3
	mov	r3, r3, asl #3
	add	r2, r1, r3
	ldr	r1, .L94+12
	ldr	r3, [fp, #-8]
	str	r2, [r1, r3, asl #2]
	b	.L89
.L92:
	ldr	r2, .L94+12
	ldr	r3, [fp, #-8]
	ldr	r1, [r2, r3, asl #2]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	mov	r3, r3, asl #29
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	rsb	r3, r2, r3
	mov	r3, r3, asl #1
	add	r2, r1, r3
	ldr	r1, .L94+12
	ldr	r3, [fp, #-8]
	str	r2, [r1, r3, asl #2]
.L89:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L85:
	ldr	r3, [fp, #-8]
	cmp	r3, #4
	ble	.L93
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, lr}
	bx	lr
.L95:
	.align	2
.L94:
	.word	x
	.word	y
	.word	laiser_x
	.word	laiser_y
	.word	laiser_j
	.word	1023
	.word	n_heart
	.word	f_laiser_x
	.size	ctl_laiser, .-ctl_laiser
	.align	2
	.global	fil_st
	.type	fil_st, %function
fil_st:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	mov	r3, #0
	strh	r3, [fp, #-8]	@ movhi
	b	.L97
.L100:
	mov	r3, #0
	strh	r3, [fp, #-6]	@ movhi
	b	.L98
.L99:
	ldrh	r2, [fp, #-6]
	ldrh	r3, [fp, #-8]
	mov	r0, r2
	mov	r1, r3
	mov	r2, #0
	bl	draw_point
	ldrh	r3, [fp, #-6]
	add	r3, r3, #1
	strh	r3, [fp, #-6]	@ movhi
.L98:
	ldrh	r3, [fp, #-6]
	cmp	r3, #239
	bls	.L99
	ldrh	r3, [fp, #-8]
	add	r3, r3, #1
	strh	r3, [fp, #-8]	@ movhi
.L97:
	ldrh	r3, [fp, #-8]
	cmp	r3, #19
	bls	.L100
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, lr}
	bx	lr
	.size	fil_st, .-fil_st
	.align	2
	.global	memcpy
	.type	memcpy, %function
memcpy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L102
.L103:
	ldr	r3, [fp, #-16]
	add	r2, r3, #1
	str	r2, [fp, #-16]
	ldr	r2, [fp, #-20]
	add	r1, r2, #1
	str	r1, [fp, #-20]
	ldrb	r2, [r2]	@ zero_extendqisi2
	strb	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L102:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	blt	.L103
	ldr	r3, [fp, #-16]
	mov	r0, r3
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	memcpy, .-memcpy
	.section	.rodata
	.align	2
.LC13:
	.ascii	"0123456789\000"
	.text
	.align	2
	.global	display_time
	.type	display_time, %function
display_time:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	mov	r3, r0
	strh	r3, [fp, #-30]	@ movhi
	ldr	r2, .L109
	sub	r3, fp, #20
	ldmia	r2, {r0, r1, r2}
	stmia	r3!, {r0, r1}
	strh	r2, [r3]	@ movhi
	add	r3, r3, #2
	mov	r2, r2, lsr #16
	strb	r2, [r3]
	mov	r3, #4
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	sub	r2, fp, #4
	add	r3, r2, r3
	mov	r2, #0
	strb	r2, [r3, #-24]
	b	.L106
.L107:
	ldrh	r3, [fp, #-30]
	mov	r0, r3
	mov	r1, #10
	bl	mod
	mov	r3, r0
	sub	r2, fp, #4
	add	r3, r2, r3
	ldrb	r1, [r3, #-16]	@ zero_extendqisi2
	sub	r2, fp, #28
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	mov	r2, r1
	strb	r2, [r3]
	ldrh	r3, [fp, #-30]
	mov	r0, r3
	mov	r1, #10
	bl	div
	mov	r3, r0
	strh	r3, [fp, #-30]	@ movhi
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	str	r3, [fp, #-8]
.L106:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bge	.L107
	sub	r3, fp, #28
	mov	r0, r3
	bl	prints
	mov	r0, r0	@ nop
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, lr}
	bx	lr
.L110:
	.align	2
.L109:
	.word	.LC13
	.size	display_time, .-display_time
	.align	2
	.global	key_check
	.type	key_check, %function
key_check:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	ldr	r3, .L137
	ldrh	r3, [r3]
	mvn	r3, r3
	mov	r3, r3, asl #22
	mov	r3, r3, lsr #22
	cmp	r3, #16
	beq	.L113
	cmp	r3, #16
	bgt	.L114
	cmp	r3, #2
	beq	.L131
	cmp	r3, #2
	bgt	.L116
	cmp	r3, #1
	beq	.L132
	b	.L111
.L116:
	cmp	r3, #4
	beq	.L133
	cmp	r3, #8
	beq	.L134
	b	.L111
.L114:
	cmp	r3, #128
	beq	.L120
	cmp	r3, #128
	bgt	.L121
	cmp	r3, #32
	beq	.L122
	cmp	r3, #64
	beq	.L123
	b	.L111
.L121:
	cmp	r3, #256
	beq	.L135
	cmp	r3, #512
	beq	.L136
	b	.L111
.L120:
	ldr	r3, .L137+4
	ldr	r3, [r3]
	add	r3, r3, #1
	cmp	r3, #149
	bgt	.L127
	ldr	r3, .L137+8
	ldr	r2, [r3]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	mov	r0, r2
	mov	r1, r3
	bl	d_edge_g_p
	ldr	r3, .L137+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r2, .L137+4
	str	r3, [r2]
	ldr	r3, .L137+8
	ldr	r1, [r3]
	ldr	r3, .L137+4
	ldr	r2, [r3]
	ldr	r3, .L137+12
	ldrh	r3, [r3]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	pop_g_p
	b	.L111
.L127:
	b	.L111
.L123:
	ldr	r3, .L137+4
	ldr	r3, [r3]
	sub	r3, r3, #1
	cmp	r3, #30
	ble	.L128
	ldr	r3, .L137+8
	ldr	r2, [r3]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	mov	r0, r2
	mov	r1, r3
	bl	d_edge_g_p
	ldr	r3, .L137+4
	ldr	r3, [r3]
	sub	r3, r3, #1
	ldr	r2, .L137+4
	str	r3, [r2]
	ldr	r3, .L137+8
	ldr	r1, [r3]
	ldr	r3, .L137+4
	ldr	r2, [r3]
	ldr	r3, .L137+12
	ldrh	r3, [r3]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	pop_g_p
	b	.L111
.L128:
	b	.L111
.L122:
	ldr	r3, .L137+8
	ldr	r3, [r3]
	sub	r3, r3, #1
	cmp	r3, #10
	ble	.L129
	ldr	r3, .L137+8
	ldr	r2, [r3]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	mov	r0, r2
	mov	r1, r3
	bl	d_edge_g_p
	ldr	r3, .L137+8
	ldr	r3, [r3]
	sub	r3, r3, #1
	ldr	r2, .L137+8
	str	r3, [r2]
	ldr	r3, .L137+8
	ldr	r1, [r3]
	ldr	r3, .L137+4
	ldr	r2, [r3]
	ldr	r3, .L137+12
	ldrh	r3, [r3]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	pop_g_p
	b	.L111
.L129:
	b	.L111
.L113:
	ldr	r3, .L137+8
	ldr	r3, [r3]
	add	r3, r3, #1
	cmp	r3, #229
	bgt	.L130
	ldr	r3, .L137+8
	ldr	r2, [r3]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	mov	r0, r2
	mov	r1, r3
	bl	d_edge_g_p
	ldr	r3, .L137+8
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r2, .L137+8
	str	r3, [r2]
	ldr	r3, .L137+8
	ldr	r1, [r3]
	ldr	r3, .L137+4
	ldr	r2, [r3]
	ldr	r3, .L137+12
	ldrh	r3, [r3]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	pop_g_p
	b	.L111
.L130:
	b	.L111
.L131:
	mov	r0, r0	@ nop
	b	.L111
.L132:
	mov	r0, r0	@ nop
	b	.L111
.L133:
	mov	r0, r0	@ nop
	b	.L111
.L134:
	mov	r0, r0	@ nop
	b	.L111
.L135:
	mov	r0, r0	@ nop
	b	.L111
.L136:
	mov	r0, r0	@ nop
.L111:
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, lr}
	bx	lr
.L138:
	.align	2
.L137:
	.word	67109168
	.word	y
	.word	x
	.word	plane_color
	.size	key_check, .-key_check
	.align	2
	.global	move_coin
	.type	move_coin, %function
move_coin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	str	r2, [fp, #-16]
	strh	r3, [fp, #-18]	@ movhi
	ldrh	r3, [fp, #-18]
	ldr	r0, [fp, #-8]
	ldr	r1, [fp, #-12]
	ldr	r2, [fp, #-16]
	bl	pop_coin
	ldr	r0, [fp, #-8]
	ldr	r1, [fp, #-12]
	bl	d_edge_coin
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, lr}
	bx	lr
	.size	move_coin, .-move_coin
	.align	2
	.global	d_edge_coin
	.type	d_edge_coin, %function
d_edge_coin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r3, [fp, #-12]
	add	r3, r3, #5
	ldr	r0, [fp, #-8]
	mov	r1, r3
	ldr	r2, .L141
	bl	draw_point
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	ldr	r3, [fp, #-12]
	add	r3, r3, #4
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L141
	bl	draw_point
	ldr	r3, [fp, #-8]
	add	r2, r3, #2
	ldr	r3, [fp, #-12]
	add	r3, r3, #4
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L141
	bl	draw_point
	ldr	r3, [fp, #-8]
	add	r2, r3, #3
	ldr	r3, [fp, #-12]
	add	r3, r3, #3
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L141
	bl	draw_point
	ldr	r3, [fp, #-8]
	add	r2, r3, #4
	ldr	r3, [fp, #-12]
	add	r3, r3, #2
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L141
	bl	draw_point
	ldr	r3, [fp, #-8]
	add	r2, r3, #4
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L141
	bl	draw_point
	ldr	r3, [fp, #-8]
	add	r3, r3, #5
	mov	r0, r3
	ldr	r1, [fp, #-12]
	ldr	r2, .L141
	bl	draw_point
	ldr	r3, [fp, #-12]
	sub	r3, r3, #5
	ldr	r0, [fp, #-8]
	mov	r1, r3
	ldr	r2, .L141
	bl	draw_point
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	ldr	r3, [fp, #-12]
	sub	r3, r3, #4
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L141
	bl	draw_point
	ldr	r3, [fp, #-8]
	add	r2, r3, #2
	ldr	r3, [fp, #-12]
	sub	r3, r3, #4
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L141
	bl	draw_point
	ldr	r3, [fp, #-8]
	add	r2, r3, #3
	ldr	r3, [fp, #-12]
	sub	r3, r3, #3
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L141
	bl	draw_point
	ldr	r3, [fp, #-8]
	add	r2, r3, #4
	ldr	r3, [fp, #-12]
	sub	r3, r3, #2
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L141
	bl	draw_point
	ldr	r3, [fp, #-8]
	add	r2, r3, #4
	ldr	r3, [fp, #-12]
	sub	r3, r3, #1
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L141
	bl	draw_point
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, lr}
	bx	lr
.L142:
	.align	2
.L141:
	.word	32736
	.size	d_edge_coin, .-d_edge_coin
	.align	2
	.global	pop_coin
	.type	pop_coin, %function
pop_coin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	strh	r3, [fp, #-34]	@ movhi
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-32]
	rsb	r3, r3, r2
	str	r3, [fp, #-8]
	b	.L144
.L145:
	ldrh	r3, [fp, #-34]
	ldr	r0, [fp, #-8]
	ldr	r1, [fp, #-28]
	mov	r2, r3
	bl	draw_point
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L144:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-32]
	add	r2, r2, r3
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bge	.L145
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-32]
	rsb	r3, r3, r2
	str	r3, [fp, #-8]
	b	.L146
.L147:
	ldrh	r3, [fp, #-34]
	ldr	r0, [fp, #-24]
	ldr	r1, [fp, #-8]
	mov	r2, r3
	bl	draw_point
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L146:
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-32]
	add	r2, r2, r3
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bge	.L147
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-32]
	rsb	r3, r3, r2
	str	r3, [fp, #-20]
	mov	r3, #1
	str	r3, [fp, #-12]
	b	.L148
.L151:
	b	.L149
.L150:
	ldrh	r3, [fp, #-34]
	ldr	r0, [fp, #-16]
	ldr	r1, [fp, #-20]
	mov	r2, r3
	bl	draw_point
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	rsb	r3, r3, r2
	mov	r2, r3, asl #1
	ldr	r3, [fp, #-16]
	add	r2, r2, r3
	ldrh	r3, [fp, #-34]
	mov	r0, r2
	ldr	r1, [fp, #-20]
	mov	r2, r3
	bl	draw_point
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-20]
	rsb	r3, r3, r2
	mov	r2, r3, asl #1
	ldr	r3, [fp, #-20]
	add	r2, r2, r3
	ldrh	r3, [fp, #-34]
	ldr	r0, [fp, #-16]
	mov	r1, r2
	mov	r2, r3
	bl	draw_point
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	rsb	r3, r3, r2
	mov	r2, r3, asl #1
	ldr	r3, [fp, #-16]
	add	r1, r2, r3
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-20]
	rsb	r3, r3, r2
	mov	r2, r3, asl #1
	ldr	r3, [fp, #-20]
	add	r2, r2, r3
	ldrh	r3, [fp, #-34]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	draw_point
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L149:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-24]
	rsb	r3, r3, r2
	ldr	r1, [fp, #-16]
	ldr	r2, [fp, #-24]
	rsb	r2, r2, r1
	mul	r2, r3, r2
	ldr	r1, [fp, #-20]
	ldr	r3, [fp, #-28]
	rsb	r3, r3, r1
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-28]
	rsb	r1, r1, r0
	mul	r3, r1, r3
	add	r2, r2, r3
	ldr	r3, [fp, #-32]
	ldr	r1, [fp, #-32]
	mul	r3, r1, r3
	cmp	r2, r3
	ble	.L150
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L148:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	ble	.L151
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, lr}
	bx	lr
	.size	pop_coin, .-pop_coin
	.align	2
	.global	d_laiser
	.type	d_laiser, %function
d_laiser:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L153
.L154:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	sub	r3, r3, #1
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L155
	bl	draw_point
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	rsb	r2, r3, r2
	ldr	r3, [fp, #-20]
	sub	r3, r3, #1
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L155
	bl	draw_point
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	mov	r0, r3
	ldr	r1, [fp, #-20]
	ldr	r2, .L155
	bl	draw_point
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	rsb	r3, r3, r2
	mov	r0, r3
	ldr	r1, [fp, #-20]
	ldr	r2, .L155
	bl	draw_point
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L155
	bl	draw_point
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	rsb	r2, r3, r2
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L155
	bl	draw_point
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L153:
	ldr	r3, [fp, #-8]
	cmp	r3, #9
	ble	.L154
	ldr	r3, [fp, #-16]
	sub	r3, r3, #10
	mov	r0, r3
	ldr	r1, [fp, #-20]
	ldr	r2, .L155
	bl	draw_point
	ldr	r3, [fp, #-16]
	add	r3, r3, #10
	mov	r0, r3
	ldr	r1, [fp, #-20]
	ldr	r2, .L155
	bl	draw_point
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, lr}
	bx	lr
.L156:
	.align	2
.L155:
	.word	32736
	.size	d_laiser, .-d_laiser
	.align	2
	.global	move_laiser
	.type	move_laiser, %function
move_laiser:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	mov	r3, r2
	strh	r3, [fp, #-14]	@ movhi
	ldrh	r3, [fp, #-14]
	ldr	r0, [fp, #-8]
	ldr	r1, [fp, #-12]
	mov	r2, r3
	bl	pop_laiser
	ldr	r0, [fp, #-8]
	ldr	r1, [fp, #-12]
	bl	d_edge_laiser
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, lr}
	bx	lr
	.size	move_laiser, .-move_laiser
	.align	2
	.global	black_back
	.type	black_back, %function
black_back:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	mov	r3, #100663296
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L159
.L160:
	ldr	r3, [fp, #-8]
	mov	r2, #0
	strh	r2, [r3]	@ movhi
	ldr	r3, [fp, #-8]
	add	r3, r3, #2
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L159:
	ldr	r3, [fp, #-12]
	cmp	r3, #38400
	blt	.L160
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	black_back, .-black_back
	.align	2
	.global	back
	.type	back, %function
back:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	mov	r3, #100663296
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L162
.L163:
	ldr	r3, [fp, #-8]
	ldr	r2, .L164
	strh	r2, [r3]	@ movhi
	ldr	r3, [fp, #-8]
	add	r3, r3, #2
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L162:
	ldr	r3, [fp, #-12]
	cmp	r3, #38400
	blt	.L163
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L165:
	.align	2
.L164:
	.word	32736
	.size	back, .-back
	.align	2
	.global	pop_g_p
	.type	pop_g_p, %function
pop_g_p:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	mov	r3, r2
	strh	r3, [fp, #-22]	@ movhi
	ldrh	r3, [fp, #-22]
	ldr	r0, [fp, #-16]
	ldr	r1, [fp, #-20]
	mov	r2, r3
	bl	draw_point
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L167
.L168:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	rsb	r2, r3, r2
	ldrh	r3, [fp, #-22]
	mov	r0, r2
	ldr	r1, [fp, #-20]
	mov	r2, r3
	bl	draw_point
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r2, r2, r3
	ldrh	r3, [fp, #-22]
	mov	r0, r2
	ldr	r1, [fp, #-20]
	mov	r2, r3
	bl	draw_point
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L167:
	ldr	r3, [fp, #-8]
	cmp	r3, #9
	ble	.L168
	ldr	r3, [fp, #-16]
	add	r2, r3, #10
	ldrh	r3, [fp, #-22]
	mov	r0, r2
	ldr	r1, [fp, #-20]
	mov	r2, r3
	bl	draw_point
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L169
.L170:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	rsb	r1, r3, r2
	ldr	r3, [fp, #-20]
	sub	r2, r3, #1
	ldrh	r3, [fp, #-22]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	draw_point
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r1, r2, r3
	ldr	r3, [fp, #-20]
	sub	r2, r3, #1
	ldrh	r3, [fp, #-22]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	draw_point
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r1, r2, r3
	ldr	r3, [fp, #-20]
	add	r2, r3, #1
	ldrh	r3, [fp, #-22]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	draw_point
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	rsb	r1, r3, r2
	ldr	r3, [fp, #-20]
	add	r2, r3, #1
	ldrh	r3, [fp, #-22]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	draw_point
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L169:
	ldr	r3, [fp, #-8]
	cmp	r3, #8
	ble	.L170
	ldr	r3, [fp, #-16]
	sub	r1, r3, #9
	ldr	r3, [fp, #-20]
	sub	r2, r3, #1
	ldrh	r3, [fp, #-22]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	draw_point
	ldr	r3, [fp, #-16]
	sub	r1, r3, #9
	ldr	r3, [fp, #-20]
	add	r2, r3, #1
	ldrh	r3, [fp, #-22]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	draw_point
	mov	r3, #1
	str	r3, [fp, #-8]
	b	.L171
.L172:
	ldr	r3, [fp, #-16]
	sub	r1, r3, #2
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-8]
	add	r2, r2, r3
	ldrh	r3, [fp, #-22]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	draw_point
	ldr	r3, [fp, #-16]
	sub	r1, r3, #2
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-8]
	rsb	r2, r3, r2
	ldrh	r3, [fp, #-22]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	draw_point
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L171:
	ldr	r3, [fp, #-8]
	cmp	r3, #10
	ble	.L172
	mov	r3, #1
	str	r3, [fp, #-8]
	b	.L173
.L174:
	ldr	r3, [fp, #-16]
	sub	r1, r3, #1
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-8]
	add	r2, r2, r3
	ldrh	r3, [fp, #-22]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	draw_point
	ldr	r3, [fp, #-16]
	sub	r1, r3, #1
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-8]
	rsb	r2, r3, r2
	ldrh	r3, [fp, #-22]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	draw_point
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L173:
	ldr	r3, [fp, #-8]
	cmp	r3, #9
	ble	.L174
	mov	r3, #1
	str	r3, [fp, #-8]
	b	.L175
.L176:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-8]
	add	r2, r2, r3
	ldrh	r3, [fp, #-22]
	ldr	r0, [fp, #-16]
	mov	r1, r2
	mov	r2, r3
	bl	draw_point
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-8]
	rsb	r2, r3, r2
	ldrh	r3, [fp, #-22]
	ldr	r0, [fp, #-16]
	mov	r1, r2
	mov	r2, r3
	bl	draw_point
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L175:
	ldr	r3, [fp, #-8]
	cmp	r3, #7
	ble	.L176
	mov	r3, #1
	str	r3, [fp, #-8]
	b	.L177
.L178:
	ldr	r3, [fp, #-16]
	add	r1, r3, #1
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-8]
	add	r2, r2, r3
	ldrh	r3, [fp, #-22]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	draw_point
	ldr	r3, [fp, #-16]
	add	r1, r3, #1
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-8]
	rsb	r2, r3, r2
	ldrh	r3, [fp, #-22]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	draw_point
	ldr	r3, [fp, #-16]
	sub	r1, r3, #3
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-8]
	add	r2, r2, r3
	ldrh	r3, [fp, #-22]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	draw_point
	ldr	r3, [fp, #-16]
	sub	r1, r3, #3
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-8]
	rsb	r2, r3, r2
	ldrh	r3, [fp, #-22]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	draw_point
	ldr	r3, [fp, #-16]
	sub	r1, r3, #9
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-8]
	add	r2, r2, r3
	ldrh	r3, [fp, #-22]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	draw_point
	ldr	r3, [fp, #-16]
	sub	r1, r3, #9
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-8]
	rsb	r2, r3, r2
	ldrh	r3, [fp, #-22]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	draw_point
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L177:
	ldr	r3, [fp, #-8]
	cmp	r3, #4
	ble	.L178
	mov	r3, #1
	str	r3, [fp, #-8]
	b	.L179
.L180:
	ldr	r3, [fp, #-16]
	sub	r1, r3, #8
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-8]
	add	r2, r2, r3
	ldrh	r3, [fp, #-22]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	draw_point
	ldr	r3, [fp, #-16]
	sub	r1, r3, #8
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-8]
	rsb	r2, r3, r2
	ldrh	r3, [fp, #-22]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	draw_point
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L179:
	ldr	r3, [fp, #-8]
	cmp	r3, #3
	ble	.L180
	ldr	r3, [fp, #-16]
	sub	r1, r3, #7
	ldr	r3, [fp, #-20]
	add	r2, r3, #2
	ldrh	r3, [fp, #-22]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	draw_point
	ldr	r3, [fp, #-16]
	sub	r1, r3, #7
	ldr	r3, [fp, #-20]
	sub	r2, r3, #2
	ldrh	r3, [fp, #-22]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	draw_point
	ldr	r3, [fp, #-16]
	sub	r1, r3, #4
	ldr	r3, [fp, #-20]
	add	r2, r3, #2
	ldrh	r3, [fp, #-22]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	draw_point
	ldr	r3, [fp, #-16]
	sub	r1, r3, #4
	ldr	r3, [fp, #-20]
	sub	r2, r3, #2
	ldrh	r3, [fp, #-22]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	draw_point
	ldr	r3, [fp, #-16]
	add	r1, r3, #2
	ldr	r3, [fp, #-20]
	add	r2, r3, #2
	ldrh	r3, [fp, #-22]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	draw_point
	ldr	r3, [fp, #-16]
	add	r1, r3, #2
	ldr	r3, [fp, #-20]
	sub	r2, r3, #2
	ldrh	r3, [fp, #-22]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	draw_point
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, lr}
	bx	lr
	.size	pop_g_p, .-pop_g_p
	.align	2
	.global	d_edge_g_p
	.type	d_edge_g_p, %function
d_edge_g_p:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L182
.L183:
	ldr	r3, [fp, #-16]
	sub	r1, r3, #9
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	mov	r0, r1
	mov	r1, r3
	ldr	r2, .L192
	bl	draw_point
	ldr	r3, [fp, #-16]
	sub	r1, r3, #9
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-8]
	rsb	r3, r3, r2
	mov	r0, r1
	mov	r1, r3
	ldr	r2, .L192
	bl	draw_point
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L182:
	ldr	r3, [fp, #-8]
	cmp	r3, #4
	ble	.L183
	mov	r3, #3
	str	r3, [fp, #-8]
	b	.L184
.L185:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L192
	bl	draw_point
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	sub	r3, r3, #1
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L192
	bl	draw_point
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L184:
	ldr	r3, [fp, #-8]
	cmp	r3, #8
	ble	.L185
	ldr	r3, [fp, #-16]
	add	r3, r3, #9
	mov	r0, r3
	ldr	r1, [fp, #-20]
	ldr	r2, .L192
	bl	draw_point
	ldr	r3, [fp, #-16]
	add	r3, r3, #10
	mov	r0, r3
	ldr	r1, [fp, #-20]
	ldr	r2, .L192
	bl	draw_point
	ldr	r3, [fp, #-16]
	sub	r2, r3, #3
	ldr	r3, [fp, #-20]
	add	r3, r3, #4
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L192
	bl	draw_point
	ldr	r3, [fp, #-16]
	sub	r2, r3, #3
	ldr	r3, [fp, #-20]
	add	r3, r3, #3
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L192
	bl	draw_point
	ldr	r3, [fp, #-16]
	sub	r2, r3, #3
	ldr	r3, [fp, #-20]
	sub	r3, r3, #4
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L192
	bl	draw_point
	ldr	r3, [fp, #-16]
	sub	r2, r3, #3
	ldr	r3, [fp, #-20]
	sub	r3, r3, #3
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L192
	bl	draw_point
	ldr	r3, [fp, #-16]
	sub	r2, r3, #4
	ldr	r3, [fp, #-20]
	add	r3, r3, #2
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L192
	bl	draw_point
	ldr	r3, [fp, #-16]
	sub	r2, r3, #4
	ldr	r3, [fp, #-20]
	sub	r3, r3, #2
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L192
	bl	draw_point
	mov	r3, #5
	str	r3, [fp, #-8]
	b	.L186
.L187:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	rsb	r2, r3, r2
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L192
	bl	draw_point
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	rsb	r2, r3, r2
	ldr	r3, [fp, #-20]
	sub	r3, r3, #1
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L192
	bl	draw_point
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L186:
	ldr	r3, [fp, #-8]
	cmp	r3, #6
	ble	.L187
	ldr	r3, [fp, #-16]
	sub	r2, r3, #7
	ldr	r3, [fp, #-20]
	add	r3, r3, #2
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L192
	bl	draw_point
	ldr	r3, [fp, #-16]
	sub	r2, r3, #7
	ldr	r3, [fp, #-20]
	sub	r3, r3, #2
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L192
	bl	draw_point
	ldr	r3, [fp, #-16]
	sub	r2, r3, #8
	ldr	r3, [fp, #-20]
	add	r3, r3, #3
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L192
	bl	draw_point
	ldr	r3, [fp, #-16]
	sub	r2, r3, #8
	ldr	r3, [fp, #-20]
	sub	r3, r3, #3
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L192
	bl	draw_point
	mov	r3, #5
	str	r3, [fp, #-8]
	b	.L188
.L189:
	ldr	r3, [fp, #-16]
	sub	r1, r3, #2
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	mov	r0, r1
	mov	r1, r3
	ldr	r2, .L192
	bl	draw_point
	ldr	r3, [fp, #-16]
	sub	r1, r3, #2
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-8]
	rsb	r3, r3, r2
	mov	r0, r1
	mov	r1, r3
	ldr	r2, .L192
	bl	draw_point
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L188:
	ldr	r3, [fp, #-8]
	cmp	r3, #10
	ble	.L189
	ldr	r3, [fp, #-16]
	sub	r2, r3, #1
	ldr	r3, [fp, #-20]
	add	r3, r3, #9
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L192
	bl	draw_point
	ldr	r3, [fp, #-16]
	sub	r2, r3, #1
	ldr	r3, [fp, #-20]
	sub	r3, r3, #9
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L192
	bl	draw_point
	ldr	r3, [fp, #-16]
	sub	r2, r3, #1
	ldr	r3, [fp, #-20]
	add	r3, r3, #8
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L192
	bl	draw_point
	ldr	r3, [fp, #-16]
	sub	r2, r3, #1
	ldr	r3, [fp, #-20]
	sub	r3, r3, #8
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L192
	bl	draw_point
	mov	r3, #5
	str	r3, [fp, #-8]
	b	.L190
.L191:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	ldr	r0, [fp, #-16]
	mov	r1, r3
	ldr	r2, .L192
	bl	draw_point
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-8]
	rsb	r3, r3, r2
	ldr	r0, [fp, #-16]
	mov	r1, r3
	ldr	r2, .L192
	bl	draw_point
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L190:
	ldr	r3, [fp, #-8]
	cmp	r3, #7
	ble	.L191
	ldr	r3, [fp, #-16]
	add	r2, r3, #1
	ldr	r3, [fp, #-20]
	add	r3, r3, #4
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L192
	bl	draw_point
	ldr	r3, [fp, #-16]
	add	r2, r3, #1
	ldr	r3, [fp, #-20]
	add	r3, r3, #3
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L192
	bl	draw_point
	ldr	r3, [fp, #-16]
	add	r2, r3, #1
	ldr	r3, [fp, #-20]
	sub	r3, r3, #4
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L192
	bl	draw_point
	ldr	r3, [fp, #-16]
	add	r2, r3, #1
	ldr	r3, [fp, #-20]
	sub	r3, r3, #3
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L192
	bl	draw_point
	ldr	r3, [fp, #-16]
	add	r2, r3, #2
	ldr	r3, [fp, #-20]
	add	r3, r3, #2
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L192
	bl	draw_point
	ldr	r3, [fp, #-16]
	add	r2, r3, #2
	ldr	r3, [fp, #-20]
	sub	r3, r3, #2
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L192
	bl	draw_point
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, lr}
	bx	lr
.L193:
	.align	2
.L192:
	.word	32736
	.size	d_edge_g_p, .-d_edge_g_p
	.align	2
	.global	pop_laiser
	.type	pop_laiser, %function
pop_laiser:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	mov	r3, r2
	strh	r3, [fp, #-22]	@ movhi
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L195
.L196:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r1, r2, r3
	ldr	r3, [fp, #-20]
	sub	r2, r3, #1
	ldrh	r3, [fp, #-22]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	draw_point
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	rsb	r1, r3, r2
	ldr	r3, [fp, #-20]
	sub	r2, r3, #1
	ldrh	r3, [fp, #-22]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	draw_point
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	mov	r0, r3
	ldr	r1, [fp, #-20]
	ldr	r2, .L197
	bl	draw_point
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	rsb	r3, r3, r2
	mov	r0, r3
	ldr	r1, [fp, #-20]
	ldr	r2, .L197
	bl	draw_point
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r1, r2, r3
	ldr	r3, [fp, #-20]
	add	r2, r3, #1
	ldrh	r3, [fp, #-22]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	draw_point
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	rsb	r1, r3, r2
	ldr	r3, [fp, #-20]
	add	r2, r3, #1
	ldrh	r3, [fp, #-22]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	draw_point
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L195:
	ldr	r3, [fp, #-8]
	cmp	r3, #9
	ble	.L196
	ldr	r3, [fp, #-16]
	sub	r2, r3, #10
	ldrh	r3, [fp, #-22]
	mov	r0, r2
	ldr	r1, [fp, #-20]
	mov	r2, r3
	bl	draw_point
	ldr	r3, [fp, #-16]
	add	r2, r3, #10
	ldrh	r3, [fp, #-22]
	mov	r0, r2
	ldr	r1, [fp, #-20]
	mov	r2, r3
	bl	draw_point
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, lr}
	bx	lr
.L198:
	.align	2
.L197:
	.word	32767
	.size	pop_laiser, .-pop_laiser
	.align	2
	.global	d_edge_laiser
	.type	d_edge_laiser, %function
d_edge_laiser:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r3, [fp, #-8]
	add	r2, r3, #9
	ldr	r3, [fp, #-12]
	sub	r3, r3, #1
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L200
	bl	draw_point
	ldr	r3, [fp, #-8]
	add	r3, r3, #10
	mov	r0, r3
	ldr	r1, [fp, #-12]
	ldr	r2, .L200
	bl	draw_point
	ldr	r3, [fp, #-8]
	add	r2, r3, #9
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L200
	bl	draw_point
	ldr	r3, [fp, #-8]
	sub	r3, r3, #10
	mov	r0, r3
	ldr	r1, [fp, #-12]
	ldr	r2, .L200+4
	bl	draw_point
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, lr}
	bx	lr
.L201:
	.align	2
.L200:
	.word	32736
	.word	32767
	.size	d_edge_laiser, .-d_edge_laiser
	.align	2
	.global	pop_heart
	.type	pop_heart, %function
pop_heart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	mov	r3, r2
	strh	r3, [fp, #-22]	@ movhi
	mvn	r3, #2
	str	r3, [fp, #-8]
	b	.L203
.L204:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-8]
	add	r2, r2, r3
	ldrh	r3, [fp, #-22]
	ldr	r0, [fp, #-16]
	mov	r1, r2
	mov	r2, r3
	bl	draw_point
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L203:
	ldr	r3, [fp, #-8]
	cmp	r3, #5
	ble	.L204
	mvn	r3, #3
	str	r3, [fp, #-8]
	b	.L205
.L206:
	ldr	r3, [fp, #-16]
	add	r1, r3, #1
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-8]
	add	r2, r2, r3
	ldrh	r3, [fp, #-22]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	draw_point
	ldr	r3, [fp, #-16]
	sub	r1, r3, #1
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-8]
	add	r2, r2, r3
	ldrh	r3, [fp, #-22]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	draw_point
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L205:
	ldr	r3, [fp, #-8]
	cmp	r3, #4
	ble	.L206
	mvn	r3, #4
	str	r3, [fp, #-8]
	b	.L207
.L208:
	ldr	r3, [fp, #-16]
	add	r1, r3, #2
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-8]
	add	r2, r2, r3
	ldrh	r3, [fp, #-22]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	draw_point
	ldr	r3, [fp, #-16]
	sub	r1, r3, #2
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-8]
	add	r2, r2, r3
	ldrh	r3, [fp, #-22]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	draw_point
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L207:
	ldr	r3, [fp, #-8]
	cmp	r3, #3
	ble	.L208
	mvn	r3, #4
	str	r3, [fp, #-8]
	b	.L209
.L210:
	ldr	r3, [fp, #-16]
	add	r1, r3, #3
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-8]
	add	r2, r2, r3
	ldrh	r3, [fp, #-22]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	draw_point
	ldr	r3, [fp, #-16]
	sub	r1, r3, #3
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-8]
	add	r2, r2, r3
	ldrh	r3, [fp, #-22]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	draw_point
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L209:
	ldr	r3, [fp, #-8]
	cmp	r3, #2
	ble	.L210
	mvn	r3, #3
	str	r3, [fp, #-8]
	b	.L211
.L212:
	ldr	r3, [fp, #-16]
	add	r1, r3, #4
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-8]
	add	r2, r2, r3
	ldrh	r3, [fp, #-22]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	draw_point
	ldr	r3, [fp, #-16]
	sub	r1, r3, #4
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-8]
	add	r2, r2, r3
	ldrh	r3, [fp, #-22]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	draw_point
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L211:
	ldr	r3, [fp, #-8]
	cmp	r3, #1
	ble	.L212
	mvn	r3, #2
	str	r3, [fp, #-8]
	b	.L213
.L214:
	ldr	r3, [fp, #-16]
	add	r1, r3, #5
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-8]
	add	r2, r2, r3
	ldrh	r3, [fp, #-22]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	draw_point
	ldr	r3, [fp, #-16]
	sub	r1, r3, #5
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-8]
	add	r2, r2, r3
	ldrh	r3, [fp, #-22]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	draw_point
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L213:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	ble	.L214
	ldrh	r3, [fp, #-22]
	cmp	r3, #31
	bne	.L202
	ldr	r3, [fp, #-16]
	sub	r2, r3, #5
	ldr	r3, [fp, #-20]
	sub	r3, r3, #2
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L216
	bl	draw_point
	ldr	r3, [fp, #-16]
	sub	r3, r3, #5
	mov	r0, r3
	ldr	r1, [fp, #-20]
	ldr	r2, .L216
	bl	draw_point
	ldr	r3, [fp, #-16]
	sub	r2, r3, #5
	ldr	r3, [fp, #-20]
	sub	r3, r3, #1
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L216
	bl	draw_point
	ldr	r3, [fp, #-16]
	sub	r3, r3, #4
	mov	r0, r3
	ldr	r1, [fp, #-20]
	ldr	r2, .L216
	bl	draw_point
	ldr	r3, [fp, #-16]
	sub	r2, r3, #4
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L216
	bl	draw_point
	ldr	r3, [fp, #-16]
	sub	r2, r3, #3
	ldr	r3, [fp, #-20]
	add	r3, r3, #2
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L216
	bl	draw_point
	ldr	r3, [fp, #-16]
	sub	r2, r3, #2
	ldr	r3, [fp, #-20]
	add	r3, r3, #3
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L216
	bl	draw_point
	ldr	r3, [fp, #-16]
	sub	r2, r3, #1
	ldr	r3, [fp, #-20]
	add	r3, r3, #3
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L216
	bl	draw_point
	ldr	r3, [fp, #-16]
	sub	r2, r3, #3
	ldr	r3, [fp, #-20]
	add	r3, r3, #2
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L216
	bl	draw_point
	ldr	r3, [fp, #-16]
	sub	r2, r3, #3
	ldr	r3, [fp, #-20]
	sub	r3, r3, #4
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L216+4
	bl	draw_point
	ldr	r3, [fp, #-16]
	sub	r2, r3, #4
	ldr	r3, [fp, #-20]
	sub	r3, r3, #2
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L216+4
	bl	draw_point
	ldr	r3, [fp, #-16]
	sub	r2, r3, #3
	ldr	r3, [fp, #-20]
	sub	r3, r3, #3
	mov	r0, r2
	mov	r1, r3
	ldr	r2, .L216+4
	bl	draw_point
	ldr	r3, [fp, #-16]
	add	r2, r3, #1
	ldr	r3, [fp, #-20]
	add	r3, r3, #4
	mov	r0, r2
	mov	r1, r3
	mov	r2, #15
	bl	draw_point
	ldr	r3, [fp, #-16]
	add	r2, r3, #2
	ldr	r3, [fp, #-20]
	add	r3, r3, #3
	mov	r0, r2
	mov	r1, r3
	mov	r2, #15
	bl	draw_point
.L202:
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, lr}
	bx	lr
.L217:
	.align	2
.L216:
	.word	15711
	.word	32767
	.size	pop_heart, .-pop_heart
	.align	2
	.global	distance
	.type	distance, %function
distance:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	str	r2, [fp, #-16]
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	rsb	r3, r3, r2
	cmp	r3, #19
	bgt	.L219
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	rsb	r3, r3, r2
	cmn	r3, #19
	blt	.L219
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-20]
	rsb	r3, r3, r2
	cmp	r3, #9
	bgt	.L219
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-20]
	rsb	r3, r3, r2
	cmn	r3, #9
	blt	.L219
	mov	r3, #1
	b	.L220
.L219:
	mov	r3, #0
.L220:
	mov	r0, r3
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	distance, .-distance
	.ident	"GCC: (devkitARM release 44) 4.9.2"
