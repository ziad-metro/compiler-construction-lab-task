%{
#include <stdio.h>
void yyerror(char *s);
int yylex();
%}

%token SWITCH CASE DEFAULT BREAK LPAREN RPAREN LBRACE RBRACE COLON SEMI NUM ID EQ 
%start stmt

%%
stmt : SWITCH LPAREN ID RPAREN block ;

block: LBRACE case_list RBRACE ;

case_list : case_list case_stmt | ;

case_stmt : CASE NUM COLON expr | DEFAULT COLON expr ;

expr: ID EQ NUM SEMI | ID EQ NUM SEMI BREAK SEMI ;

%%

void yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    yyparse();
    printf("Parsing Finished\n");
    return 0;
}
