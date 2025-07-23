%{
#include <stdio.h>
void yyerror(char *s);
int yylex();
%}

%token IF ELSE FOR LPAREN RPAREN LBRACE RBRACE NUM ID EQ SEMI
%start stmt

%%

stmt
    : FOR LPAREN expr SEMI expr SEMI expr RPAREN block
    | IF LPAREN expr RPAREN block ELSE block
    | IF LPAREN expr RPAREN block
    ;

expr: ID EQ NUM ;

block: LBRACE stmt_list RBRACE ;

stmt_list : expr SEMI ;

%%

void yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    yyparse();
    printf("Parsing Finished\n");
    return 0;
}
