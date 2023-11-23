ORG 0000H
    MOV A, #20H        ; Load the value 0x20 into register A

    CJNE A, #30H, OVER ; Compare the value in A with 0x30, jump to OVER if not equal
    SJMP EXIT          ; Jump to EXIT if equal

OVER:
    JNC NEXT           ; Jump to NEXT if no carry (unsigned comparison)
    MOV R1, A          ; Move the value in A to register R1
    SJMP EXIT          ; Jump to EXIT

NEXT:
    MOV R2, A          ; Move the value in A to register R2

EXIT:
    NOP                ; No operation (placeholder, can be used for debugging)

END
