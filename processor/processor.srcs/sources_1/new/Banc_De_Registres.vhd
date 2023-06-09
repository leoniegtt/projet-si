
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Banc_De_Registres is
    Port ( Addr_A : in STD_LOGIC_VECTOR (3 downto 0);
           Addr_B : in STD_LOGIC_VECTOR (3 downto 0);
           Addr_W : in STD_LOGIC_VECTOR (3 downto 0);
           Data : in STD_LOGIC_VECTOR (7 downto 0);
           RST : in STD_LOGIC;
           CLK : in STD_LOGIC;
           W : in STD_LOGIC;
           QA : out STD_LOGIC_VECTOR (7 downto 0);
           QB: out STD_LOGIC_VECTOR (7 downto 0));
end Banc_De_Registres;

architecture Behavioral of Banc_De_Registres is
    type myTab is array(15 downto 0) of std_logic_vector(7 downto 0);
    signal registre : myTab := (others => "00000000");
    signal Aux_A : STD_LOGIC_VECTOR (7 downto 0):= (others => '0');
    signal Aux_B : STD_LOGIC_VECTOR (7 downto 0):= (others => '0');

begin
    QA <= Aux_A;
    QB <= Aux_B;

process
    begin
    wait until CLK'event and CLK='0';
    if (RST='1') then
        --lecture
        Aux_A <= registre(to_integer(unsigned(Addr_A)));
        Aux_B <= registre(to_integer(unsigned(Addr_B)));
        --écriture
        if (W='1') then
            if (Addr_A = Addr_W) then
                Aux_A <= Data;
            elsif (Addr_B = Addr_W) then
                Aux_B <= Data;
            else 
                registre(to_integer(unsigned(Addr_W))) <= Data;
            end if; 
        end if;
    else  
        registre <=  (others => x"00");
    end if;
end process;

end Behavioral;



