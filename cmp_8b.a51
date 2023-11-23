MOV DPTR, #8000H    ; Set DPTR to address 8000H
MOVX A, @DPTR       ; Move the content of the external memory location addressed by DPTR to A
MOV R0, A           ; Copy the value in A to register R0
INC DPTR            ; Increment DPTR to point to the next memory location
MOVX A, @DPTR       ; Move the content of the new external memory location to A

CLR C               ; Clear the carry flag
SUBB A, R0          ; Subtract the value in R0 from the value in A with borrow

JZ EQUAL            ; Jump to EQUAL if the result is zero (A - R0 == 0)
JNC SMALL           ; Jump to SMALL if there is no borrow (A < R0)
SETB 7FH            ; Set the bit at address 7FH (some flag or indicator)
SJMP END1           ; Jump to END1

SMALL: SETB 78H      ; Set the bit at address 78H (some other flag or indicator)
SJMP END1           ; Jump to END1

EQUAL: CLR 78H       ; Clear the bit at address 78H
CLR 7FH             ; Clear the bit at address 7FH

END1: NOP            ; No operation (placeholder, can be used for debugging)

END                ; End of the program
