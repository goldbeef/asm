SECTION .data 

EatMsg: db "Eat at Joe's!'", 10
EatLen: equ $-EatMsg 

SECTION .bss 

SECTION .text 

global _start 

_start:
	nop
	stc 
	clc
	mov eax, 4
	mov ecx, 2
	shl eax, cl
	xor eax, eax
	mov ebx, 1
	mov ecx, EatMsg 
	mov edx, EatLen 
	int 80H 
	mov eax, 1 
	mov ebx, 0
	int 80H
