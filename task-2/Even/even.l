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
"unsigned long long" { printf("%s -> UNSIGNED_LONG_LONG\n", yytext); }
"#include"        { printf("%s -> INCLUDE\n", yytext); }
"<stdio.h>"       { printf("%s -> HEADER\n", yytext); }
"printf"          { printf("%s -> PRINTF\n", yytext); }
"scanf"           { printf("%s -> SCANF\n", yytext); }
"return"          { printf("%s -> RETURN\n", yytext); }
"while"           { printf("%s -> WHILE\n", yytext); }
"float"           { printf("%s -> FLOAT\n", yytext); }
"main"            { printf("%s -> MAIN\n", yytext); }
"int"             { printf("%s -> INT\n", yytext); }
"else"            { printf("%s -> ELSE\n", yytext); }
"for"             { printf("%s -> FOR\n", yytext); }
"if"              { printf("%s -> IF\n", yytext); }

"++"              { printf("%s -> INCREMENT\n", yytext); }
"=="              { printf("%s -> EQ\n", yytext); }
"<="              { printf("%s -> LE\n", yytext); }
">="              { printf("%s -> GE\n", yytext); }
"*="              { printf("%s -> MUL_ASSIGN\n", yytext); }
"+"               { printf("%s -> ADD\n", yytext); }
"="               { printf("%s -> ASSIGN\n", yytext); }
"<"               { printf("%s -> <\n", yytext); }
">"               { printf("%s -> >\n", yytext); }
"*"               { printf("%s -> MUL\n", yytext); }
"%"               { printf("%s -> MOD\n", yytext); }
"&"               { printf("%s -> ADDRESS\n", yytext); }

"("               { printf("%s -> LP\n", yytext); }
")"               { printf("%s -> RP\n", yytext); }
"{"               { printf("%s -> LB\n", yytext); }
"}"               { printf("%s -> RB\n", yytext); }
";"               { printf("%s -> SEMI\n", yytext); }
","               { printf("%s -> COMMA\n", yytext); }

\"                { printf("%s -> DOUBLE_QUOTE\n", yytext); BEGIN STRING; }

<STRING>%d        { printf("%s -> FORMAT_SPECIFIER_D\n", yytext); }
<STRING>%llu      { printf("%s -> FORMAT_SPECIFIER_LLU\n", yytext); }
<STRING>[^"\n\\]+ { printf("%s -> STRING_CONTENT\n", yytext); }
<STRING>\\.       { printf("%s -> ESCAPED_CHAR\n", yytext); }
<STRING>\"        { printf("%s -> DOUBLE_QUOTE\n", yytext); BEGIN INITIAL; }
<STRING>\n        { printf("Error: Newline in string literal\n"); BEGIN INITIAL; }

{float_num}       { printf("%s -> FLOAT_NUM\n", yytext); }
{num}             { printf("%s -> NUMBER\n", yytext); }

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

