
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test_pipeline is

end test_pipeline;

architecture Behavioral of test_pipeline is
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
         rst : in STD_LOGIC;
         enable : in STD_LOGIC;
         nop : in STD_LOGIC);
end COMPONENT;

         SIGNAL op1_test  : STD_LOGIC_VECTOR (7 downto 0):= (others => '0');
         SIGNAL op2_test  : STD_LOGIC_VECTOR (7 downto 0):= (others => '0');
         SIGNAL op3_test  : STD_LOGIC_VECTOR (7 downto 0):= (others => '0');
         SIGNAL op4_test  : STD_LOGIC_VECTOR (7 downto 0):= (others => '0');
         SIGNAL out1_test : STD_LOGIC_VECTOR (7 downto 0):= (others => '0');
         SIGNAL out2_test : STD_LOGIC_VECTOR (7 downto 0):= (others => '0');
         SIGNAL out3_test : STD_LOGIC_VECTOR (7 downto 0):= (others => '0');
         SIGNAL out4_test : STD_LOGIC_VECTOR (7 downto 0):= (others => '0');
         SIGNAL CLK_test  : STD_LOGIC := '0';
         SIGNAL flush_test : STD_LOGIC := '0';
         SIGNAL enable_test  : STD_LOGIC := '0';
         SIGNAL nop_test : STD_LOGIC := '0';
begin

test_pipeline : pipeline PORT MAP (
        op1 => op1_test,
        op2 => op2_test,
        op3 => op3_test,
        op4 => op4_test,
        out1 => out1_test,
        out2 => out2_test,
        out3 => out3_test,
        out4 => out4_test,
        CLK => CLK_test,
        rst => flush_test,
        enable => enable_test,
        nop => nop_test);
        
        
 --test pipeline
 op1_test <= "11110000";
 op2_test <= "11000000";
 op3_test <= "00000000";
 op4_test <= "00000001";
 
CLK_test <= not CLK_test after 10 ns;
 flush_test <= '1' after 100ns;
 nop_test <= '1' after 150ns;      
        


end Behavioral;
