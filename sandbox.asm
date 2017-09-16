section .data 

section .text 

global _start 

_start : 
	nop 
	; experiment instruction
	; 
	mov eax,4
	mov eax, 'wxyz'
	nop 

section .bss
