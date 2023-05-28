#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "instructions.h"
#include "stack.h"
int instructions[1024][4];
int k =0;

/*
add 1
mul 2
sub 3
div 4
cop 5
afc 6
jmp 7
jmf 8
inf 9
sup 10
equ 11
call 12
ret 13
nop 14
pop 15
push 16

*/
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
    printf("EQU %d %d %d\n" , last_address(),op1, op2 ) ;
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

void cop_ins(int arg){
    int op1 = arg;
    int op2 =  last_address();
    //stack_pop(); //temp var
    instructions[k][0] = 5;
    instructions[k][1] = op1;
    instructions[k][2] = op2;
    k=k+1;
    printf("COP %d %d\n", op1, op2);
}
void cop_tmp(int arg){
    int op2 = arg;
    int op1 =  last_address();
    //stack_pop(); //temp var
    instructions[k][0] = 5;
    instructions[k][1] = op1;
    instructions[k][2] = op2;
    k=k+1;
    printf("COP %d %d\n", op1, op2);
}

void afc_ins(int arg){
    stack_push("0");
    int op1 = last_address();
    //int op1 = 1;
    //temp var
    instructions[k][0] = 6;
    instructions[k][1] = op1;
    instructions[k][2] = arg;
    k=k+1;
    printf("AFC %d %d\n", op1, arg);
}
void jmf_ins(){
    stack_push("0");
    int op1 = last_address();
    int op2 =  -1;
    //stack_pop(); //temp var
    instructions[k][0] = 8;
    instructions[k][1] = op1;
    instructions[k][2] = op2;
    k=k+1;
    printf("JMF %d %d\n", op1, op2);
}
void jmp_ins(int arg){

    int op1 = arg;
    //stack_pop(); //temp var
    instructions[k][0] = 7;
    instructions[k][1] = op1 ;

    k=k+1;
    printf("JMP %d \n", op1);
}
void ret_ins(){
    //int op1 = 1;
    //temp var
    instructions[k][0] = 13;
    instructions[k][1] = 0;
    instructions[k][2] = 0;
    k=k+1;
    printf("RET 0 0 0\n");
}
void nop_ins(){
    //int op1 = 1;
    //temp var
    instructions[k][0] = 14;
    instructions[k][1] = 0;
    instructions[k][2] = 0;
    k=k+1;
    printf("NOP 0 0 0\n");
}

void push_ins(int pos ){

    instructions[k][0] = 15;
    instructions[k][1] = pos;
    instructions[k][2] = 0;
    k=k+1;
    printf("push %d 0 0\n",pos);
}

void call_ins (int pos){
     instructions[k][0] = 14;
     instructions[k][1] = pos;
     instructions[k][2] = 0;
     k=k+1;
     printf("call %d 0 0\n",pos);
}

void pop_ins (int pos){
     instructions[k][0] = 15;
     instructions[k][1] = pos;
     instructions[k][2] = 0;
     k=k+1;
     printf("pop %d 0 0\n",pos);
}

int get_current_ins(){
    return k-1;
}
void patch_jmf(int pos){
    instructions[pos][2] = k;
}
void patch_jmp(int pos){
    instructions[pos][1] = k;
}

void generateFileFromTab(int instructions[][4], int numRows) {
    FILE *fp = fopen("output.txt", "w");  // Open the file in write mode

    if (fp == NULL) {
        printf("Failed to open the file.\n");
        return;
    }

    for (int i = 0; i < numRows; i++) {
        fprintf(fp, "%d %d %d %d\n", instructions[i][0], instructions[i][1],
                instructions[i][2], instructions[i][3]);
    }

    fclose(fp);
}


void main1(){
    for (int i =0 ; i<1024 ; i++){
        for (int j = 0 ; j<4 ; j++){
        printf("%d",instructions[i][j]);}
    printf("\n");
    }
     generateFileFromTab(instructions, 1024);

}
