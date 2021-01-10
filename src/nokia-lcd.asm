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

	; Function set (0-0-1-0-0-PD-V-H):
	; Power down control (PD), addressing mode (V), instruction set (H)

	lda #DISABLED
	sta PORTB

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
	lda #(COMMAND | LOW) ; Activate chip
	sta PORTB

	lda #(COMMAND | LOW | TICK)
	sta PORTB

	; DB1 (V)
	lda #(COMMAND | LOW) ; Horizontal addressing
	sta PORTB

	lda #(COMMAND | LOW | TICK)
	sta PORTB

	; DB0 (H)
	lda #(COMMAND | HIGH) ; Extended instruction set
	sta PORTB

	lda #(COMMAND | HIGH | TICK)
	sta PORTB

	lda #DISABLED
	sta PORTB






	; Write VOP (constrast) to register (1-V6-V5-V4-V3-V2-V1-V0):

	lda #DISABLED
	sta PORTB

	lda #(COMMAND | DISABLED)
	sta PORTB

	lda #(COMMAND)
	sta PORTB

	; DB7
	lda #(COMMAND | HIGH)
	sta PORTB

	lda #(COMMAND | HIGH | TICK)
	sta PORTB

	; DB6 (V6)
	lda #(COMMAND | LOW)
	sta PORTB

	lda #(COMMAND | LOW | TICK)
	sta PORTB

	; DB5 (V5)
	lda #(COMMAND | LOW)
	sta PORTB

	lda #(COMMAND | LOW | TICK)
	sta PORTB

	; DB4 (V4)
	lda #(COMMAND | HIGH)
	sta PORTB

	lda #(COMMAND | HIGH | TICK)
	sta PORTB

	; DB3 (V3)
	lda #(COMMAND | LOW)
	sta PORTB

	lda #(COMMAND | LOW | TICK)
	sta PORTB

	; DB2 (V2)
	lda #(COMMAND | LOW)
	sta PORTB

	lda #(COMMAND | LOW | TICK)
	sta PORTB

	; DB1 (V1)
	lda #(COMMAND | LOW)
	sta PORTB

	lda #(COMMAND | LOW | TICK)
	sta PORTB

	; DB0 (V0)
	lda #(COMMAND | LOW)
	sta PORTB

	lda #(COMMAND | LOW | TICK)
	sta PORTB

	lda #DISABLED
	sta PORTB






	; Function set (0-0-1-0-0-PD-V-H):
	; Power down control (PD), addressing mode (V), instruction set (H)

	lda #DISABLED
	sta PORTB

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
	lda #(COMMAND | LOW) ; Activate chip
	sta PORTB

	lda #(COMMAND | LOW | TICK)
	sta PORTB

	; DB1 (V)
	lda #(COMMAND | LOW) ; Horizontal addressing
	sta PORTB

	lda #(COMMAND | LOW | TICK)
	sta PORTB

	; DB0 (H)
	lda #(COMMAND | LOW) ; Basic instruction set
	sta PORTB

	lda #(COMMAND | LOW | TICK)
	sta PORTB

	lda #DISABLED
	sta PORTB






	; Display control (0-0-0-0-1-D-0-E):
	; Display bank - 00
	; Normal mode - 10
	; All segments on - 10
	; Inverse video mode - 11

	lda #DISABLED
	sta PORTB

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

	; DB2 (D)
	lda #(COMMAND | HIGH)
	sta PORTB

	lda #(COMMAND | HIGH | TICK)
	sta PORTB

	; DB1
	lda #(COMMAND | LOW)
	sta PORTB

	lda #(COMMAND | LOW | TICK)
	sta PORTB

	; DB0 (E)
	lda #(COMMAND | LOW)
	sta PORTB

	lda #(COMMAND | LOW | TICK)
	sta PORTB

	lda #DISABLED
	sta PORTB






	; Write data to LCD RAM

	lda #DISABLED
	sta PORTB

	lda #(COMMAND | DISABLED)
	sta PORTB

	lda #(COMMAND)
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

	lda #DISABLED
	sta PORTB
	
loop:
	jmp loop	

*=$fffc

!word main
!word $0000