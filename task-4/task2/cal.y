%{
#include<stdio.h>
void yyerror(char *s);
int yylex();
%}

%token INT_TYPE FLOAT_TYPE INT_NUM FLOAT_NUM ASSIGN SEMI ID
%token MOD EQ QUEST COLON
%left '+' '-' '*' '/' MOD
%left EQ
%right QUEST COLON
%start stmts

%%

stmts : stmts stmt | ;

stmt : dclr_stmt | ass_stmt ;

dclr_stmt : Type ID SEMI | Type ID ASSIGN expr SEMI ;

ass_stmt : ID ASSIGN expr SEMI ;

expr : expr '+' expr
     | expr '-' expr
     | expr '*' expr
     | expr '/' expr
     | expr MOD expr
     | expr EQ expr
     | expr QUEST expr COLON expr
     | NUM
     | ID ;

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

