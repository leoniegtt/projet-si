#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "interpreteur.h"
#include "cross.h"


int instruction_mem[1024][4];
int instruction_cross[1024][4];

int nb_instructions_bis = 0;
int nb_instructions_cross = 0;

void build_table_cross() {   
    printf("build table cross\n");
    FILE *fp;
    fp = fopen ("output_bis.txt", "r");

    char line[64];
    int i =0;
    while (i < 1024) {
        fscanf(fp, "%d %d %d %d", &instruction_mem[i][0], &instruction_mem[i][1], &instruction_mem[i][2], &instruction_mem[i][3]) == 1;
        i++;
    }

    nb_instructions_bis =i;
    printf("i= %d \n", i);

    fclose(fp);
}

void cross(){
    int j=0;
    int i = 0 ;
    

    //for (int i = 0; i < nb_instructions; i++) {
    while (i<nb_instructions_bis){
        switch(instruction_mem[i][0]){
            case 1: //ADD

                instruction_cross[j][0] = 7;instruction_cross[j][1] = 0;instruction_cross[j][2] = instruction_mem[i][2] ;
                j= j+1;
                instruction_cross[j][0] = 7;instruction_cross[j][1] = 1;instruction_cross[j][2] = instruction_mem[i][3] ;
                j=j+1 ;
                instruction_cross[j][0] = 1; instruction_cross[j][1] = 2;instruction_cross[j][2] = 0;instruction_cross[j][3] = 1;
                j=j+1;
                instruction_cross[j][0] = 8; instruction_cross[j][1] = instruction_mem[i][1] ; instruction_cross[j][2] = 2;
                break;

            case 2: //MUL

                instruction_cross[j][0] = 7;instruction_cross[j][1] = 0;instruction_cross[j][2] = instruction_mem[i][2] ;
                j= j+1;
                instruction_cross[j][0] = 7;instruction_cross[j][1] = 1;instruction_cross[j][2] = instruction_mem[i][3] ;
                j=j+1 ;
                instruction_cross[j][0] = 1; instruction_cross[j][1] = 2;instruction_cross[j][2] = 0;instruction_cross[j][3] = 1;
                j=j+1;
                instruction_cross[j][0] = 8; instruction_cross[j][1] = instruction_mem[i][1] ; instruction_cross[j][2] = 2;
            
            case 3: //SUB

                instruction_cross[j][0] = 7;instruction_cross[j][1] = 0;instruction_cross[j][2] = instruction_mem[i][2] ;
                j= j+1;
                instruction_cross[j][0] = 7;instruction_cross[j][1] = 1;instruction_cross[j][2] = instruction_mem[i][3] ;
                j=j+1 ;
                instruction_cross[j][0] = 1; instruction_cross[j][1] = 2;instruction_cross[j][2] = 0;instruction_cross[j][3] = 1;
                j=j+1;
                instruction_cross[j][0] = 8; instruction_cross[j][1] = instruction_mem[i][1] ; instruction_cross[j][2] = 2;
                break;

            case 4: //DIV

                instruction_cross[j][0] = 7;instruction_cross[j][1] = 0;instruction_cross[j][2] = instruction_mem[i][2] ;
                j= j+1;
                instruction_cross[j][0] = 7;instruction_cross[j][1] = 1;instruction_cross[j][2] = instruction_mem[i][3] ;
                j=j+1 ;
                instruction_cross[j][0] = 1; instruction_cross[j][1] = 2;instruction_cross[j][2] = 0;instruction_cross[j][3] = 1;
                j=j+1;
                instruction_cross[j][0] = 8; instruction_cross[j][1] = instruction_mem[i][1] ; instruction_cross[j][2] = 2;
                break;

            case 5: //COP

                instruction_cross[j][0] = 7;instruction_cross[j][1] = 0;instruction_cross[j][2] = instruction_mem[i][2] ;
                j=j+1;
                instruction_cross[j][0] = 8;instruction_cross[j][1] = instruction_mem[i][1]; instruction_cross[j][2] = 0;
                j=j+1 ;
                
                break;
            case 6: //AFC 

                instruction_cross[j][0] = 6 ; instruction_cross[j][1] = 0 ; instruction_cross[j][2] = instruction_mem[i][2] ;
                j = j+1 ;
                instruction_cross[j][0] = 8 ; instruction_cross[j][1] = instruction_mem[i][1] ; instruction_cross[j][2] = 0 ;
                j = j+1;

                break;

            case 7: //JMP
                
                break;
            case 8: //JMF
                
                break;
            case 9: //INF
               
                break;
            case 10: //SUP
                
                break;
            case 11: //EQU
                
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

                break;
        }  
        i++;       
    }
    nb_instructions_cross = j;
    printf ("nb intructions cross = %d \n",nb_instructions_cross);
}

void print_cross() {
        for (int i =0 ; i<nb_instructions_cross ; i++){
            if (instruction_cross[i][0]==0){
                //break;
            }
            else{
                printf("%d %d %d %d\n", instruction_cross[i][0],instruction_cross[i][1],instruction_cross[i][2],instruction_cross[i][3]);
            }
    }
}


void main_cross() {
    build_table_cross();
    cross();
    print_cross();
}