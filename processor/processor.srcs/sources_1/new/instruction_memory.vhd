
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
           bloque : in STD_LOGIC;
           O : out STD_LOGIC_VECTOR (31 downto 0));
end instruction_memory;

architecture Behavioral of instruction_memory is

    type myTab is array(0 to 255) of std_logic_vector(31 downto 0);
    signal registre : myTab:=
        (--test aléa 1
        
        x"06010200", -- afc
        x"08030100", --store
        x"06010300", -- 
        x"08040100", --
        x"07010300", --load
        x"07020400",
        x"01010102",
        x"08030100",
        x"07010300",
        x"08020100",
        x"06010000",
        x"08030100",
        x"07010300",
        x"08010100",        
        
        
--        x"06010200", 
--        x"08030100",
--        x"07010300",
--        x"08020100",
--        x"06010300",
--        x"08040100",
--        x"07010400",
--        x"08030100",
--        x"07010300",
--        x"08050100",
--        x"07010200",
--        x"08060100",
--        x"07010500",
--        x"07020600",
--        x"01030102",
--        x"07010500",
--        x"08040100",
--        x"06010000",
--        x"08050100",
--        x"07010500",
--        x"08010100",
        
        
        
--         x"06004500",
--         x"08020300",
--         x"06010600",
--         x"06010500",
--         x"06020400",
--         x"01030102",
         
         others => x"00000000"); -- init des valeurs pour test
    signal Aux : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');

begin
    O <= Aux;

    process 
    begin
        wait until CLK'event and CLK='1';
        if (bloque ='1') then 
            Aux <= registre(to_integer(unsigned(Addr)));
        end if;
    end process;

end Behavioral;
