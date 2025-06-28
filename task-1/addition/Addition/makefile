gcc -o addition addition.c
	gcc -E addition.c > addition.i 
	gcc -S -masm=intel addition.i
	as -o addition.o addition.s
	objdump -M intel -d addition.o > addition.dump