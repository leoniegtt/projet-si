#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include  <stdbool.h>
#include "interpreteur.h"
#include "instructions.h"

int registre[64];
int instructions_bis[1024][4];
int nb_instructions = 0;

void generateFileFromTab_bis(int instructions[][4], int numRows) {
    FILE *fp = fopen("output_bis.txt", "w");  // Open the file in write mode
    printf("generatefile\n");
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

void build_table() {   
    printf("build table\n");
    FILE *fp;
    fp = fopen ("output.txt", "r");

    char line[64];
    int i =0;
    while (i < 1024) {
        fscanf(fp, "%d %d %d %d", &instructions_bis[i][0], &instructions_bis[i][1], &instructions_bis[i][2], &instructions_bis[i][3]) == 1;
        i++;
    }

    nb_instructions =i;
    printf("i= %d \n", i);

    fclose(fp);
}

void interpret(){

    int i = 0 ;
    int pt =0;
    bool end = false;
    while (!end){
        
        switch(instructions_bis[i][0]){
            case 1: //ADD
                registre[pt+instructions_bis[i][1]]= registre[pt+instructions_bis[i][2]]+registre[pt+instructions_bis[i][3]];
                break;
            case 2: //MUL
                registre[pt+instructions_bis[i][1]]= registre[pt+instructions_bis[i][2]]*registre[pt+instructions_bis[i][3]];
                break;
            case 3: //SUB
                registre[pt+instructions_bis[i][1]]= registre[pt+instructions_bis[i][2]]-registre[pt+instructions_bis[i][3]];
                break;
            case 4: //DIV
                registre[pt+instructions_bis[i][1]]= registre[pt+instructions_bis[i][2]]/registre[pt+instructions_bis[i][3]];
                break;
            case 5: //COP
                registre[pt+instructions_bis[i][1]]= registre[pt+instructions_bis[i][2]];
                break;
            case 6: //AFC
             printf("registre n°%d: %d \n",pt+instructions_bis[i][1], instructions_bis[i][2]);

                registre[pt+instructions_bis[i][1]]= instructions_bis[i][2];
                break;
            case 7: //JMP
                i = instructions_bis[i][1]-1 ; 
                break;
            case 8: //JMF
                if (registre[instructions_bis[i][1]]==0) {
                    i = instructions_bis[i][2]-1; 
                }
                break;
            case 9: //INF
                registre[instructions_bis[i][1]]= instructions_bis[i][2] < instructions_bis[i][3];
                pt = instructions_bis[i][1];
                break;
            case 10: //SUP
                registre[instructions_bis[i][1]]= instructions_bis[i][2] > instructions_bis[i][3];
                pt = instructions_bis[i][1];
                break;
            case 11: //EQU
                registre[instructions_bis[i][1]]= (instructions_bis[i][2] == instructions_bis[i][3]);
                pt = instructions_bis[i][1];
                break;
            case 12: //CALL
                registre[pt] = i +1;
                i = instructions_bis[i][1]-1;
                break;
            case 13: //RET

                i = registre[pt]-1;
                if(i == -1){
                    end = true;
                }
                break;
            case 14: //NOP
                end = true;
                break;
            case 15: //POP
                pt = pt-instructions_bis[i][1];
                break;
            case 16: //PUSH
                pt = pt+instructions_bis[i][1];
                break;
            case 17://PRI
                //printf("%d\n",registre[instructions_bis[i][1]]);
                break;
        } 
printf("----%d\n",instructions_bis[i][0]);
 printf("%d %d %d %d\n", instructions_bis[i][0],instructions_bis[i][1],instructions_bis[i][2],instructions_bis[i][3]);
    
  //print registres
    for (int i =0 ; i<10 ; i++){
        printf("registre n°%d: %d \n",i, registre[i]);

    } 

        i++;
        printf("%d \n",i); 
    }

    //print registres
    for (int i =0 ; i<10 ; i++){
        printf("registre n°%d: %d \n",i, registre[i]);

    } 
    //print instructions
    for (int i =0 ; i<nb_instructions ; i++){
            if (instructions_bis[i][0]==0){
                break;
            }
            else{
                printf("%d %d %d %d\n", instructions_bis[i][0],instructions_bis[i][1],instructions_bis[i][2],instructions_bis[i][3]);
            }}
   
    
    printf("fin interpret\n");
}

void main_int(){
    printf("main_int\n");
    build_table();
    interpret();
    generateFileFromTab_bis(instructions_bis, 1024);
}