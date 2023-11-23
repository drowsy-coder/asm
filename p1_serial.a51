ORG 0000H
    MOV TMOD, #20H   ; Set Timer 1 in Mode 2 (8-bit auto-reload)
    MOV TH1, #0FAH   ; Set the reload value for Timer 1 for baud rate adjustment
    MOV SCON, #50H   ; Set Serial Communication Mode 1 and enable receiver
    SETB TR1         ; Start Timer 1

HERE:
    JNB RI, HERE     ; Wait until Receive Interrupt (RI) is set
    MOV A, SBUF      ; Move the received character from Serial Buffer (SBUF) to A
    MOV P1, A        ; Output the character to Port 1 (P1)
    CLR RI           ; Clear Receive Interrupt flag
    SJMP HERE        ; Repeat the process

END
