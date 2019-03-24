org 0x7C00
use16

cli
mov bp, sp
jmp boot

my_gdtr:
  dw 24
  dd my_gdt

my_gdt:
  dq 0

  dw 0ffffh
  dw 0
  db 0
  db 10011010b
  db 0cfh
  db 0
  
  dw 0ffffh
  dw 0
  db 0
  db 10010010b
  db 0cfh
  db 0

boot:
lgdt [my_gdtr]
mov eax, cr0
or eax, 1
mov cr0, eax
jmp 8:Boot32

use32

Boot32:
mov al, '*'
mov ah, 7
mov [0b8000h], ax

Quit32:
hlt
jmp Quit32

times 510-($-$$) db 90h
dw 0AA55h
;times 1509949-($-$$) db 0