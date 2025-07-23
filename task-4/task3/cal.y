%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int yylex();
void yyerror(const char *s);

typedef struct {
    char* id;
    int num;
} YYSTYPE;

#define YYSTYPE_IS_DECLARED 1

%}

%union {
    int num;
    char* id;
}

%token <num> NUM
%token <id> ID
%token INT FOR ASSIGN LT PLUS SEMI LPAREN RPAREN LBRACE RBRACE

%start program

%%

program:
    declaration loop
    ;

declaration:
    INT ID SEMI
    ;

loop:
    FOR LPAREN assignment condition SEMI update RPAREN LBRACE statement RBRACE
    ;

assignment:
    ID ASSIGN expression SEMI
    ;

condition:
    ID LT NUM
    ;

update:
    ID ASSIGN ID PLUS NUM
    ;

statement:
    ID ASSIGN ID SEMI
    ;

expression:
    NUM
    | ID
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Syntax error: %s\n", s);
}

int main() {
    yyparse();
    return 0;
}
