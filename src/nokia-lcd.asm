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

	lda #DISABLED
	sta PORTB

setup:
	; COMMAND %00100001 (Extended Instruction Set)

	lda #(COMMAND | DISABLED)
	sta PORTB

	lda #(COMMAND)
	sta PORTB

	; DB7
	lda #(COMMAND | LOW)
	sta PORTB

	lda #(COMMAND | LOW | TICK)
	sta PORTB

	; DB6
	lda #(COMMAND | LOW)
	sta PORTB

	lda #(COMMAND | LOW | TICK)
	sta PORTB

	; DB5
	lda #(COMMAND | HIGH)
	sta PORTB

	lda #(COMMAND | HIGH | TICK)
	sta PORTB

	; DB4
	lda #(COMMAND | LOW)
	sta PORTB

	lda #(COMMAND | LOW | TICK)
	sta PORTB

	; DB3
	lda #(COMMAND | LOW)
	sta PORTB

	lda #(COMMAND | LOW | TICK)
	sta PORTB

	; DB2
	lda #(COMMAND | LOW)
	sta PORTB

	lda #(COMMAND | LOW | TICK)
	sta PORTB

	; DB1
	lda #(COMMAND | LOW)
	sta PORTB

	lda #(COMMAND | LOW | TICK)
	sta PORTB

	; DB0
	lda #(COMMAND | HIGH)
	sta PORTB

	lda #(COMMAND | HIGH | TICK)
	sta PORTB

	lda #(COMMAND | DISABLED)
	sta PORTB






	; COMMAND %10110101 (Contrast)

	lda #(COMMAND | DISABLED)
	sta PORTB

	lda #(COMMAND)
	sta PORTB

	; DB7
	lda #(COMMAND | HIGH)
	sta PORTB

	lda #(COMMAND | HIGH | TICK)
	sta PORTB

	; DB6
	lda #(COMMAND | LOW)
	sta PORTB

	lda #(COMMAND | LOW | TICK)
	sta PORTB

	; DB5
	lda #(COMMAND | HIGH)
	sta PORTB

	lda #(COMMAND | HIGH | TICK)
	sta PORTB

	; DB4
	lda #(COMMAND | HIGH)
	sta PORTB

	lda #(COMMAND | HIGH | TICK)
	sta PORTB

	; DB3
	lda #(COMMAND | LOW)
	sta PORTB

	lda #(COMMAND | LOW | TICK)
	sta PORTB

	; DB2
	lda #(COMMAND | HIGH)
	sta PORTB

	lda #(COMMAND | HIGH | TICK)
	sta PORTB

	; DB1
	lda #(COMMAND | LOW)
	sta PORTB

	lda #(COMMAND | LOW | TICK)
	sta PORTB

	; DB0
	lda #(COMMAND | HIGH)
	sta PORTB

	lda #(COMMAND | HIGH | TICK)
	sta PORTB

	lda #(COMMAND | DISABLED)
	sta PORTB






	; COMMAND %00010100 (Bias)

	lda #(COMMAND | DISABLED)
	sta PORTB

	lda #(COMMAND)
	sta PORTB

	; DB7
	lda #(COMMAND | LOW)
	sta PORTB

	lda #(COMMAND | LOW | TICK)
	sta PORTB

	; DB6
	lda #(COMMAND | LOW)
	sta PORTB

	lda #(COMMAND | LOW | TICK)
	sta PORTB

	; DB5
	lda #(COMMAND | LOW)
	sta PORTB

	lda #(COMMAND | LOW | TICK)
	sta PORTB

	; DB4
	lda #(COMMAND | HIGH)
	sta PORTB

	lda #(COMMAND | HIGH | TICK)
	sta PORTB

	; DB3
	lda #(COMMAND | LOW)
	sta PORTB

	lda #(COMMAND | LOW | TICK)
	sta PORTB

	; DB2
	lda #(COMMAND | HIGH)
	sta PORTB

	lda #(COMMAND | HIGH | TICK)
	sta PORTB

	; DB1
	lda #(COMMAND | LOW)
	sta PORTB

	lda #(COMMAND | LOW | TICK)
	sta PORTB

	; DB0
	lda #(COMMAND | LOW)
	sta PORTB

	lda #(COMMAND | LOW | TICK)
	sta PORTB

	lda #(COMMAND | DISABLED)
	sta PORTB






	; COMMAND %00100000 (Basic Instruction Set)

	lda #(COMMAND | DISABLED)
	sta PORTB

	lda #(COMMAND)
	sta PORTB

	; DB7
	lda #(COMMAND | LOW)
	sta PORTB

	lda #(COMMAND | LOW | TICK)
	sta PORTB

	; DB6
	lda #(COMMAND | LOW)
	sta PORTB

	lda #(COMMAND | LOW | TICK)
	sta PORTB

	; DB5
	lda #(COMMAND | HIGH)
	sta PORTB

	lda #(COMMAND | HIGH | TICK)
	sta PORTB

	; DB4
	lda #(COMMAND | LOW)
	sta PORTB

	lda #(COMMAND | LOW | TICK)
	sta PORTB

	; DB3
	lda #(COMMAND | LOW)
	sta PORTB

	lda #(COMMAND | LOW | TICK)
	sta PORTB

	; DB2 (PD)
	lda #(COMMAND | LOW) 
	sta PORTB

	lda #(COMMAND | LOW | TICK)
	sta PORTB

	; DB1 (V)
	lda #(COMMAND | LOW)
	sta PORTB

	lda #(COMMAND | LOW | TICK)
	sta PORTB

	; DB0 (H)
	lda #(COMMAND | LOW)
	sta PORTB

	lda #(COMMAND | LOW | TICK)
	sta PORTB

	lda #(COMMAND | DISABLED)
	sta PORTB






	; COMMAND %00001100 (Display Control)

	lda #(COMMAND | DISABLED)
	sta PORTB

	lda #(COMMAND)
	sta PORTB

	; DB7
	lda #(COMMAND | LOW)
	sta PORTB

	lda #(COMMAND | LOW | TICK)
	sta PORTB

	; DB6
	lda #(COMMAND | LOW)
	sta PORTB

	lda #(COMMAND | LOW | TICK)
	sta PORTB

	; DB5
	lda #(COMMAND | LOW)
	sta PORTB

	lda #(COMMAND | LOW | TICK)
	sta PORTB

	; DB4
	lda #(COMMAND | LOW)
	sta PORTB

	lda #(COMMAND | LOW | TICK)
	sta PORTB

	; DB3
	lda #(COMMAND | HIGH)
	sta PORTB

	lda #(COMMAND | HIGH | TICK)
	sta PORTB

	; DB2
	lda #(COMMAND | HIGH)
	sta PORTB

	lda #(COMMAND | HIGH | TICK)
	sta PORTB

	; DB1
	lda #(COMMAND | LOW)
	sta PORTB

	lda #(COMMAND | LOW | TICK)
	sta PORTB

	; DB0
	lda #(COMMAND | LOW)
	sta PORTB

	lda #(COMMAND | LOW | TICK)
	sta PORTB

	lda #(COMMAND | DISABLED)
	sta PORTB

