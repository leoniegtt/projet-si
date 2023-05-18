

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.all;

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
    signal registre : myTab := (others => "11110000");
    signal Aux_A : STD_LOGIC_VECTOR (7 downto 0):= (others => '0');
    signal Aux_B : STD_LOGIC_VECTOR (7 downto 0):= (others => '0');

begin
    QA <= Aux_A;
    QB <= Aux_B;
    
--    Aux_A <= Data when (Addr_A = Addr_W and W='1') 
--        else registre(to_integer(unsigned(Addr_A)));
--    Aux_B <= Data when (Addr_B = Addr_W and W='1') 
--        else registre(to_integer(unsigned(Addr_B)));

--                if (Addr_A = Addr_W and W='1') then
--                  Aux_A <= Data  ;
--                else 
--                   Aux_A <= registre(to_integer(unsigned(Addr_A)));
--                   end if;
--                 if (Addr_B = Addr_W and W='1') then
--                    Aux_B <= Data  ;
--                  else 
--                     Aux_B <= registre(to_integer(unsigned(Addr_B)));
--                     end if;   
--                if(W='1') then
--                    registre(to_integer(unsigned(Addr_W))) <= Data;
--                end if;
            
process
    begin
    wait until CLK'event and CLK='1';
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
        reset :for i IN 15 downto 0 LOOP
        registre(i) <=  (others => '0');
        end loop reset;
    end if;
end process;

end Behavioral;
