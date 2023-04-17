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
    | program function {printf("main program\n");}
    ;

function :
    tVOID tID tLPAR parameters tRPAR tLBRACE statement tRBRACE {printf("void function\n");}
    | tINT tID tLPAR parameters tRPAR tLBRACE statement Return tSEMI tRBRACE {printf("int function\n");}
;

statement :
    %empty
    /**/
    | declarations_int tSEMI statement
    | declarations_const tSEMI statement
    | assign tSEMI statement {printf("assign\n");}
    | while statement {printf("while\n");}
    | if statement
    | print statement {printf("print\n");}
;

declarations_int : tINT declaration_int declarations1_int ;

declaration_int :
    tID
        { stack_push($1, 0); }
  | tID tASSIGN term
        { stack_push($1, 1); };

declarations1_int : %empty | tCOMMA declaration_int declarations1_int ;

declarations_const : tCONST declaration_const declarations1_const ;

declaration_const :
    tID
        { stack_push($1, 0); }
  | tID tASSIGN term
        { stack_push($1, 1); };

declarations1_const : %empty | tCOMMA declaration_const declarations1_const ;

parameters :
      parameter
    | parameters tCOMMA parameter
;

parameter :
    %empty
    | tVOID
    | tINT tID
;

assign :
    tID tASSIGN term {printf("on push ici ?\n");}
;

body :
tLBRACE {/*inc;*/} statement tRBRACE {/*dec;*/} ;

while : 
    tWHILE tLPAR expression tRPAR body
;

print : 
    tPRINT tLPAR tID tRPAR tSEMI
;

Return :
    tRETURN term {printf("return\n");}
;

if : 
      tIF tLPAR expression tRPAR body {printf("simple if\n");}
    | tIF tLPAR expression tRPAR body tELSE body {printf("if else\n");}
;

term :
      tID
    | tNB
    | term tSUB term
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

