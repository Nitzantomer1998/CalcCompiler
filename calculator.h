#ifndef CALCULATOR_H
#define CALCULATOR_H

#define MAX_SYMBOL_LENGTH 20


struct SymbolTab {
    char name[MAX_SYMBOL_LENGTH];
    float value;
};

struct SymbolTab* symbolLookup(const char* symbol);


#endif
