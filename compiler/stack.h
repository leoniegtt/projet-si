#ifndef H_PILE
#define H_PILE

//typedef struct stack stack_s;

//stack_s *stack (void);
//stack_s *stack_temp (void);


int get_profondeur();
void stack_push (char*  );
int stack_pop ();
void stack_delete ();
void profondeur_pop ();
int est_prest(char* id);
void inc();
void dec();
int last_address();
int find_element(char* id);
void printstack ();
void hautPile();
//stack_s* getprev();
void pop_tmp();
//int getaddress(stack_s* pp);

#endif /* not H_PILE */