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

main:
	; Set all pins of port B to output
	lda #%11111111
	sta DDRB

	clc

	lda #DISABLED
	sta PORTB

	; Function set (0-0-1-0-0-PD-V-H):
	; Activate chip (PD), horizontal addressing (V), basic instruction set (H)

	; Bit one
	lda #(COMMAND | LOW | TICK)
	sta PORTB

	lda #(COMMAND | LOW)
	sta PORTB

	; Bit two
	lda #(COMMAND | LOW | TICK)
	sta PORTB

	lda #(COMMAND | LOW)
	sta PORTB

	; Bit three
	lda #(COMMAND | HIGH | TICK)
	sta PORTB

	lda #(COMMAND | HIGH)
	sta PORTB

	; Bit four
	lda #(COMMAND | LOW | TICK)
	sta PORTB

	lda #(COMMAND | LOW)
	sta PORTB

	; Bit five
	lda #(COMMAND | LOW | TICK)
	sta PORTB

	lda #(COMMAND | LOW)
	sta PORTB

	; Bit six (PD)
	lda #(COMMAND | LOW | TICK)
	sta PORTB

	lda #(COMMAND | LOW)
	sta PORTB

	; Bit seven (V)
	lda #(COMMAND | LOW | TICK)
	sta PORTB

	lda #(COMMAND | LOW)
	sta PORTB

	;Bit eight (H)
	lda #(COMMAND | LOW | TICK)
	sta PORTB

	lda #(COMMAND | LOW)
	sta PORTB

	lda #DISABLED
	sta PORTB

	; Display control (0-0-0-0-1-D-0-E):
	; Display bank - 00
	; Normal mode - 10
	; All segments on - 10
	; Inverse video mode - 11

	; Bit one
	lda #(COMMAND | LOW | TICK)
	sta PORTB

	lda #(COMMAND | LOW)
	sta PORTB

	; Bit two
	lda #(COMMAND | LOW | TICK)
	sta PORTB

	lda #(COMMAND | LOW)
	sta PORTB

	; Bit three
	lda #(COMMAND | LOW | TICK)
	sta PORTB

	lda #(COMMAND | LOW)
	sta PORTB

	; Bit four
	lda #(COMMAND | LOW | TICK)
	sta PORTB

	lda #(COMMAND | LOW)
	sta PORTB

	; Bit five
	lda #(COMMAND | HIGH | TICK)
	sta PORTB

	lda #(COMMAND | HIGH)
	sta PORTB

	; Bit six (PD)
	lda #(COMMAND | HIGH | TICK)
	sta PORTB

	lda #(COMMAND | HIGH)
	sta PORTB

	; Bit seven (V)
	lda #(COMMAND | LOW | TICK)
	sta PORTB

	lda #(COMMAND | LOW)
	sta PORTB

	;Bit eight (H)
	lda #(COMMAND | LOW | TICK)
	sta PORTB

	lda #(COMMAND | LOW)
	sta PORTB

	lda #DISABLED
	sta PORTB
	
loop:
	lda #(DISABLED | TICK)
	sta PORTB

	lda #DISABLED
	sta PORTB

	jmp loop	

*=$fffc

!word main
!word $0000