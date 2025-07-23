%{
#include <stdio.h>
void yyerror(char *s);
int yylex();
%}

%token DO WHILE LPAREN RPAREN LBRACE RBRACE NUM ID EQ SEMI
%start stmt

%%
stmt : DO block WHILE LPAREN expr RPAREN SEMI ;

expr : ID EQ NUM ;

block : LBRACE expr SEMI RBRACE ;

%%

void yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    yyparse();
    printf("Parsing Finished\n");
    return 0;
}
