
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIgned.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity chemin_donnees is
    Port ( rst : in STD_LOGIC;
           CLK: in STD_LOGIC);
end chemin_donnees;

architecture Behavioral of chemin_donnees is

    component ALU
        port(A : in std_logic_vector(7 downto 0);
                B : in std_logic_vector(7 downto 0);
                N : out STD_LOGIC;
                O : out STD_LOGIC;
                Z : out STD_LOGIC;
                C : out STD_LOGIC;
                S : out std_logic_vector(7 downto 0);
                Ctrl_Alu : in std_logic_vector(2 downto 0));
        end component ALU;
        
        COMPONENT data_memory
        Port ( Addr : in STD_LOGIC_VECTOR (7 downto 0);
               I : in STD_LOGIC_VECTOR (7 downto 0);
               RW : in STD_LOGIC;
               RST : in STD_LOGIC;
               CLK : in STD_LOGIC;
               O : out STD_LOGIC_VECTOR (7 downto 0));
         end COMPONENT;   
         
         COMPONENT Banc_De_Registres
          Port ( Addr_A : in STD_LOGIC_VECTOR (3 downto 0);
                    Addr_B : in STD_LOGIC_VECTOR (3 downto 0);
                    Addr_W : in STD_LOGIC_VECTOR (3 downto 0);
                    Data : in STD_LOGIC_VECTOR (7 downto 0);
                    RST : in STD_LOGIC;
                    CLK : in STD_LOGIC;
                    W : in STD_LOGIC;
                    QA : out STD_LOGIC_VECTOR (7 downto 0);
                    QB: out STD_LOGIC_VECTOR (7 downto 0));
         end COMPONENT;
         
         COMPONENT instruction_memory
           Port ( Addr : in STD_LOGIC_VECTOR (7 downto 0);
                    CLK : in STD_LOGIC;
                    O : out STD_LOGIC_VECTOR (31 downto 0));
         end COMPONENT;
         
         COMPONENT pipeline
           Port ( op1 : in STD_LOGIC_VECTOR (7 downto 0);
                  op2 : in STD_LOGIC_VECTOR (7 downto 0);
                  op3 : in STD_LOGIC_VECTOR (7 downto 0);
                  op4 : in STD_LOGIC_VECTOR (7 downto 0);
                  out1 : out STD_LOGIC_VECTOR (7 downto 0);
                  out2 : out STD_LOGIC_VECTOR (7 downto 0);
                  out3 : out STD_LOGIC_VECTOR (7 downto 0);
                  out4 : out STD_LOGIC_VECTOR (7 downto 0);
                  CLK : in STD_LOGIC;
                  rst : in STD_LOGIC);
         end COMPONENT;
         
-- Instruction memory   
signal IP_1 : STD_LOGIC_VECTOR (7 downto 0); 
signal OUT_1 : STD_LOGIC_VECTOR (31 downto 0);  
        
--LI/DI 
signal A_LI_DI : STD_LOGIC_VECTOR (7 downto 0);
signal B_LI_DI : STD_LOGIC_VECTOR (7 downto 0);
signal C_LI_DI : STD_LOGIC_VECTOR (7 downto 0);
signal OP_LI_DI : STD_LOGIC_VECTOR (7 downto 0);

--DI/EX 
signal A_DI_EX : STD_LOGIC_VECTOR (7 downto 0);
signal B_DI_EX : STD_LOGIC_VECTOR (7 downto 0);
signal C_DI_EX : STD_LOGIC_VECTOR (7 downto 0);
signal OP_DI_EX : STD_LOGIC_VECTOR (7 downto 0);

--EX/Mem 
signal A_EX_MEM : STD_LOGIC_VECTOR (7 downto 0);
signal B_EX_MEM : STD_LOGIC_VECTOR (7 downto 0);
signal C_EX_MEM : STD_LOGIC_VECTOR (7 downto 0);
signal OP_EX_MEM : STD_LOGIC_VECTOR (7 downto 0);

--Mem/RE 
signal A_MEM_RE : STD_LOGIC_VECTOR (7 downto 0);
signal B_MEM_RE : STD_LOGIC_VECTOR (7 downto 0);
signal C_MEM_RE : STD_LOGIC_VECTOR (7 downto 0);
signal OP_MEM_RE : STD_LOGIC_VECTOR (7 downto 0);

