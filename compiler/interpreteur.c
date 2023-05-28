#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "interpreteur.h"
#include "instructions.h"
#include "stack.h"
#include <stdio.h>

void read_file() {
    FILE *fp;
    fp = fopen ("output.txt", "r");
    int k=64;
    char line[k];
    //lire le fichier ligne par ligne
    while (!feof(fp)) {
        fgets(line, sizeof(line), fp);
        printf("test\n");
    }


    fclose(fp);
}

void interpret(){
    read_file();

}