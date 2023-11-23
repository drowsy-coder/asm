ORG 0000H

REPEAT:
    MOV TMOD, #60H  ; Set Timer 1 in Mode 1 (8-bit auto-reload)
    MOV TH1, #0      ; Initialize the high byte of Timer 1 with 0
    SETB P3.5        ; Set P3.5 high
    SETB TR1         ; Start Timer 1

BACK:
    MOV A, TL1       ; Move the low byte of Timer 1 to register A
    MOV P1, A        ; Output the value of A to P1
    JNB TF1, BACK    ; Jump back to BACK if Timer 1 has not overflowed
    CLR TR1          ; Clear Timer 1 run control bit
    CLR TF1          ; Clear Timer 1 overflow flag
    SJMP REPEAT      ; Jump back to REPEAT to restart the process

END
