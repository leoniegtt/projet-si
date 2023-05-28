#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "interpreteur.h"
#include "instructions.h"
#include "stack.h"
#include <stdio.h>

int registre[64];
int instructions_bis[1024][4];
int nb_instructions = 0;


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
    printf("coucou interpret\n");

    //for (int i = 0; i < nb_instructions; i++) {
    while (i<nb_instructions){
        switch(instructions_bis[i][0]){
            case 1: //ADD
                registre[instructions_bis[i][1]]= registre[instructions_bis[i][2]]+registre[instructions_bis[i][3]];
                break;
            case 2: //MUL
                registre[instructions_bis[i][1]]= registre[instructions_bis[i][2]]*registre[instructions_bis[i][3]];
                break;
            case 3: //SUB
                registre[instructions_bis[i][1]]= registre[instructions_bis[i][2]]-registre[instructions_bis[i][3]];
                break;
            case 4: //DIV
                registre[instructions_bis[i][1]]= registre[instructions_bis[i][2]]/registre[instructions_bis[i][3]];
                break;
            case 5: //COP
                registre[instructions_bis[i][1]]= registre[instructions_bis[i][2]];
                break;
            case 6: //AFC
                registre[instructions_bis[i][1]]= instructions_bis[i][2];
                break;
            case 7: //JMP
                i = registre[instructions_bis[i][1]]; // Subtract 1 to account for the loop's increment
                break;
            case 8: //JMF
                if (!registre[instructions_bis[i][1]]) {
                    i = instructions_bis[i][2]; // Subtract 1 to account for the loop's increment
                }
                break;
                    
            case 9: //INF
                registre[instructions_bis[i][1]]= instructions_bis[i][2] < instructions_bis[i][3];
                break;
            case 10: //SUP
                registre[instructions_bis[i][1]]= instructions_bis[i][2] > instructions_bis[i][3];
                break;
            case 11: //EQU
                registre[instructions_bis[i][1]]= (instructions_bis[i][2] == instructions_bis[i][3]);
                break;
            case 12: //CALL
                //TO DO: registre[instructions_bis[i][1]]= instructions_bis[i][2] == instructions_bis[i][3];
                break;
            case 13: //RET
            //TO DO: registre[instructions_bis[i][1]]= instructions_bis[i][2] == instructions_bis[i][3];
                break;
            case 14: //NOP
                break;
            case 15: //POP
            //TO DO
                break;
            case 16: //PUSH
            //TO DO
                break;
            case 17://PRI
                printf("%d\n",registre[instructions_bis[i][1]]);
                break;
        }  
        i++;
       
    }
    //print instructions
    for (int i =0 ; i<nb_instructions ; i++){
            if (instructions_bis[i][0]==0){
                break;
            }
            else{
                printf("%d %d %d %d\n", instructions_bis[i][0],instructions_bis[i][1],instructions_bis[i][2],instructions_bis[i][3]);
            }
    }
    //print registres
    for (int i =0 ; i<64 ; i++){
        printf("registre n°%d: %d \n",i, registre[i]);

    }
    printf("fin interpret\n");
}

void main_int(){
    printf("main_int\n");
    build_table();
    interpret();
}