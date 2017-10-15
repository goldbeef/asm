all: sandbox uppercase1 uppercase2 hexdump1 xlat1

sandbox: sandbox.o 
	ld -o sandbox sandbox.o 
uppercase1: uppercase1.o 
	ld -o uppercase1 uppercase1.o 
uppercase2: uppercase2.o 
	ld -o uppercase2 uppercase2.o 
hexdump1: hexdump1.o 
	ld -o hexdump1 hexdump1.o
xlat1: xlat1.o 
	ld -o xlat1 xlat1.o

sandbox.o: sandbox.asm 
	nasm -f elf -g -F stabs sandbox.asm -l sandbox.lst
uppercase1.o: uppercase1.asm 
	nasm -f elf -g -F stabs uppercase1.asm -l uppercase1.lst
uppercase2.o: uppercase2.asm 
	nasm -f elf -g -F stabs uppercase2.asm -l uppercase2.lst
hexdump1.o: hexdump1.asm 
	nasm -f elf -g -F stabs hexdump1.asm -l hexdump1.lst
xlat1.o: xlat1.asm 
	nasm -f elf -g -F stabs xlat1.asm -l xlat1.lst
