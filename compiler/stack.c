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
} stack_s;

stack_s* pp_stack = NULL;
int address = 0;
int profondeur;
int BP= 0;

void inc (){
profondeur ++;
}

void dec (){
profondeur --;
}
/*
stack_s* getprev (){
    return pp_stack->prev;}

int getaddress(stack_s* pp){
    return pp->address;
}
*/

void hautPile (){
    BP = pp_stack->address;
}
void stack_push (char* id){
printf("?????????? %s\n", id);
    if (strcmp(id,"0")!=0){
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
    }
    //tmp var => arg = 0 (will be deleted after)
    else {// insert element after p_p pointer
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
                }
       return;
    }
}

int stack_pop ()
{

   if (pp_stack != NULL)
   {
      stack_s *p_l = pp_stack;
      stack_s *p_p = p_l->prev;

      int ret = pp_stack->address;
      address-=4;
      free(pp_stack);
      pp_stack = p_p;

      if (p_p != NULL) {
      p_p ->next = NULL;
      }

      return ret;
   }
}

int last_address() {
return pp_stack->address;
}

int find_element(char* id){
stack_s* tmp = pp_stack;
    int found = 0;
    while (tmp != NULL && !found){
        if(strcmp(tmp->id , id ) != 0){
            tmp = tmp->prev;
        }
        else found =1;

    }
    if (found)
    return tmp->address;
    else return -1;
}

void profondeur_pop (){
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
         stack_pop ();
      address = 0;
}

void pop_tmp(){
    while (strcmp(pp_stack->id,"0" )==0){
        stack_pop();
    }
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
    // tests de la pile
    stack_push("toto");
    stack_push("titi");
    stack_push( "tata");
    stack_push( "tt");
    stack_push( "tt");
    stack_push( "0");
    stack_push( "0");
    stack_push( "0");


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
    printf("%d \n",find_element("tt"));
     pop_tmp();
     printstack();


}
#endif