%{
#include<stdio.h>
void yyerror(char *s);
int yylex();
%}

%token INT_TYPE FLOAT_TYPE INT_NUM FLOAT_NUM ASSIGN SEMI ID
%token IF ELSE FOR GT LT EQ GE LE NE
%token COMMA LBRACE RBRACE LPAREN RPAREN

%left '+' '-'
%left '*' '/'
%right UMINUS

%start stmts

%%

stmts : stmts stmt
      | /* empty */
      ;

stmt : dclr_stmt
     | ass_stmt
     | if_stmt
     | for_stmt
     ;

dclr_stmt : INT_TYPE id_list SEMI
          | FLOAT_TYPE id_list SEMI ;mak

id_list : ID
        | ID ASSIGN expr
        | id_list COMMA ID
        | id_list COMMA ID ASSIGN expr ;

ass_stmt : ID ASSIGN expr SEMI ;

if_stmt : IF LPAREN expr RPAREN LBRACE stmts RBRACE
        | IF LPAREN expr RPAREN LBRACE stmts RBRACE ELSE LBRACE stmts RBRACE ;

for_stmt : FOR LPAREN ass_stmt expr SEMI ass_stmt RPAREN LBRACE stmts RBRACE ;

expr : expr '+' expr
     | expr '-' expr
     | expr '*' expr
     | expr '/' expr
     | expr GT expr
     | expr LT expr
     | expr GE expr
     | expr LE expr
     | expr EQ expr
     | expr NE expr
     | '-' expr %prec UMINUS
     | LPAREN expr RPAREN
     | INT_NUM
     | FLOAT_NUM
     | ID ;


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

