%include 'in_out.asm'
section .data
msg1 db 'Введите B: ',0h
msg2 db "Наибольшее число из 44, 74 и 17 - это ",0h
A dd 44
B dd 74
C dd 17
section .bss
max resb 10
section .text
global _start
_start:
; ---------- Записываем 'A' в переменную 'max'
mov ecx,[A] ; 'ecx = A'
mov [max],ecx ; 'max = A'
; ---------- Сравниваем 'A' и 'B'
cmp ecx, [B]
jg check_C ; если 'A>B', то переход на метку 'check_C',
mov ecx,[B] ; иначе 'ecx = B'
mov [max],ecx ; 'max = B'
check_C:
mov eax,max
mov ecx,[max]
cmp ecx,[C] ; Сравниваем 'max(A,B)' и 'C'
jg fin ; если 'max(A,B)>C', то переход на 'fin',
mov ecx,[C] ; иначе 'ecx = C'
mov [max],ecx
; ---------- Вывод результата
fin:
mov eax, msg2
call sprint ; Вывод сообщения 'Наибольшее число: '
mov eax,[max]
call iprintLF ; Вывод 'max(A,B,C)'
call quit ; Выход