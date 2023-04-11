%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int yylex (void);
void yyerror (const char *);
%}

%union { int num; char* var ;}

%token tIF tELSE tWHILE 
%token tPRINT tRETURN tINT tVOID tCONST
%token tADD tSUB tMUL tDIV 
%token tASSIGN
%token tLBRACE tRBRACE tLPAR tRPAR tSEMI tCOMMA
%token <var> tID 
%token <num> tNB
%token tERROR
%token tAND tNOT tOR
%token tEQ tNE tLT tLE tGT tGE

%start program

%%
program : 
    /**/
    | program function {printf("main program\n");}
    ;

function :
    tVOID tID tLPAR parameters tRPAR tLBRACE statement tRBRACE {printf("void function\n");}
    | tINT tID tLPAR parameters tRPAR tLBRACE statement Return tSEMI tRBRACE {printf("int function\n");}
;

statement :
    /**/
    | tCONST declare tSEMI statement {printf("declare const\n");}
    | tINT declare tSEMI statement {printf("declare\n");}
    | assign tSEMI statement {printf("assign\n");}
    | while statement {printf("while\n");}
    | if statement
    | print statement {printf("print\n");}
;

parameters :
    parameter 
    | parameters tCOMMA parameter
;

parameter :  
    /**/
    | tVOID
    | tINT tID
;

assign :
    tID tASSIGN term 
;

declare :
    tID
    | assign
    | declare tCOMMA declare
;

while : 
    tWHILE tLPAR expression tRPAR tLBRACE statement tRBRACE 
;

print : 
    tPRINT tLPAR tID tRPAR tSEMI
;

Return :
    tRETURN term {printf("return\n");}
;

if : 
    tIF tLPAR expression tRPAR tLBRACE statement tRBRACE {printf("simple if\n");}
    | tIF tLPAR expression tRPAR tLBRACE statement tRBRACE tELSE tLBRACE statement tRBRACE {printf("if else\n");}
;

term :
    tID 
    | tNB
    | term operator term 
    | tID tLPAR args tRPAR 
;

args : 
    term 
    |term tCOMMA args
;

operator : 
    | tSUB  {printf("SOU ");}
    | tADD  {printf("ADD ");}
    | tMUL  {printf("MUL ");}
    | tDIV  {printf("DIV ");}
;

expression: 
    term comparison term {printf("simple comp\n");}
    | term comparison term tAND expression {printf("comp and\n");}
    | term comparison term tOR expression {printf("comp or\n");}
    | tNOT expression {printf("not comp\n");}
;


comparison : 
    tNE {printf("not eq\n");}
    | tEQ {printf("eq\n");}
    | tGE {printf("greater eq\n");}
    | tLE {printf("less eq\n");}
    | tLT {printf("less than\n");}
    | tGT {printf("greater than\n");}
;


%%


//function called when a syntax error is found
void yyerror(const char *msg) {
  fprintf(stderr, "error: %s\n", msg);
  exit(1);
}

//main function
int main (int argc, char **argv){
  yyparse();
}

