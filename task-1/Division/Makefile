all:
	gcc -o Division Division.c
	gcc -E Division.c > Division.i 
	gcc -S -masm=intel Division.i
	as -o Division.o Division.s
	objdump -M intel -d Division.o > Division.dump