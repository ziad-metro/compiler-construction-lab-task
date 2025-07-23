%option noyywrap

%{
#include "task4.tab.h"
%}

digit [0-9]
number {digit}+
id [a-zA-Z_][a-zA-Z0-9_]*

%%

[ \t\n]+               ;
"switch"   { return SWITCH; }
"case"     { return CASE; }
"default"  { return DEFAULT; }
"break"    { return BREAK; }
"("        { return LPAREN; }
")"        { return RPAREN; }
"{"        { return LBRACE; }
"}"        { return RBRACE; }
"=="        { return EQ; }
":"        { return COLON; }
";"        { return SEMI; }
{number}   { yylval = atoi(yytext); return NUM; }
{id}       { return ID; }
.          { return *yytext; }

%%
