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
