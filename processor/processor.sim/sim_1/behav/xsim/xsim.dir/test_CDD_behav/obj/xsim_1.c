/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern void execute_108(char*, char *);
extern void execute_109(char*, char *);
extern void execute_54(char*, char *);
extern void execute_55(char*, char *);
extern void execute_56(char*, char *);
extern void execute_63(char*, char *);
extern void execute_64(char*, char *);
extern void execute_65(char*, char *);
extern void execute_79(char*, char *);
extern void execute_80(char*, char *);
extern void execute_87(char*, char *);
extern void execute_91(char*, char *);
extern void execute_92(char*, char *);
extern void execute_99(char*, char *);
extern void execute_104(char*, char *);
extern void execute_105(char*, char *);
extern void execute_106(char*, char *);
extern void execute_107(char*, char *);
extern void execute_52(char*, char *);
extern void execute_53(char*, char *);
extern void execute_58(char*, char *);
extern void execute_59(char*, char *);
extern void execute_60(char*, char *);
extern void execute_61(char*, char *);
extern void execute_62(char*, char *);
extern void execute_73(char*, char *);
extern void execute_74(char*, char *);
extern void execute_75(char*, char *);
extern void execute_76(char*, char *);
extern void execute_77(char*, char *);
extern void execute_78(char*, char *);
extern void execute_89(char*, char *);
extern void execute_90(char*, char *);
extern void execute_101(char*, char *);
extern void execute_102(char*, char *);
extern void execute_103(char*, char *);
extern void transaction_0(char*, char*, unsigned, unsigned, unsigned);
extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
funcp funcTab[38] = {(funcp)execute_108, (funcp)execute_109, (funcp)execute_54, (funcp)execute_55, (funcp)execute_56, (funcp)execute_63, (funcp)execute_64, (funcp)execute_65, (funcp)execute_79, (funcp)execute_80, (funcp)execute_87, (funcp)execute_91, (funcp)execute_92, (funcp)execute_99, (funcp)execute_104, (funcp)execute_105, (funcp)execute_106, (funcp)execute_107, (funcp)execute_52, (funcp)execute_53, (funcp)execute_58, (funcp)execute_59, (funcp)execute_60, (funcp)execute_61, (funcp)execute_62, (funcp)execute_73, (funcp)execute_74, (funcp)execute_75, (funcp)execute_76, (funcp)execute_77, (funcp)execute_78, (funcp)execute_89, (funcp)execute_90, (funcp)execute_101, (funcp)execute_102, (funcp)execute_103, (funcp)transaction_0, (funcp)vhdl_transfunc_eventcallback};
const int NumRelocateId= 38;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/test_CDD_behav/xsim.reloc",  (void **)funcTab, 38);
	iki_vhdl_file_variable_register(dp + 31280);
	iki_vhdl_file_variable_register(dp + 31336);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/test_CDD_behav/xsim.reloc");
}

void simulate(char *dp)
{
	iki_schedule_processes_at_time_zero(dp, "xsim.dir/test_CDD_behav/xsim.reloc");
	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net
	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern void implicit_HDL_SCinstatiate();

extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/test_CDD_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/test_CDD_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/test_CDD_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
