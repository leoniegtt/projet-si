#ifndef FONCTIONS_H
#define FONCTIONS_H

struct Function {
    char name[50];
    int address;
};

extern struct Function functionTab[];
extern int numFunctions;

void add_func(const char* functionName, int address);
int get_position(const char* functionName);

#endif /* FONCTIONS_H */
