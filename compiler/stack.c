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

stack_s* pp_stack = NULL;
int address = 0;
int profondeur;

void inc (){
profondeur ++;
}

void dec (){
profondeur --;
}

void stack_push (char* id)
{
    int est_pres;
    est_pres = est_prest(id);
    if (est_pres == 0)
    {
        // insert element after p_p pointer
      stack_s *p_p = pp_stack;
      stack_s *p_l = NULL;

    // create element pointed by p_l
      p_l = malloc (sizeof (stack_s));
      if (p_l != NULL)
      {
         strcpy(p_l->id,id);

         (*p_l).address = address;
         address = address +4 ;
         (*p_l).profondeur = profondeur ;
    // add new element at the end of the stack
         p_l->next = NULL;
         p_l->prev = p_p;
         if (p_p != NULL)
            p_p->next = p_l;
    // point pp_pile on new element
         pp_stack = p_l;
         printstack();
      }
      else
      {
         fprintf (stderr, "Memoire insuffisante\n");
         exit (EXIT_FAILURE);
      }
    }
    else{}
       return;
    }

void stack_pop ()
{

   if (pp_stack != NULL)
   {
      stack_s *p_l = pp_stack;
      stack_s *p_p = p_l->prev;

      if (p_p != NULL)
         p_p->next = NULL;
      
      free (p_l);
      p_l = NULL;
      pp_stack = p_p;
      address--;
   }
   
}

void profondeur_pop (){
   //printf("je suis la la prof est %d\n",profondeur);
   while (pp_stack !=NULL && (pp_stack)->profondeur == profondeur){
      stack_pop(pp_stack);  
   }
   dec();
}

 int est_prest(char* id)
{
   int est_pres=0;
   if (pp_stack != NULL)
   {  
      stack_s *pp = pp_stack;
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


void stack_delete ()
{
      while (pp_stack != NULL)
         stack_pop (pp_stack);

}

void printstack (){
   if (pp_stack != NULL)
   {
   stack_s *pp = pp_stack;
      while ((pp)->prev != NULL){
         printf("--------- %d --- %d -----%s--- \n",(pp)->address ,(pp)->profondeur ,(pp)->id);
         pp = (pp)->prev;
         }
      printf("--------- %d --- %d -----%s--- \n",(pp)->address ,(pp)->profondeur ,(pp)->id);


      printf("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\n");
   }

}

#if 0
int main(){
   /* tests de la pile*/

    stack_push("toto");
    stack_push("titi");
    stack_push( "tata");
    stack_push( "tt");
    stack_push( "tt");
    inc();
    stack_push( "ttd");
    printstack();
    printf("la profondeur est %d \n", profondeur);
    printf("____________________________________________________ \n");
    printf("____________________________________________________ \n");
    profondeur_pop();
    printstack();
    printf("la profondeur est %d \n", profondeur);
    printf("%d \n",est_prest("toto"));
}
#endif