!to "build/controller.bin"

*=$8000

PORTB = $6000
PORTA = $6001
DDRB  = $6002
DDRA  = $6003

DISABLED  = %00010000
DATA      = %00100000
COMMAND   = %00000000
HIGH      = %01000000
LOW       = %00000000
TICK	  = %10000000

DOWN	  = %00000001
LEFT	  = %00000010
UP		  = %00000100	
RIGHT	  = %00001000	
A  		  = %00010000
B 		  = %00100000	

controller = $0200

controller_down_active	 = $0201
controller_left_active   = $0202
controller_up_active     = $0203
controller_right_active  = $0204
controller_a_active      = $0205
controller_b_active      = $0206

controller_down_pressed  = $0207
controller_left_pressed  = $0208
controller_up_pressed    = $0209
controller_right_pressed = $020a
controller_a_pressed  	 = $020b
controller_b_pressed     = $020c

;///////////////////////////////////////////////////////////////////////

main:
	; Set stack pointer to address 01ff
 	ldx #$ff 		
 	txs

 	jsr controller_init
	jsr lcd_init
	jsr lcd_clear

main_loop:
	jsr controller_read

	; Set lcd x address to zero
	lda #%10000000
	jsr lcd_command

main_loop_draw_down:
	lda controller_down_active
	bne main_loop_down_is_active
	lda #0
	jsr lcd_data
	jmp main_loop_draw_left

main_loop_down_is_active:
	lda #255
	jsr lcd_data

main_loop_draw_left:
	lda controller_left_active
	bne main_loop_left_is_active
	lda #0
	jsr lcd_data
	jmp main_loop

main_loop_left_is_active:
	lda #255
	jsr lcd_data	
	
	jmp main_loop

;///////////////////////////////////////////////////////////////////////

controller_init:
	pha

	; Set all pins of port A to input
	lda #%00000000
	sta DDRA

	pla

	rts

controller_read:
	pha
	phx 

	ldx PORTA

	txa
	and #DOWN
	sta controller_down_active

	txa
	and #LEFT
	sta controller_left_active

	txa
	and #UP
	sta controller_up_active

	txa
	and #RIGHT
	sta controller_right_active

	txa
	and #A
	sta controller_a_active

	txa
	and #B
	sta controller_b_active

	plx
	pla

	rts 

;///////////////////////////////////////////////////////////////////////

lcd_init:
	pha

	; Set all pins of port B to output
	lda #%11111111
	sta DDRB

	lda #DISABLED
	sta PORTB

	; Extended instruction set
	lda #%00100001
	jsr lcd_command

	; Contrast
	lda #%10110101
	jsr lcd_command

	; Bias
	lda #%00010100
	jsr lcd_command

	; Basic nstruction Set
	lda #%00100000
	jsr lcd_command

	; Display control
	lda #%00001100
	jsr lcd_command

	pla

	rts

;///////////////////////////////////////////////////////////////////////

lcd_clear:
	pha
	phx
	phy

	; Perform a total of 504 (6 x 84) data write operations
	; to clear the entire lcd screen
	ldx #255
	ldy #249

lcd_clear_loop_x:
	lda #0
	jsr lcd_data

	dex
	bne lcd_clear_loop_x

lcd_clear_loop_y:
	lda #0
	jsr lcd_data	

	dey
	bne lcd_clear_loop_y

	ply
	plx
	pla

	rts

;///////////////////////////////////////////////////////////////////////

lcd_command:
	phx
	phy

	ldx #(COMMAND | DISABLED)
	stx PORTB

	ldx #(COMMAND)
	stx PORTB

	clc
	ldy #8

lcd_command_loop:
	rol
	bcs lcd_command_loop_high

lcd_command_loop_low:
	ldx #(COMMAND | LOW)
	stx PORTB

	ldx #(COMMAND | LOW | TICK)
	stx PORTB

	jmp lcd_command_loop_break

lcd_command_loop_high:
	ldx #(COMMAND | HIGH)
	stx PORTB

	ldx #(COMMAND | HIGH | TICK)
	stx PORTB

lcd_command_loop_break:
	dey
	bne lcd_command_loop

	ldx #(COMMAND | DISABLED)
	stx PORTB

	ply
	plx

	rts

;///////////////////////////////////////////////////////////////////////

lcd_data:
	phx
	phy

	ldx #(DATA | DISABLED)
	stx PORTB

	ldx #(DATA)
	stx PORTB

	clc
	ldy #8

lcd_data_loop:
	rol
	bcs lcd_data_loop_high

lcd_data_loop_low:
	ldx #(DATA | LOW)
	stx PORTB

	ldx #(DATA | LOW | TICK)
	stx PORTB

	jmp lcd_data_loop_break

lcd_data_loop_high:
	ldx #(DATA | HIGH)
	stx PORTB

	ldx #(DATA | HIGH | TICK)
	stx PORTB

lcd_data_loop_break:
	dey
	bne lcd_data_loop

	ldx #(DATA | DISABLED)
	stx PORTB

	ply
	plx

	rts

;///////////////////////////////////////////////////////////////////////

delay:
 phx
 phy
 ldx #255
 ldy #40

delay_loop:
 dex
 bne delay_loop
 dey 
 bne delay_loop

 ply 
 plx

 rts

 ;///////////////////////////////////////////////////////////////////////

*=$fffc

!word main
!word $0000