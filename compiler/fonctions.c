#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "fonctions.h"
#include "stack.h"

#define MAX_INSTRUCTIONS 1024



struct Function functionTab[MAX_INSTRUCTIONS];
int numFunctions = 0;

void add_func(const char* functionName, int address) {
    strcpy(functionTab[numFunctions].name, functionName);
    functionTab[numFunctions].address = address;
    numFunctions++;
    int c= main2();
}

int get_position(const char* functionName) {
    for (int i = 0; i < numFunctions; i++) {
        if (strcmp(functionTab[i].name, functionName) == 0) {
            return functionTab[i].address;
        }
    }
    return -1; // Indicates that the function was not found
}

int main2() {

    // Accessing the function information
    for (int i = 0; i < numFunctions; i++) {
        printf("Function Name: %s\n", functionTab[i].name);
        printf("Address: %d\n", functionTab[i].address);
        printf(" 00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
    }

    return 0;
}
