input = input.txt
output = output.txt

main:
	bison -d task3.y 
	flex task3.l 
	gcc task3.tab.c lex.yy.c
	a.exe <$(input)> $(output)
	


