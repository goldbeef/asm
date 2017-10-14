section .bss 
	BUFFLEN equ 1024 
	Buff: resb BUFFLEN 

section .data 
	
section .text 

global _start 

_start: 
	nop 

Read:
	mov eax, 3 
	mov ebx, 0
	mov ecx, Buff 
	mov edx, BUFFLEN 
	int 80h
	mov esi, eax 
	cmp eax, 0
	je Done 
	
	mov ecx, esi 
	mov ebp, Buff 
	dec ebp 

Scan:
	cmp byte [ebp + ecx], 61h; 'a' 
	jb Next

	cmp byte [ebp + ecx], 7ah; 'z'
	ja Next 

	sub byte [ebp + ecx], 20h; low -> upper

Next:
	dec ecx
	jnz Scan 

Write:
	mov eax, 4
	mov ebx, 1
	mov ecx, Buff 
	mov edx, esi 
	int 80h
	jmp Read 

Done: 
	mov eax, 1
	mov ebx, 0
	int 80h


