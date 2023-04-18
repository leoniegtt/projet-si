%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "stack.h"
int yylex (void);
void yyerror (const char *);
%}

%define parse.error verbose
%verbose

%union { int num; char var[16];}

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

%left tADD tSUB
%left tMUL tDIV

%start program

%%
program :
    %empty
    | program function
    ;

function :
    {stack_delete();} tVOID tID tLPAR parameters tRPAR tLBRACE statement tRBRACE
    | {stack_delete();} tINT tID tLPAR parameters tRPAR tLBRACE statement Return tSEMI tRBRACE
;

statement :
    %empty
    /**/
    | declarations_int tSEMI statement
    | declarations_const tSEMI statement
    | assign tSEMI statement
    | while statement
    | if statement
    | print statement
;

declarations_int : tINT declaration_int declarations1_int ;

declaration_int :
    tID
        { stack_push($1); }
  | tID tASSIGN term
        { stack_push($1); };

declarations1_int : %empty | tCOMMA declaration_int declarations1_int ;

declarations_const : tCONST declaration_const declarations1_const ;

declaration_const :
    tID
        { stack_push($1); }
  | tID tASSIGN term
        { stack_push($1); }
;

declarations1_const : %empty | tCOMMA declaration_const declarations1_const ;

parameters :
      parameter
    | parameters tCOMMA parameter
;

parameter :
    %empty
    | tVOID
    | tINT tID { stack_push($2); };
;

assign :
    tID tASSIGN term
;

body :
tLBRACE {inc();} statement tRBRACE {profondeur_pop();}

while : 
    tWHILE tLPAR expression tRPAR body
;

print : 
    tPRINT tLPAR tID tRPAR tSEMI
;

Return :
    tRETURN term
;

if : 
      tIF tLPAR expression tRPAR body
    | tIF tLPAR expression tRPAR body tELSE body
;

term :
      tID
    | tNB
    | term tSUB term {computation(3,$1, $3);}
    | term tADD term
    | term tMUL term
    | term tDIV term
    | tID tLPAR args tRPAR
;

args : 
    term 
    |term tCOMMA args
;

expression: 
    term comparison term
    | term comparison term tAND expression
    | term comparison term tOR expression
    | tNOT expression
;


comparison : 
    tNE
    | tEQ
    | tGE
    | tLE
    | tLT
    | tGT
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

