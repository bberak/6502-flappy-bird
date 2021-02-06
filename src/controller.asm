!to "build/controller.bin"

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

var_controller = $0200

var_controller_down_active	 = $0201
var_controller_left_active   = $0202
var_controller_up_active     = $0203
var_controller_right_active  = $0204
var_controller_a_active      = $0205
var_controller_b_active      = $0206

var_controller_down_pressed  = $0207
var_controller_left_pressed  = $0208
var_controller_up_pressed    = $0209
var_controller_right_pressed = $020a
var_controller_a_pressed  	 = $020b
var_controller_b_pressed     = $020c

*=$8000

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

	; Draw down button
	lda var_controller_down_active
	jsr draw_button

	; Draw left button
	lda var_controller_left_active
	jsr draw_button

	; Draw up button
	lda var_controller_up_active
	jsr draw_button

	; Draw right button
	lda var_controller_right_active
	jsr draw_button

	; Draw a button
	lda var_controller_a_active
	jsr draw_button

	; Draw b button
	lda var_controller_b_active
	jsr draw_button

	jmp main_loop

;///////////////////////////////////////////////////////////////////////

draw_button:
	bne draw_button_active
	lda #0
	jsr lcd_data
	jmp draw_button_break

draw_button_active:
	lda #255
	jsr lcd_data

draw_button_break:
	rts

;///////////////////////////////////////////////////////////////////////

controller_init:
	pha

	; Set all pins of port A to input
	lda #%00000000
	sta DDRA

	; Clear controller variables
	sta var_controller
	sta var_controller_down_active
	sta var_controller_left_active
	sta var_controller_up_active
	sta var_controller_right_active
	sta var_controller_a_active
	sta var_controller_b_active
	sta var_controller_down_pressed
	sta var_controller_left_pressed
	sta var_controller_up_pressed
	sta var_controller_right_pressed
	sta var_controller_a_pressed
	sta var_controller_b_pressed

	pla

	rts

;///////////////////////////////////////////////////////////////////////

controller_read:
	pha
	phx
	phy

	; Store current controller state in x register
	ldx PORTA

	; Store previous controller state in y register
	ldy var_controller

	txa
	and #DOWN
	sta var_controller_down_active

	txa
	and #LEFT
	sta var_controller_left_active

	txa
	and #UP
	sta var_controller_up_active

	txa
	and #RIGHT
	sta var_controller_right_active

	txa
	and #A
	sta var_controller_a_active

	txa
	and #B
	sta var_controller_b_active

controller_read_down_pressed:
	tya
	and #DOWN
	bne controller_read_down_not_pressed 
	lda var_controller_down_active
	beq controller_read_down_not_pressed
	sta var_controller_down_pressed
	jmp controller_read_left_pressed

controller_read_down_not_pressed:
	lda #0
	sta var_controller_down_pressed

controller_read_left_pressed:
	tya
	and #LEFT
	bne controller_read_left_not_pressed 
	lda var_controller_left_active
	beq controller_read_left_not_pressed
	sta var_controller_left_pressed
	jmp controller_read_up_pressed

controller_read_left_not_pressed:
	lda #0
	sta var_controller_left_pressed

controller_read_up_pressed:
	tya
	and #UP
	bne controller_read_up_not_pressed 
	lda var_controller_up_active
	beq controller_read_up_not_pressed
	sta var_controller_up_pressed
	jmp controller_read_right_pressed

controller_read_up_not_pressed:
	lda #0
	sta var_controller_up_pressed

controller_read_right_pressed:
	tya
	and #RIGHT
	bne controller_read_right_not_pressed 
	lda var_controller_right_active
	beq controller_read_right_not_pressed
	sta var_controller_right_pressed
	jmp controller_read_a_pressed

controller_read_right_not_pressed:
	lda #0
	sta var_controller_right_pressed

controller_read_a_pressed:
	tya
	and #A
	bne controller_read_a_not_pressed 
	lda var_controller_a_active
	beq controller_read_a_not_pressed
	sta var_controller_a_pressed
	jmp controller_read_b_pressed

controller_read_a_not_pressed:
	lda #0
	sta var_controller_a_pressed

controller_read_b_pressed:
	tya
	and #B
	bne controller_read_b_not_pressed 
	lda var_controller_b_active
	beq controller_read_b_not_pressed
	sta var_controller_b_pressed
	jmp controller_read_break

controller_read_b_not_pressed:
	lda #0
	sta var_controller_b_pressed

controller_read_break:
	; Save current controller state
	stx var_controller

	ply
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