clear:
	ldx #255
	ldy #2

clear_loop:
	; DATA

	lda #(DATA | DISABLED)
	sta PORTB

	lda #(DATA)
	sta PORTB

	; DB7
	lda #(DATA | LOW)
	sta PORTB

	lda #(DATA | LOW | TICK)
	sta PORTB

	; DB6
	lda #(DATA | LOW)
	sta PORTB

	lda #(DATA | LOW | TICK)
	sta PORTB

	; DB5
	lda #(DATA | LOW)
	sta PORTB

	lda #(DATA | LOW | TICK)
	sta PORTB

	; DB4
	lda #(DATA | LOW)
	sta PORTB

	lda #(DATA | LOW | TICK)
	sta PORTB

	; DB3
	lda #(DATA | LOW)
	sta PORTB

	lda #(DATA | LOW | TICK)
	sta PORTB

	; DB2
	lda #(DATA | LOW)
	sta PORTB

	lda #(DATA | LOW | TICK)
	sta PORTB

	; DB1
	lda #(DATA | LOW)
	sta PORTB

	lda #(DATA | LOW | TICK)
	sta PORTB

	; DB0
	lda #(DATA | LOW)
	sta PORTB

	lda #(DATA | LOW | TICK)
	sta PORTB

	lda #(DATA | DISABLED)
	sta PORTB

	dex
	bne clear_loop

	ldx #255
	dey
	bne clear_loop

draw:

	; DATA

	lda #(DATA | DISABLED)
	sta PORTB

	lda #(DATA)
	sta PORTB

	; DB7
	lda #(DATA | HIGH)
	sta PORTB

	lda #(DATA | HIGH | TICK)
	sta PORTB

	; DB6
	lda #(DATA | HIGH)
	sta PORTB

	lda #(DATA | HIGH | TICK)
	sta PORTB

	; DB5
	lda #(DATA | HIGH)
	sta PORTB

	lda #(DATA | HIGH | TICK)
	sta PORTB

	; DB4
	lda #(DATA | HIGH)
	sta PORTB

	lda #(DATA | HIGH | TICK)
	sta PORTB

	; DB3
	lda #(DATA | HIGH)
	sta PORTB

	lda #(DATA | HIGH | TICK)
	sta PORTB

	; DB2
	lda #(DATA | HIGH)
	sta PORTB

	lda #(DATA | HIGH | TICK)
	sta PORTB

	; DB1
	lda #(DATA | HIGH)
	sta PORTB

	lda #(DATA | HIGH | TICK)
	sta PORTB

	; DB0
	lda #(DATA | HIGH)
	sta PORTB

	lda #(DATA | HIGH | TICK)
	sta PORTB

	lda #(DATA | DISABLED)
	sta PORTB






	; DATA

	lda #(DATA | DISABLED)
	sta PORTB

	lda #(DATA)
	sta PORTB

	; DB7
	lda #(DATA | HIGH)
	sta PORTB

	lda #(DATA | HIGH | TICK)
	sta PORTB

	; DB6
	lda #(DATA | HIGH)
	sta PORTB

	lda #(DATA | HIGH | TICK)
	sta PORTB

	; DB5
	lda #(DATA | HIGH)
	sta PORTB

	lda #(DATA | HIGH | TICK)
	sta PORTB

	; DB4
	lda #(DATA | HIGH)
	sta PORTB

	lda #(DATA | HIGH | TICK)
	sta PORTB

	; DB3
	lda #(DATA | HIGH)
	sta PORTB

	lda #(DATA | HIGH | TICK)
	sta PORTB

	; DB2
	lda #(DATA | HIGH)
	sta PORTB

	lda #(DATA | HIGH | TICK)
	sta PORTB

	; DB1
	lda #(DATA | HIGH)
	sta PORTB

	lda #(DATA | HIGH | TICK)
	sta PORTB

	; DB0
	lda #(DATA | HIGH)
	sta PORTB

	lda #(DATA | HIGH | TICK)
	sta PORTB

	lda #(DATA | DISABLED)
	sta PORTB
	
loop:
	jmp loop	

*=$fffc

!word main
!word $0000