ORG 0000H

    MOV TMOD, #20H   ; Set Timer 1 in Mode 2 (8-bit auto-reload)
    MOV TH1, #0FDH   ; Set the reload value for Timer 1 for 9600 baud at 11.0592 MHz
    MOV SCON, #50H   ; Set Serial Communication Mode 1 and enable receiver

    SETB TR1         ; Start Timer 1

AGAIN:
    MOV A, #'V'      ; Load the ASCII value of 'V' into register A
    ACALL TRANS      ; Call the subroutine TRANS to send the character
    MOV A, #'I'      ; Load the ASCII value of 'I' into register A
    ACALL TRANS      ; Call the subroutine TRANS to send the character
    MOV A, #'T'      ; Load the ASCII value of 'T' into register A
    ACALL TRANS      ; Call the subroutine TRANS to send the character
    MOV A, #' '      ; Load the ASCII value of space into register A
    ACALL TRANS      ; Call the subroutine TRANS to send the character
    SJMP AGAIN       ; Jump back to AGAIN to repeat the process

TRANS:
    MOV SBUF, A      ; Move the value in register A to the Serial Buffer (SBUF)

WAIT_TI:
    JNB TI, WAIT_TI  ; Wait until the transmit buffer is empty (TI is set)
    CLR TI           ; Clear the transmit interrupt flag
    RET              ; Return from the subroutine TRANS

HERE:
    JNB TF1, HERE    ; Wait until Timer 1 overflows (TF1 is set)
    CLR TF1          ; Clear Timer 1 overflow flag
    SJMP AGAIN       ; Jump back to AGAIN to repeat the process

END
