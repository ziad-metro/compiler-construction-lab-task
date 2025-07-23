%option noyywrap

%{
#include "task1.tab.h"
#include <stdlib.h>
%}

digit   [0-9]
number  {digit}+
id      [a-zA-Z_][a-zA-Z0-9_]*

%%

[ \t\n]+             ;                  
"if"                 { return IF; }
"else"               { return ELSE; }
"("                  { return LPAREN; }
")"                  { return RPAREN; }
"{"                  { return LBRACE; }
"}"                  { return RBRACE; }
"=="                 { return EQ; }
";"                  { return SEMI; }
{id}                 { return ID; }
{number}             { yylval = atoi(yytext); return NUM; }

.                    { return *yytext; }       // Catch any other single characters

%%
