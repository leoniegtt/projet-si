%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "fonctions.h"
#include "stack.h"
#include "instructions.h"
#include "interpreteur.h"
#include "cross.h"

int yylex (void);
void yyerror (const char *);
%}

%define parse.error verbose
%verbose

%union { int num; char var[16];int index;}

%type <index> tIF tWHILE
%type <index> index_jmf index_adr


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
    {stack_delete();} tVOID tID {add_func($3,get_current_ins());}tLPAR {inc(); stack_push("?adr");stack_push("?val");  } parameters tRPAR tLBRACE {inc();} statement {dec();}tRBRACE{ret_ins();}
    | {stack_delete();} tINT tID tLPAR {inc(); stack_push("?adr");stack_push("?val");if(strcmp($3 , "main")==0){init( get_current_ins()+ 1);};add_func($3,get_current_ins()+1);} parameters {dec(); } tRPAR tLBRACE statement Return {cop_ins(find_element("?val"));if(strcmp($3 , "main")==0){ret_ins() ; nop_ins();} else {ret_ins();ret_ins();}} tSEMI tRBRACE
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
  | tID {  stack_push($1);  } tASSIGN term {cop_ins( find_element($1));stack_pop();};

declarations1_int : %empty | tCOMMA declaration_int declarations1_int ;

declarations_const : tCONST declaration_const declarations1_const ;

declaration_const :
    tID { stack_push($1); }
  | tID {  stack_push($1);  }  tASSIGN term { cop_ins( find_element($1));stack_pop(); }
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
    tPRINT tLPAR tID tRPAR tSEMI {print_ins(find_element($3)); }
;

Return :
    tRETURN term {}
;

while :
    tWHILE tLPAR expression tRPAR {jmf_ins(); stack_pop();$1=get_current_ins();}  body { jmp_ins($1);patch_jmf($1); }
;

index_jmf :%empty {jmf_ins(); stack_pop();$$=get_current_ins();}

if : 
      tIF tLPAR expression tRPAR index_jmf body {patch_jmf($5); }
    | tIF tLPAR expression tRPAR index_jmf body {jmp_ins(-1);$1=get_current_ins();patch_jmf($5);}tELSE body{patch_jmp($1);}
    | tIF tLPAR logique tRPAR body
    | tIF tLPAR logique tRPAR body tELSE body
;

body :
    tLBRACE {inc(); printf(" la prondeur actuelle en entree est : %d",get_profondeur()); } statement tRBRACE {profondeur_pop(); printf(" la prondeur actuelle en sortie est : %d",get_profondeur());  }


assign :
    tID tASSIGN term {cop_ins( find_element($1));stack_pop();}
;

index_adr :%empty {}

term :
      tID {stack_push("0") ; cop_tmp(find_element($1));}
    | tNB {int arg = $1; afc_ins(arg);}
    | term tSUB term {sub_ins();}
    | term tADD term {add_ins();}
    | term tMUL term {mul_ins();}
    | term tDIV term {div_ins();}
    | tID index_adr {stack_push("!adr");stack_push("!val");}tLPAR args tRPAR {push_ins(find_element("!adr"));call_ins(get_position($1));$2 = find_element("!val");pop_ins(find_element("!adr"));pop_call("!adr");cop_tmp($2);}
;

args :
    term 
    |term tCOMMA args
;

expression:
    tID{ stack_push("0") ; cop_tmp(find_element($1)) ; stack_pop(); }
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

  //build_table();
  //interpret();
  main_int();

  main_cross();

  printf("j'ai fini\n");

  return 0;
}

