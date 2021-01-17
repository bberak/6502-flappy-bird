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

	; LcdWrite(LCD_C, 0x21 );  // LCD Extended Commands. %00100001
	; LcdWrite(LCD_C, 0xB5 );  // Set LCD Vop (Contrast). %10110101
	; LcdWrite(LCD_C, 0x14 );  // LCD bias mode 1:48. %00010100
	; LcdWrite(LCD_C, 0x20 );  // LCD Basic Commands. %00100001
	; LcdWrite(LCD_C, 0x0C );  // Display control. %00001100

	; LcdWrite(LCD_D, 0xFF);
	; LcdWrite(LCD_D, 0xF0);
	; LcdWrite(LCD_D, 0x0F);






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