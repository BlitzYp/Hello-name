section .data
    question: db "What's your name? "
    len: equ $ - question
    answer: db "Hello, "
    len2: equ $ - answer

section .bss
    name: resb 20

section .text
global _start

_start:
    call _printQuestion
    call _getName
    call _printHello
    call _printName
    mov rax, 60
    xor rdi, rdi
    syscall

_printQuestion:
    mov rax, 1
    mov rdi, 1
    mov rsi, question
    mov rdx, len
    syscall
    ret

_getName:
    push rbp
    mov rbp, rsp
    mov rax, 0
    mov rdi, 0
    mov rsi, name
    mov rdx, 20
    mov rsp, rbp
    pop rbp
    syscall
    ret

_printHello:
    mov rax, 1
    mov rdi, 1
    mov rsi, answer
    mov rdx, len2
    syscall
    ret

_printName:
    mov rax, 1
    mov rdi, 1
    mov rsi, name
    mov rdx, 20
    syscall
    ret





