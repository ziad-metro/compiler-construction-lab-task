input = input.txt
output = output.txt

main:
	bison -d task5.y 
	flex task5.l 
	gcc task5.tab.c lex.yy.c
	a.exe <$(input)> $(output)
	


