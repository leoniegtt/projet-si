

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity data_memory is
    Port ( Addr : in STD_LOGIC_VECTOR (7 downto 0);
       I : in STD_LOGIC_VECTOR (7 downto 0);
       RW : in STD_LOGIC;
       RST : in STD_LOGIC;
       CLK : in STD_LOGIC;
       O : out STD_LOGIC_VECTOR (7 downto 0));
end data_memory;

architecture Behavioral of data_memory is
type myTab is array(255 downto 0) of std_logic_vector(7 downto 0);
signal registre : myTab:= (others => "11110011");
signal Aux : STD_LOGIC_VECTOR (7 downto 0):= (others => '0');

begin

O <= Aux;

process 
begin
    wait until CLK'event and CLK='1';
    if RST ='1' then
         reset :for i IN 255 downto 0 LOOP
                   registre(i) <=  (others => '0');
                   end loop reset;
    else
        if RW = '0' then 
        --ecriture
            registre(to_integer(unsigned(Addr))) <= I;
        else
        --lecture
            Aux <= registre(to_integer(unsigned(Addr)));
    end if;
        
    end if;
    
end process;

end Behavioral;
