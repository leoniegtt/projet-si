


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Banc_de_Registres is
Port ( Addr_A : in STD_LOGIC_VECTOR (3 downto 0);
        Addr_B : in STD_LOGIC_VECTOR (3 downto 0);
        Addr_W : in STD_LOGIC_VECTOR (3 downto 0);
        Data : in STD_LOGIC_VECTOR (7 downto 0);
        RST : in STD_LOGIC;
        CLK : in STD_LOGIC;
        W : in STD_LOGIC;
        QA : out STD_LOGIC_VECTOR (7 downto 0);
        QB : out STD_LOGIC_VECTOR (7 downto 0));
end Banc_de_Registres;



architecture Behavioral of Banc_de_Registres is

-- type registre is STD_LOGIC_VECTOR(7 downto 0);

--Signal aux_data : STD_LOGIC_VECTOR (7 downto 0):= DATA;

--signal aux_W_a : STD_LOGIC_VECTOR (7 downto 0):= W_a;
--signal aux1 : STD_LOGIC_VECTOR (7 downto 0);
--signal aux2 : STD_LOGIC_VECTOR (7 downto 0);
type banc is array ( 0 to 15) of std_logic_vector(7 downto 0);
signal reg_file : banc;
begin
process
begin
    --RST  := '0';
    wait until CLK'Event and CLK = '0';
        if(RST = '0') then
            reg_file <= (others => (others => '0'));
        else
              if (W='1') then
                reg_file(CONV_INTEGER(Addr_W)) <= DATA;
              end if;  
        --aux1 <= reg_file(CONV_INTEGER(A));
        --aux2 <= reg_file(CONV_INTEGER(B));    
        end if;
end process;
QA<= reg_file (CONV_INTEGER(Addr_A)) when (W='0' or Addr_W/=Addr_A) else DATA;
QB<= reg_file (CONV_INTEGER(Addr_B)) when (W='0' or Addr_W/=Addr_B) else DATA;  
end Behavioral;
