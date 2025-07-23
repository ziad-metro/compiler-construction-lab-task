input = input.txt
output = output.txt

main:
	bison -d task4.y 
	flex task4.l 
	gcc task4.tab.c lex.yy.c
	a.exe <$(input)> $(output)
	