signal QA : STD_LOGIC_VECTOR (7 downto 0);
signal QB : STD_LOGIC_VECTOR (7 downto 0);

--UAL
signal S_UAL : STD_LOGIC_VECTOR (7 downto 0);
signal LC_UAL : STD_LOGIC_VECTOR (2 downto 0);
signal N : STD_LOGIC ;
signal O : STD_LOGIC;
signal Z : STD_LOGIC ;
signal C : STD_LOGIC ;


--BDR
signal LC : STD_LOGIC ;
  
signal b_diex_in : STD_LOGIC_VECTOR (7 downto 0);
signal op_diex_in : STD_LOGIC_VECTOR (7 downto 0);

signal b_exmem_in : STD_LOGIC_VECTOR (7 downto 0);


begin

INS_MEM : instruction_memory port map (IP_1, CLK, OUT_1);

process
begin
   wait until CLK'event and CLK='1';
   if (rst='0') then 
   IP_1 <= ("00000000");
   else
   IP_1 <= IP_1 + 1;
   end if;
   end process;
   
   UAL : ALU port map (B_DI_EX, C_DI_EX, N,O,Z,C, S_UAL, LC_UAL);
   
   NV_LI_DI : pipeline port map (op1 => out_1(31 downto 24),
                                 op2 =>  out_1(23 downto 16),
                                 op3 => out_1(15 downto 8) ,
                                 op4 => out_1(7 downto 0) ,
                                 out1 => OP_LI_DI,
                                 out2 => A_LI_DI,
                                 out3 => B_LI_DI,
                                 out4 => C_LI_DI,
                                 
                                 CLK => CLK,  
                                 rst => rst);
   
   b_diex_in <= QA when OP_LI_DI = x"07" or OP_LI_DI = x"02" or OP_LI_DI = x"03" or OP_LI_DI = x"01" else B_LI_DI;
   
   op_diex_in <= x"06" when OP_LI_DI = x"07" else OP_LI_DI;
   
    NV_DI_EX : pipeline port map (op1 => op_diex_in,
                              op2 =>  A_LI_DI,
                              op3 => b_diex_in ,
                              op4 => QB,
                              out1 => OP_DI_EX,
                              out2 => A_DI_EX,
                              out3 => B_DI_EX,
                              out4 => C_DI_EX,
                              
                              CLK => CLK,  
                              rst => rst);
                              
   LC_UAL <= OP_DI_EX(2 downto 0) when OP_DI_EX =x"01" or OP_DI_EX =x"02" or OP_DI_EX =x"03" or OP_DI_EX =x"4" else "000";                        
   b_exmem_in <= S_UAL when OP_DI_EX = x"01" or OP_DI_EX =x"02" or OP_DI_EX =x"03" or OP_DI_EX =x"04" else B_DI_EX;                           
                              
     NV_EX_MEM : pipeline port map (op1 => OP_DI_EX,
                                op2 =>  A_DI_EX,
                                op3 => B_DI_EX ,
                                op4 => (others=>'0') ,
                                out1 => OP_EX_MEM,
                                out2 => A_EX_MEM,
                                out3 => B_EX_MEM,
                                CLK => CLK,  
                                rst => rst);
                                                              
     NV_MEM_RE : pipeline port map (op1 => OP_EX_MEM,
                                op2 =>  A_EX_MEM,
                                op3 => B_EX_MEM ,
                                op4 => C_EX_MEM ,
                                out1 => OP_MEM_RE,
                                out2 => A_MEM_RE,
                                out3 => B_MEM_RE,
                                CLK => CLK,  
                                rst => rst);

     LC <= '1' when OP_MEM_RE = x"06" or  OP_MEM_RE=x"01" or OP_MEM_RE = x"02" or  OP_MEM_RE=x"03" else '0';
     
     BDR : Banc_De_Registres port map (Addr_w => A_MEM_RE (3 downto 0) ,
                                     W => LC , 
                                     QA => QA, 
                                     QB => QB,
                                     DATA => B_MEM_RE ,
                                     Addr_A => B_LI_DI(3 downto 0),
                                     Addr_B => C_LI_DI(3 downto 0),
                                     rst => rst,
                                     clk => clk) ;
   
   
end Behavioral;
