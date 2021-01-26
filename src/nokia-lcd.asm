!to "build/nokia-lcd.bin"

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

;///////////////////////////////////////////////////////////////////////

main:
	; Set stack pointer to address 01ff
 	ldx #$ff 		
 	txs

	jsr lcd_init
	jsr lcd_clear

main_loop:
	lda #%11110000
	jsr lcd_data

	jsr delay

	lda #%00001111
	jsr lcd_data

	jsr delay
	
	jmp main_loop

;///////////////////////////////////////////////////////////////////////

lcd_init:
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