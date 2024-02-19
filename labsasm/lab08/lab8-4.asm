%include 'in_out.asm'
SECTION .data
msg0 db "Функция: f(x)=30x-11"
msg1 db "Результат: ",0
SECTION .text
global _start
_start:
pop ecx
pop edx
sub ecx,1 
mov esi, 0
next:
cmp ecx,0h 
jz _end
pop eax
call atoi 
mov edx, 30
mul edx
sub eax,11
add esi,eax 
loop next 
_end:
mov eax, msg0
call sprintLF
mov eax, msg1
call sprintLF
mov eax, esi
call iprintLF 
call quit 