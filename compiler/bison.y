%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "stack.h"
#include "instructions.h"

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
    | declarations_int tSEMI statement
    | declarations_const tSEMI statement
    | assign tSEMI statement {pop_tmp();}; //delete all temp variable after computations
    | while statement
    | if statement
    | print statement
;

declarations_int : tINT declaration_int declarations1_int ;

declaration_int :
    tID { stack_push($1); }
  | tID tASSIGN term { stack_pop();  stack_push($1); };

declarations1_int : %empty | tCOMMA declaration_int declarations1_int ;

declarations_const : tCONST declaration_const declarations1_const ;

declaration_const :
    tID { stack_push($1); }
  | tID tASSIGN term { stack_push($1);  }
;

declarations1_const : %empty
    | tCOMMA declaration_const declarations1_const ;

parameters :
      parameter
    | parameters tCOMMA parameter
;

parameter :
    %empty
    | tVOID
    | tINT tID { stack_push($2); };
;



print : 
    tPRINT tLPAR tID tRPAR tSEMI
;

Return :
    tRETURN term
;

while :
    tWHILE tLPAR expression tRPAR body
;

if : 
      tIF tLPAR expression tRPAR body
    | tIF tLPAR expression tRPAR body tELSE body
    |  tIF tLPAR logique tRPAR body
    | tIF tLPAR logique tRPAR body tELSE body
;

body :
    tLBRACE statement tRBRACE {profondeur_pop();}

assign :
    tID tASSIGN term {cop_ins( find_element($1));stack_pop();}
;

term :
      tID {cop_ins(find_element($1));}
    | tNB {int arg = $1; afc_ins( arg);}
    | term tSUB term {sub_ins();}
    | term tADD term {add_ins();}
    | term tMUL term {mul_ins();}
    | term tDIV term {div_ins();}
    | tID tLPAR args tRPAR
;

args :
    term 
    |term tCOMMA args
;

expression:
    tID{ stack_push("0") ; inc();cop_if(find_element($1)) ; }
    |term tNE term {printf("not equal\n") ;}
    |term tEQ term {int op2 = stack_pop(); int op1= stack_pop() ;stack_push("0"); printf("EQU %d %d %d\n" , last_address(),op1, op2 ) ;}
    |term tGE term {printf("greater or equal\n") ;}
    |term tLE term {printf("less or equal\n") ;}
    |term tLT term {int op2 = stack_pop(); int op1= stack_pop() ;stack_push("0"); printf("INF %d %d %d\n" , last_address(),op1, op2 ) ;}
    |term tGT term {int op2 = stack_pop(); int op1= stack_pop() ;stack_push("0"); printf("SUP %d %d %d\n" , last_address(),op1, op2 ) ;}
;
logique :
    expression tAND expression {printf("and\n") ;}
    | expression tOR expression {printf("or\n") ;}
    | tNOT expression {printf("not\n") ;}
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
  main1();
}

