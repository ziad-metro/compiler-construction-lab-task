input = input.txt
output = output.txt

main:
	bison -d task2.y 
	flex task2.l 
	gcc task2.tab.c lex.yy.c
	a.exe <$(input)> $(output)
	


