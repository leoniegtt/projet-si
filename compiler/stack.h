#ifndef H_PILE
#define H_PILE

typedef struct stack stack_s;

stack_s *stack (void);
stack_s *stack_temp (void);

void stack_push (stack_s ** , char* , int  , int );
void stack_pop (stack_s **);
void stack_delete (stack_s **);
void profondeur_pop (stack_s ** );
#endif /* not H_PILE */