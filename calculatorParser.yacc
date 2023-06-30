%{#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "calculator.h"
int yylex();
int yyerror(const char* message);
void printHandler(double expressionValue);
double calcualteDivision(double dividend, double divisor);
double calculatePower(double number, double exponent);
double calculateModulo(double dividend, double divisor);
int errorFlag = 0;
int symbolIndex = 0;
struct SymbolTab symbolTable[MAX_SYMBOL_LENGTH];%}
%union {double number; struct SymbolTab* symbol;}
%token ADD
%token MINUS
%token MULTIPLY
%token DIVIDE
%token POWER
%token MODULO
%token IF_ZERO
%token IF_KEYWORD
%token THEN_KEYWORD
%token ELSE_KEYWORD
%token LET_KEYWORD
%token IN_KEYWORD
%token <symbol> IDENTIFIER
%token <number> EXPRESSION
%type <number> expression
%left ADD
%left MINUS
%left MULTIPLY
%left DIVIDE
%left MODULO
%right POWER
%start statement_list
%%
statement_list: statement '\n'|statement_list statement '\n';
statement: IDENTIFIER '=' expression { $1->value = $3; }|expressions{printf("\n");};
expressions: expression ';' {printHandler($1);}|expressions expression ';' {printHandler($2);};     
expression: EXPRESSION { $$ = $1; }|ADD '(' expression ',' expression ')' { $$ = $3 + $5; }| MINUS '(' expression ',' expression ')' { $$ = $3 - $5; }| MULTIPLY '(' expression ',' expression ')' { $$ = $3 * $5; }| DIVIDE '(' expression ',' expression ')' { $$ = calcualteDivision($3, $5); }| POWER '(' expression ',' expression ')' { $$ = calculatePower($3, $5); }| MODULO '(' expression ',' expression ')' { $$ = calculateModulo($3, $5); }| IF_ZERO '(' expression ')' { $$ = ($3 == 0) ? 1 : 0; }| IF_KEYWORD expression THEN_KEYWORD expression ELSE_KEYWORD expression { $$ = ($2 != 0) ? $4 : $6; }| LET_KEYWORD statement IN_KEYWORD expression { $$ = $4; }| '(' expression ')' { $$ = $2; }| IDENTIFIER { $$ = $1->value; };%%
int main() {errorFlag = 0; return yyparse();}
