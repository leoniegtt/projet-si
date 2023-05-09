%option noyywrap
%option noinput
%option nounput

/*DEFINITIONS*/
%{
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "bison.tab.h"
%}

DIGIT [0-9]
LETTER [a-zA-Z]


/* rules  */
%%

"if"       {return tIF;}
"else"     {return tELSE;}
"while"    {return tWHILE;}
"print"    {return tPRINT;}
"return"   {return tRETURN;}
"int"      {return tINT;}
"const"    {return tCONST;}
"void"     {return tVOID;}

"+"        {return tADD;}
"-"        {return tSUB;}
"*"        {return tMUL;}
"/"        {return tDIV;}

"<"        {return tLT;}
">"        {return tGT;}
"!="       {return tNE;}
"=="       {return tEQ;}
">="       {return tGE;}
"<="       {return tLE;}

"="        {return tASSIGN;}

"&&"       {return tAND;}
"||"       {return tOR;}
"!"        {return tNOT;}

"{"        {return tLBRACE;}
"}"        {return tRBRACE;}
"("        {return tLPAR;}
")"        {return tRPAR;}
";"        {return tSEMI;}
","        {return tCOMMA;}


[ \t]+         /*ignore whitespace*/

"//".*             /* ignore single line comment */
\/\*([^*]|\*+[^/])*\*+\/ /* ignore multiple line comment */

{LETTER}({DIGIT}|{LETTER})*  {strcpy(yylval.var, yytext); return tID;}
[1-9]*[0-9]+  { yylval.num = atoi(yytext); return tNB;}
0x.[0-9a-zA-Z]+|[1-9]*[0-9]+|[1-9]*[0-9]+e[1-9]*[0-9]+  { return tNB;}

.       {return tERROR;}


%%

/* user code */  
/*  
int main (int argc, char **argv)
{
    ++argv, --argc;
        if ( argc > 0 )
                yyin = fopen( argv[0], "r" );
        else
                yyin = stdin;
        yylex();
}
*/