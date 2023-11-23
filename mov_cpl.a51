ORG 0000H        ; Start the program at address 0000H

    MOV R0, #40H   ; Load the immediate value 40H into register R0
    MOV DPTR, #3000H  ; Load the immediate value 3000H into the data pointer (DPTR)
    MOV R2, #05H   ; Load the immediate value 05H into register R2

LOOP:
    MOV A, @R0     ; Load the byte at the memory address pointed by R0 into register A
    CPL A          ; Complement (invert) all the bits of register A
    MOVX @DPTR, A  ; Move the value of A to the external memory location pointed by DPTR
    INC R0         ; Increment the value in register R0
    INC DPTR       ; Increment the data pointer (move to the next memory location)
    DJNZ R2, LOOP  ; Decrement R2 and jump to LOOP if R2 is not zero

END             ; End of the program
