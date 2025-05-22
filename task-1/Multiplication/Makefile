all:
	gcc -o Multiplication Multiplication.c
	gcc -E Multiplication.c > Multiplication.i 
	gcc -S -masm=intel Multiplication.i
	as -o Multiplication.o Multiplication.s
	objdump -M intel -d Multiplication.o > Multiplication.dump