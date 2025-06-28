%option noyywrap

%{
%}

%x STRING

letter [a-zA-Z]
digit [0-9]
delim [ \t]
under [_]
num {digit}{digit}*
float_num {num}*[.]{num}
id ({under}|{letter})({under}|{letter}|{digit})*

%%
{num}             { printf("%s -> NUMBER\n", yytext); }
{float_num}       { printf("%s -> FLOAT_NUM\n", yytext); }
"int"             { printf("%s -> INT\n", yytext); }
"float"           { printf("%s -> FLOAT\n", yytext); }
"while"           { printf("%s -> WHILE\n", yytext); }
"for"             { printf("%s -> FOR\n", yytext); }
"main"            { printf("%s -> MAIN\n", yytext); }
"return"          { printf("%s -> RETURN\n", yytext); }
"printf"          { printf("%s -> PRINTF\n", yytext); }
"scanf"           { printf("%s -> SCANF\n", yytext); }
"#include"        { printf("%s -> INCLUDE\n", yytext); }
"<stdio.h>"       { printf("%s -> HEADER\n", yytext); }

"+"               { printf("%s -> ADD\n", yytext); }
"++"              { printf("%s -> INCREMENT\n", yytext); }
"="               { printf("%s -> ASSIGN\n", yytext); }
"=="              { printf("%s -> EQ\n", yytext); }
"<="              { printf("%s -> LE\n", yytext); }
">="              { printf("%s -> GE\n", yytext); }
"<"               { printf("%s -> <\n", yytext); }
">"               { printf("%s -> >\n", yytext); }

"("               { printf("%s -> LP\n", yytext); }
")"               { printf("%s -> RP\n", yytext); }
"{"               { printf("%s -> LB\n", yytext); }
"}"               { printf("%s -> RB\n", yytext); }
";"               { printf("%s -> SEMI\n", yytext); }
","               { printf("%s -> COMMA\n", yytext); }
"&"               { printf("%s -> ADDRESS\n", yytext); }
"%"               { printf("%s -> MOD\n", yytext); }
"*="              { printf("%s -> MUL_ASSIGN\n", yytext); }
"*"               { printf("%s -> MUL\n", yytext); }

\"                { printf("%s -> DOUBLE_QUOTE\n", yytext); BEGIN STRING; }

<STRING>%d        { printf("%s -> FORMAT_SPECIFIER\n", yytext); }
<STRING>\\n       { printf("\\n -> ESCAPED_NEWLINE\n"); }
<STRING>[^"\n\\]+ { printf("%s -> STRING_CONTENT\n", yytext); }
<STRING>\\.       { printf("%s -> ESCAPED_CHAR\n", yytext); }
<STRING>\"        { printf("%s -> DOUBLE_QUOTE\n", yytext); BEGIN INITIAL; }
<STRING>\n        { printf("Error: Newline in string literal\n"); BEGIN INITIAL; }

{id}              { printf("%s -> ID\n", yytext); }
{delim}           {}
\n                { /* ignore newline */ }
.                 { printf("%s -> UNKNOWN\n", yytext); }

%%

int main()
{
  yylex();
  return 0;
}
