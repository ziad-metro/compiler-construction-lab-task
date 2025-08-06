%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include "symtab.c"
    void yyerror();
    extern int lineno;
    extern int yylex();
%}

%union
{
    char str_val[100];
    int int_val;
}

%token INT IF ELSE WHILE CONTINUE BREAK PRINT DOUBLE CHAR RETURN VOID
%token ADDOP SUBOP MULOP DIVOP EQUOP LT GT
%token LPAREN RPAREN LBRACE RBRACE SEMI ASSIGN
%token<str_val> ID
%token ICONST
%token FCONST
%token CCONST

%left LT GT /*LT GT has lowest precedence*/
%left ADDOP 
%left MULOP /*MULOP has lowest precedence*/

%type<int_val> type exp constant

%start code

%%
code: statements;

statements: statements statement | ;

statement: declaration
         | if_statement
         | while_statement
         | function_definition
         | return_statement
         ;

function_definition: type ID LPAREN RPAREN LBRACE statements RBRACE
                  ;

return_statement: RETURN exp SEMI
                | RETURN SEMI
                ;

while_statement: WHILE LPAREN exp RPAREN LBRACE statements RBRACE
               ;

declaration: type ID SEMI
            {
                //printf("%s\n", $2);
                //printf("%d\n", $1);
                insert($2, $1);
            }
            |type ID ASSIGN exp SEMI
            ;

type: INT {$$=INT_TYPE;}
    | DOUBLE {$$=REAL_TYPE;}
    | CHAR {$$=CHAR_TYPE;}
    | VOID {$$=UNDEF_TYPE;}
    ;

exp: constant
    {
        $$ = $1;
    }
    | ID 
      {
        if(idcheck($1))
        {
            $$ = gettype($1);
        }
      }
    | exp ADDOP exp
    {
        $$ = typecheck($1, $3);
    }
    | exp MULOP exp
    {
        $$ = typecheck($1, $3);
    }
    | exp GT exp
    {
        //printf("%d\n", $1);
        //printf("%d\n", $3);
        $$ = typecheck($1, $3);
    }
    | exp LT exp
    {
        $$ = typecheck($1, $3);
    }
    | ADDOP exp
    {
        $$ = $2;
    }
    | SUBOP exp
    {
        $$ = $2;
    }
    | LPAREN exp RPAREN
    {
        $$ = $2;
    }
    ;

constant: ICONST {$$=INT_TYPE;}
        | FCONST {$$=REAL_TYPE;}
        | CCONST {$$=CHAR_TYPE;}
        ;

if_statement: IF LPAREN exp RPAREN LBRACE statements RBRACE optional_else
        ;

optional_else: ELSE IF LPAREN exp RPAREN LBRACE statements RBRACE 
              | ELSE LBRACE statements RBRACE 
              | 
              ;

%%

void yyerror ()
{
    printf("Syntax error at line %d\n", lineno);
    exit(1);
}

int main (int argc, char *argv[])
{
    yyparse();
    printf("Parsing finished!\n");	
    return 0;
}
