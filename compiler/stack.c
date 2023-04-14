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
         int addr = p_p->address;
         printf("-----------------\n");
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

    stack_s *p_p = *pp_stack;
    int profondeur_actu = p_p->profondeur;

    //while(p_p->)
    while ((*p_p).profondeur == profondeur_actu){
        stack_pop(pp_stack);
        stack_s *p_p = *pp_stack;
    }
}

/*stack_s* get_top(stack_s ** pp_stack)
{
     stack_s *p_p = *pp_stack;
     stack_s *top = p_p;
     while(top->next!=NULL){
        top=top->next;
     }
     return top;

}
*/

void stack_delete (stack_s ** pp_stack)
{
   if (pp_stack != NULL && *pp_stack != NULL)
   {
      while (*pp_stack != NULL)
         stack_pop (pp_stack);
   }

}

int main(){
    stack_s* mapile = NULL;
    stack_push(&mapile , "toto",  5050 ,  0);
}