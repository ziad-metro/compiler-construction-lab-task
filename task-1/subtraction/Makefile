all:
	gcc -o substract substract.c
	gcc -E substract.c > substract.i 
	gcc -S -masm=intel substract.i
	as -o substract.o substract.s
	objdump -M intel -d substract.o > substract.dump