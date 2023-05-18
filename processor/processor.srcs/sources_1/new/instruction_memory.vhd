
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity instruction_memory is
    Port ( Addr : in STD_LOGIC_VECTOR (7 downto 0);
           CLK : in STD_LOGIC;
           O : out STD_LOGIC_VECTOR (31 downto 0));
end instruction_memory;

architecture Behavioral of instruction_memory is

    type myTab is array(255 downto 0) of std_logic_vector(31 downto 0);
    signal registre : myTab:= (others => "11110000111100001111000011110000"); -- init des valeurs pour test
    signal Aux : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');

begin
    O <= Aux;
process 
begin
    
    wait until CLK'event and CLK='1';
    Aux <= registre(to_integer(unsigned(Addr)));
    
end process;

end Behavioral;
