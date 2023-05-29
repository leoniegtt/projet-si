
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test_CDD is

end test_CDD;

architecture Behavioral of test_CDD is

COMPONENT chemin_donnees
    Port ( rst : in STD_LOGIC;
       CLK: in STD_LOGIC);
end COMPONENT;

 SIGNAL CLK_test  : STD_LOGIC := '0';
 SIGNAL rst_test : STD_LOGIC := '0';

begin

  test_CDD : chemin_donnees port map (rst => rst_test, CLK => clk_test);

  rst_test <= '1' after 100 ns;

  CLK_test <= not CLK_test after 10 ns;

end Behavioral;
