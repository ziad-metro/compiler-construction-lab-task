%{
#include<stdio.h>
void yyerror(char *s);
int yylex();
%}

%token INT_TYPE FLOAT_TYPE INT_NUM FLOAT_NUM ASSIGN SEMI ID
%token IF GT LPAREN RPAREN LBRACE RBRACE
%start stmts

%%


stmts : stmts stmt  |  ;

stmt : dclr_stmt | ass_stmt | if_stmt ;

dclr_stmt : Type ID SEMI  | Type ID ASSIGN expr SEMI  ;

ass_stmt : ID ASSIGN expr SEMI ;

if_stmt : IF LPAREN cond_expr RPAREN LBRACE stmts RBRACE  ;

cond_expr : expr GT expr ;

expr : expr '+' expr | NUM | ID ;

NUM : INT_NUM | FLOAT_NUM ;

Type : INT_TYPE | FLOAT_TYPE ;


%%

void yyerror(char *s)
{
    fprintf(stderr, "error: %s", s);
}

int main()
{
    yyparse();
    printf("Parsing Finished\n");
}

