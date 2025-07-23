%option noyywrap

%{
#include "task3.tab.h"
%}

digit [0-9]
number {digit}+
id [a-zA-Z_][a-zA-Z0-9_]*

%%
[ \t\n]+             ; 
"do"       { return DO; }
"while"    { return WHILE; }
"("        { return LPAREN; }
")"        { return RPAREN; }
"{"        { return LBRACE; }
"}"        { return RBRACE; }
{number}   { yylval = atoi(yytext); return NUM; }
{id}       { return ID; }
"=="       { return EQ; }
";"        { return SEMI; }
.          { return *yytext; }

%%
