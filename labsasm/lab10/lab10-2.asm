%include 'in_out.asm'

section .data
    nameRequest: db "Как вас зовут? - ", 0 ;запрос имени
    filename: db "name.txt", 0 ;название файла
    iam: db "Меня зовут " ;первая строчка в файле
    iamLength: equ $-iam

section .bss
    name: resb 255 ;объявляем переменную

section .text
    global _start

_start:
    mov eax, nameRequest ;вызываем запрос имени
    call sprint

    mov ecx, name 
    mov edx,255
    call sread ;записываем имя, которое пользователь указал в консоли
    
    mov ecx, 0777o 
    mov ebx, filename
    mov eax, 8 
    int 80h ;создаем файл

    call _openfile

    mov edx, iamLength 
    mov ecx, iam 
    mov ebx, eax 
    mov eax, 4
    int 80h

    call _closefile
    
    call _openfile

    mov edx, 2
    mov ecx, 0 
    mov ebx, eax
    mov eax, 19 
    int 80h
    mov esi, eax
    mov eax, name
    call slen
    mov edi, eax
    mov eax, esi

    mov edx, edi 
    mov ecx, name
    mov eax, 4
    int 80h

    call _closefile

_end:
    call quit

_openfile:
    mov ecx, 2 
    mov ebx, filename
    mov eax, 5
    int 80h
    ret

_closefile:
    mov ebx, eax
    mov eax, 6
    int 80h
    ret
