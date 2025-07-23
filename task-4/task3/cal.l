
%{
#include "cal.tab.h"
#include <string.h>

%}

DIGIT   [0-9]+
ID      [a-zA-Z_][a-zA-Z0-9_]*

%%

"int"           { return INT; }
"for"           { return FOR; }
"="             { return ASSIGN; }
";"             { return SEMI; }
"<"             { return LT; }
"("             { return LPAREN; }
")"             { return RPAREN; }
"{"             { return LBRACE; }
"}"             { return RBRACE; }
"+"             { return PLUS; }

{DIGIT}         { yylval.num = atoi(yytext); return NUM; }
{ID}            { yylval.id = strdup(yytext); return ID; }

[ \t\n\r]       ; // ignore whitespace

.               { printf("Unknown character: %s\n", yytext); }

%%
int yywrap() { return 1; }
