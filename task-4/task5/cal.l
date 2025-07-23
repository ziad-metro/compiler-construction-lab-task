%option noyywrap

%{
    #include "cal.tab.h"
%}

digit [0-9]
num {digit}+
float_num {digit}+"."{digit}+
delim [ \t\r\n]
letter [A-Za-z]
under [_]

%%

{delim} {}

"int"    { return INT_TYPE; }
"float"  { return FLOAT_TYPE; }
"if"     { return IF; }
"else"   { return ELSE; }

"("      { return LPAREN; }
")"      { return RPAREN; }
"{"      { return LBRACE; }
"}"      { return RBRACE; }
"="      { return ASSIGN; }
"=="     { return EQ; }
";"      { return SEMI; }
","      { return COMMA; }

{float_num} { yylval = atof(yytext); return FLOAT_NUM; }
{num}       { yylval = atoi(yytext); return INT_NUM; }

({under}|{letter})({under}|{letter}|{digit})* { return ID; }


%%
