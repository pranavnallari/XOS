ORG 0x7C00
BITS 16

start:
    jmp main

print:
    push si
    push ax
    push bx

.loop:
    lodsb
    or al, al
    jz .done

    mov ah, 0x0E
    mov bh, 0
    int 0x10

    jmp .loop
    
.done:
    pop bx
    pop ax
    pop si
    ret

main:
    mov ax, 0
    mov ds, ax
    mov es, ax
    
    mov ss, ax
    mov sp, 0x7C00

    mov si, msg
    call print
    
    hlt
    jmp $

msg: db 'Hello World', 0x0D, 0x0A, 0

TIMES 510 - ($ - $$) db 0
dw 0xAA55


