#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "instructions.h"
#include "stack.h"

void sub_ins() {
    int op2 = stack_pop();
    int op1= stack_pop() ;
    stack_push("0");
    printf("SOU %d %d %d\n" , last_address(),op1, op2 ) ;
}

void add_ins(){
    int op2 = stack_pop();
    int op1= stack_pop() ;
    stack_push("0");
    printf("ADD %d %d %d\n" , last_address(),op1, op2 ) ;
}

void mul_ins() {
    int op2 = stack_pop();
    int op1= stack_pop() ;
    stack_push("0");
    printf("MUL %d %d %d\n" , last_address(),op1, op2 ) ;
}

void div_ins() {
    int op2 = stack_pop();
    int op1= stack_pop() ;
    stack_push("0");
    printf("DIV %d %d %d\n" , last_address(),op1, op2 ) ;
}