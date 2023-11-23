ORG 0000H

    MOV TMOD, #10H   ; Set Timer 1 in Mode 1 (16-bit mode)

REPEAT:
    MOV R0, #21       ; Initialize R0 with a value (number of cycles or duration)
    CPL P1.7          ; Toggle the state of P1.7 (complement the value)

BACK:
    MOV TH1, #00H     ; Initialize the high byte of Timer 1 with 0
    SETB TR1          ; Start Timer 1

AGAIN:
    JNB TF1, AGAIN    ; Wait until Timer 1 overflows (TF1 is set)
    CLR TR1           ; Clear Timer 1 run control bit
    CLR TF1           ; Clear Timer 1 overflow flag

    DJNZ R0, BACK     ; Decrement R0 and jump back to BACK if R0 is not zero

    SJMP REPEAT       ; Jump back to REPEAT to restart the process

END