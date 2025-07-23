%{
#include<stdio.h>
void yyerror(char *s);
int yylex();
%}

%token INT_TYPE FLOAT_TYPE INT_NUM FLOAT_NUM ASSIGN SEMI ID COMMA
%token IF ELSE EQ LPAREN RPAREN LBRACE RBRACE

%start stmts

%left '+' '-' '*' '/' 
%left EQ
%nonassoc IFX ELSE

%%

stmts : stmts stmt | ;

stmt : dclr_stmt | ass_stmt | if_stmt ;

dclr_stmt : Type decl_list SEMI ;

decl_list : ID
          | ID ASSIGN expr
          | decl_list COMMA ID
          | decl_list COMMA ID ASSIGN expr ;

ass_stmt : ID ASSIGN expr SEMI ;

if_stmt : IF LPAREN expr RPAREN LBRACE stmts RBRACE %prec IFX
        | IF LPAREN expr RPAREN LBRACE stmts RBRACE ELSE LBRACE stmts RBRACE ;

expr : expr '+' expr
     | expr '-' expr
     | expr '*' expr
     | expr '/' expr
     | expr EQ expr
     | ID
     | NUM
     ;

NUM : INT_NUM | FLOAT_NUM;

Type : INT_TYPE | FLOAT_TYPE;

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

