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
int yyerror(const char* message) {fprintf(stderr, "Error: %s\n", message);return 0;}
void printHandler(double expressionValue) {if (errorFlag == 0) printf("Expression = [%f]\n\n", expressionValue); else {printf("\n"); errorFlag = 0;} }
double calcualteDivision(double dividend, double divisor) { double result = 0; if (divisor == 0) {printf("Error: Division By Zero\n");errorFlag = 1;} else result = dividend / divisor;return result;}

double calculatePower(double number, double exponent) {
    double result = 0;
    
    if (number == 0 && exponent == 0) 
    { 
     printf("Error: Unsupported Mathematical Calculation\n"); 
     errorFlag = 1; 
    }
    
    else if (number < 0 && exponent != (int)exponent)  
    { 
     printf("Error: Unsupported Operand Types\n"); 
     errorFlag = 1; 
    }
    
    else
    {
     int isNegative = exponent < 0.0;
     double positiveExponent = isNegative ? -exponent : exponent;

     double integerPart = (int)positiveExponent;
     double fractionalPart = positiveExponent - integerPart;

     result = 1.0;
     while (integerPart > 0.0) {
         result *= number;
         integerPart--;
     }

     if (fractionalPart > 0.0) {
         double term = 1.0;
         double power = number;
         int i = 1;

         while (term > 1e-16) {
             term *= fractionalPart / i;
             result += term * power;
             power *= number;
             i++;
         }
     }
     
     result = isNegative ? 1.0 / result : result;
    }
        
    return result;
}
