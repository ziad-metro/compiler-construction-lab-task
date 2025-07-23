input = input.txt
output = output.txt

main:
	bison -d task1.y 
	flex task1.l 
	gcc task1.tab.c lex.yy.c
	a.exe <$(input)> $(output)
	


