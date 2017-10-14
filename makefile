all: sandbox uppercase1 uppercase2 

sandbox: sandbox.o 
	ld -o sandbox sandbox.o 
uppercase1: uppercase1.o 
	ld -o uppercase1 uppercase1.o 
uppercase2: uppercase2.o 
	ld -o uppercase2 uppercase2.o 

sandbox.o: sandbox.asm 
	nasm -f elf -g -F stabs sandbox.asm -l sandbox.lst
uppercase1.o: uppercase1.asm 
	nasm -f elf -g -F stabs uppercase1.asm -l uppercase1.lst

uppercase2.o: uppercase2.asm 
	nasm -f elf -g -F stabs uppercase2.asm -l uppercase2.lst
