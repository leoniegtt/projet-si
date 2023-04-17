#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "stack.h"

typedef struct stack
{
   struct stack *prev;
   struct stack *next;
   char id[20];
   int address;
   int profondeur;
   /*char type[20];*/
  
} stack_s;

void stack_push (stack_s ** pp_stack, char* id, int address , int profondeur)
{

   if (pp_stack != NULL)
   {
// insert element after p_p pointer
      stack_s *p_p = *pp_stack;
      stack_s *p_l = NULL;

// create element pointed by p_l
      p_l = malloc (sizeof (stack_s));
      if (p_l != NULL)
      {
         strcpy(p_l->id,id);
         (*p_l).address = address;
         (*p_l).profondeur = profondeur ;
// add new element at the end of the stack
         p_l->next = NULL;
         p_l->prev = p_p;
         if (p_p != NULL)
            p_p->next = p_l;
// point pp_pile on new element
         *pp_stack = p_l;
      }
      else
      {
         fprintf (stderr, "Memoire insuffisante\n");
         exit (EXIT_FAILURE);
      }
   }
   return;
}

void stack_pop (stack_s ** pp_stack)
{

   if (pp_stack != NULL && *pp_stack != NULL)
   {
      stack_s *p_l = *pp_stack;
      stack_s *p_p = p_l->prev;

      if (p_p != NULL)
         p_p->next = NULL;
      
      free (p_l);
      p_l = NULL;
      *pp_stack = p_p;
   }
   
}

void profondeur_pop (stack_s ** pp_stack)
{

    
   int profondeur_actu = (*pp_stack)->profondeur;
   printf("la prof est %d \n",profondeur_actu);
   while ((*pp_stack)->profondeur == profondeur_actu){   
      stack_pop(pp_stack);  
   }
}

 int est_prest(stack_s ** pp_stack,char* id)
{
   int est_pres=0;
   if (pp_stack != NULL && *pp_stack != NULL)
   {  
      stack_s *pp = *pp_stack; 
      while (pp != NULL){
         if( strcmp(((pp)->id), id) == 0 ){
            est_pres=1;
            break;
         }
         pp = (pp)->prev;
      }
      return est_pres;
   }
   
}


void stack_delete (stack_s ** pp_stack)
{
   if (pp_stack != NULL && *pp_stack != NULL)
   {
      while (*pp_stack != NULL)
         stack_pop (pp_stack);
   }

}

void printstack (stack_s ** pp_stack){
   if (pp_stack != NULL && *pp_stack != NULL)
   {
   stack_s *pp = *pp_stack; 
      while ((pp)->prev != NULL){
         printf("----------------------- %d ----------- \n",(pp)->address);
         pp = (pp)->prev;
         }
      printf("----------------------- %d ----------- \n",(pp)->address);
   }

}
int main(){
   /* tests de la pile*/
    stack_s* mapile = NULL;
    stack_push(&mapile , "toto",  5050 ,  0);
    stack_push(&mapile , "titi",  5055 ,  0);
    stack_push(&mapile , "tata",  5060 ,  1);
    stack_push(&mapile , "tt",  5065 ,  1);
    stack_push(&mapile , "ttd",  5070 ,  1);
    printstack(&mapile);
    printf("____________________________________________________ \n");
    profondeur_pop(&mapile);
    printstack(&mapile);
    printf("%d \n",est_prest(&mapile , "tito"));


}
