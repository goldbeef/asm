section .bss 
	BUFFLEN equ 16
	Buff: resb BUFFLEN 

section .data 
	HexStr: db " 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00", 10
	HexLen: equ $-HexStr 

	Digits: db "0123456789ABCDEF"

section .text 

global _start 

_start:
	nop 

Read:
	mov eax, 3
	mov ebx, 0
	mov ecx, Buff 
	mov edx, BUFFLEN 
	int 80H
	mov ebp, eax 
	cmp eax, 0
	je Done 

	mov esi, Buff 
	mov edi, HexStr 
	xor ecx, ecx 

Scan:
	xor eax, eax 
	mov edx, ecx 
	shl edx, 1
	add edx, ecx; eax = 3 * eax 

	mov al, byte [esi + ecx]
	mov ebx, eax 

	;low half-byte
	and al, 0Fh 
	mov al, byte [Digits + eax]
	mov byte [HexStr + edx + 2], al 

	;high half-tyte 
	shr bl, 4
	mov bl, byte [Digits + ebx]
	mov byte [HexStr + edx + 1], bl 

	inc ecx 
	cmp ecx, ebp 
	jna Scan 

Modify:
	cmp ecx, BUFFLEN 
	jae Write 
	
	mov edx, ecx 
	shl edx, 1
	add edx, ecx 

	mov byte [HexStr + edx + 1], 30h 
	mov byte [HexStr + edx + 2], 30h 

	inc ecx;
	jmp Modify

Write:
	mov eax, 4
	mov ebx, 1
	mov ecx, HexStr 
	mov edx, HexLen 
	int 80h
	jmp Read 

Done:
	mov eax, 1
	mov ebx, 0
	int 80h

