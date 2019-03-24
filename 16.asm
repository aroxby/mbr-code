org 0x7C00
use16

cli
mov al, '*'
mov ah, 7
mov dx ,0xb800
mov ds, dx
mov [0], ax
Done:
hlt
jmp Done


times 510-($-$$) db 90h
dw 0AA55h
;times 1509949-($-$$) db 0