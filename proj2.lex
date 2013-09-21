/* CSE 491 - Project #2 - Alec Joiner, Kyler Wilkins, Alex Lockwood */

%{
#include <iostream>
#include <fstream>
#include <string>
#include <cstdlib>

using namespace std;
%}

%%

int                     {yylval.lexeme = strdup(yytext); return TYPE;}
print                   {yylval.lexeme = strdup(yytext); return COMMAND;}
[_a-zA-Z][_a-zA-Z0-9]*  {yylval.lexeme = strdup(yytext); return ID;}
[0-9]+                  {yylval = atoi(yytext); return STATIC_INT;}
#.*                     ; /* ignore comments */
"/*"([^\*]|\*[^/])*"*/" ; /* ignore multi-line comments */
[*\-*/%()]|[+\-*/%]?=   {yylval.lexeme = strdup(yytext); return OPERATOR;}
,                       {yylval.lexeme = strdup(yytext); return SEPARATOR;}
;                       {yylval.lexeme = strdup(yytext); return ENDLINE;}
\n                      {yylval.lexeme = strdup(yytext); return EOL;}
[ \t]+                  ; /* ignore whitespace */
.*                      return yytext[0]; /* Unknown char */

%%
