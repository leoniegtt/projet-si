

void sub_ins();
void add_ins();
void mul_ins();
void div_ins();
void equ_ins();
void afc_ins(int arg);
void cop_ins(int arg);
void ret_ins();
void nop_ins();
void main1();
void jmf_ins();
void jmp_ins(int arg);
void patch_jmp(int pos);
void patch_jmf(int pos);
void call_ins(int pos);
void pop_ins();
int get_current_ins();
void cop_tmp();
void push_ins(int pos);