#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "instructions.h"
#include "stack.h"
int instructions[1024][4];
int k =0;

void sub_ins() {
    int op2 = stack_pop();
    int op1= stack_pop() ;
    stack_push("0");
    instructions[k][0] = 3;
    instructions[k][1] = last_address();
    instructions[k][2] = op1;
    instructions[k][3] = op2;
    k=k+1;
    printf("SOU %d %d %d\n" , last_address(),op1, op2 ) ;
}

void add_ins(){
    int op2 = stack_pop();
    int op1= stack_pop() ;
    stack_push("0");
    instructions[k][0] = 1;
    instructions[k][1] = last_address();
    instructions[k][2] = op1;
    instructions[k][3] = op2;
    k=k+1;
    printf("ADD %d %d %d\n" , last_address(),op1, op2 ) ;
}

void mul_ins() {
    int op2 = stack_pop();
    int op1= stack_pop() ;
    stack_push("0");
    instructions[k][0] = 2;
    instructions[k][1] = last_address();
    instructions[k][2] = op1;
    instructions[k][3] = op2;
    k=k+1;
    printf("MUL %d %d %d\n" , last_address(),op1, op2 ) ;
}

void div_ins() {
    int op2 = stack_pop();
    int op1= stack_pop() ;
    stack_push("0");
    instructions[k][0] = 4;
    instructions[k][1] = last_address();
    instructions[k][2] = op1;
    instructions[k][3] = op2;
    k=k+1;
    printf("DIV %d %d %d\n" , last_address(),op1, op2 ) ;
}

void equ_ins() {
    int op2 = stack_pop();
    int op1= stack_pop() ;
    stack_push("0");
    instructions[k][0] = 11;
    instructions[k][1] = last_address();
    instructions[k][2] = op1;
    instructions[k][3] = op2;
    k=k+1;
    printf("DIV %d %d %d\n" , last_address(),op1, op2 ) ;
}
void inf_ins() {
    int op2 = stack_pop();
    int op1= stack_pop() ;
    stack_push("0");
    instructions[k][0] = 9;
    instructions[k][1] = last_address();
    instructions[k][2] = op1;
    instructions[k][3] = op1;
    k=k+1;
    printf("DIV %d %d %d\n" , last_address(),op1, op2 ) ;
}
void sup_ins() {
    int op2 = stack_pop();
    int op1= stack_pop() ;
    stack_push("0");
    instructions[k][0] = 10;
    instructions[k][1] = last_address();
    instructions[k][2] = op1;
    instructions[k][3] = op1;
    k=k+1;
    printf("DIV %d %d %d\n" , last_address(),op1, op2 ) ;
}
