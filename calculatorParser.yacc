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
