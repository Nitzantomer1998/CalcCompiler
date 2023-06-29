%{#include "y.tab.h"
#include <stdlib.h>
#include <string.h>
#include "calculator.h"%}
%%
[ \t\r\n]+ ;
"exit" {exit(1);}
"+" {return ADD;}
"-" {return MINUS;}
"*" {return MULTIPLY;}
"/" {return DIVIDE;}
"**" {return POWER;}
"%" {return MODULO;}
"zero?" {return IF_ZERO;}
"if" {return IF_KEYWORD;}
"then" {return THEN_KEYWORD;}
"else" {return ELSE_KEYWORD;}
%%
