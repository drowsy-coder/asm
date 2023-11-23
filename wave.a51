ORG 0000H
    MOV TMOD, #01H   ; Set Timer 0 in Mode 1 (16-bit mode with auto-reload)
    
BACK:
    MOV TL0, #0FCH   ; Load the low byte of Timer 0 with an initial value
    MOV TH0, #0FFH   ; Load the high byte of Timer 0 with the reload value
    
    SETB TR0         ; Start Timer 0
    
AGAIN:
    JNB TF0, AGAIN   ; Wait until Timer 0 overflows (TF0 is set)
    
    CLR TR0          ; Clear Timer 0 run control bit
    CPL P2.7         ; Complement P2.7 to toggle its state
    
    CLR TF0          ; Clear Timer 0 overflow flag
    
    SJMP BACK        ; Jump back to BACK to repeat the process

END
