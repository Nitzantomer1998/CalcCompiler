%{
#include "y.tab.h"
#include <stdlib.h>
#include <string.h>
#include "calculator.h"
%}


%%
[ \t\r\n]+              ;    
"exit"                  { exit(1); }

"+"                     { return ADD; }
"-"                     { return MINUS; }
"*"                     { return MULTIPLY; }
"/"                     { return DIVIDE; }
"**"                    { return POWER; }
"%"                     { return MODULO; }

"zero?"                 { return IF_ZERO; }
"if"                    { return IF_KEYWORD; }
"then"                  { return THEN_KEYWORD; }
"else"                  { return ELSE_KEYWORD; }

"let"                   { return LET_KEYWORD; }
"in"                    { return IN_KEYWORD; }

[a-zA-Z][a-zA-Z0-9]*    {
                          yylval.symbol = symbolLookup(yytext);
                          return IDENTIFIER;
                        }
                        
[+-]?[0-9]+([.][0-9]+)?([eE][+-]?[0-9]+)? {
                          yylval.number = atof(yytext);
                          return EXPRESSION;
                        }         
[(),=;]                 { return yytext[0]; }
.                       { return yytext[0]; }
%%

