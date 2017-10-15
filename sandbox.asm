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
	mov ebx, EatMsg
	mov eax, 0
	xlat
	mov ebx, [EatMsg]
	mov eax, 2
	lea eax, [eax * 2]
	lea eax, [eax * 4 + eax]
	bt eax, 1
	bt eax, 2
	test eax, 4
	test eax, 1
	;test eax, 3
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
