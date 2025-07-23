%option noyywrap

%{
    #include "cal.tab.h"
%}

digit [0-9]
num {digit}+
float_num {digit}+"."{digit}+
delim [ \t\n]
letter [A-Za-z]
under [_]

%%

{delim} {/* skip whitespace */}

"int"     { return INT_TYPE; }
"float"   { return FLOAT_TYPE; }
"if"      { return IF; }

"("       { return LPAREN; }
")"       { return RPAREN; }
"{"       { return LBRACE; }
"}"       { return RBRACE; }
">"       { return GT; }
"+"       { return '+'; }
"="       { return ASSIGN; }
";"       { return SEMI; }

{float_num} { yylval = atof(yytext); return FLOAT_NUM; }
{num}       { yylval = atoi(yytext); return INT_NUM; }

({under}|{letter})({under}|{letter}|{digit})* { return ID; }

. { printf("Unexpected character: %s\n", yytext); }

%%
