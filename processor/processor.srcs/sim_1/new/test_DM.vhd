
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test_DM is

end test_DM;

architecture Behavioral of test_DM is
COMPONENT data_memory
Port ( Addr : in STD_LOGIC_VECTOR (7 downto 0);
       I : in STD_LOGIC_VECTOR (7 downto 0);
       RW : in STD_LOGIC;
       RST : in STD_LOGIC;
       CLK : in STD_LOGIC;
       O : out STD_LOGIC_VECTOR (7 downto 0));
 end COMPONENT;      
 
        SIGNAL Addr_test : STD_LOGIC_VECTOR (7 downto 0):= (others => '0');
        SIGNAL I_test : STD_LOGIC_VECTOR (7 downto 0):= (others => '0');
        SIGNAL RW_test : STD_LOGIC:='0';
        SIGNAL RST_test : STD_LOGIC:='0';
        SIGNAL CLK_test : STD_LOGIC:='0';
        SIGNAL O_test : STD_LOGIC_VECTOR (7 downto 0):= (others => '0');

begin

test_DM : data_memory PORT MAP (
        Addr => Addr_test,
        I => I_test,
        RW => RW_test,
        RST => RST_test,
        CLK => CLK_test,
        O => O_test);

Addr_test <= "00000010";
I_test <= "10101010";
RW_test <= '1' after 100ns; 

rst_test <= '1' after 20 ns;

CLK_test <= not CLK_test after 10 ns;



end Behavioral;
