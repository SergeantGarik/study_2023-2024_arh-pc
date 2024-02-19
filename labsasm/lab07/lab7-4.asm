%include 'in_out.asm'
section .data
msg1 db 'Введите a: ',0
msg2 db 'Введите х: ',0
msg3 db 'Результат выполнения функции: ',0
;объявляем переменные
section .bss
x resb 10
a resb 10
res resb 10
section .text
global _start
;точка входа, ввод а
_start:
mov eax,msg1
call sprint
mov ecx,a
mov edx,10
call sread
mov eax,a
call atoi 
mov [a],eax 
;ввод х
mov eax,msg2
call sprint
mov ecx,x
mov edx,10
call sread
mov eax,x
call atoi 
mov [x],eax 
;сравнение х и 4
cmp byte[x],4
jl _label1
jge _label2

_label1:
mov eax,[x]
add eax,4
mov [res],eax
mov eax,msg3
call sprint
mov eax,[res]
call iprintLF
call quit

_label2:
mov eax,[a]
mov edx,[x]
mul edx
mov [res],eax
mov eax,msg3
call sprint
mov eax,[res]
call iprintLF
call quit