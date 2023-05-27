
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Pipeline is
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
end Pipeline;

architecture Behavioral of Pipeline is
    signal inter_op1 : std_logic_vector(7 downto 0 ):= (others => '0');
    signal inter_op2 : std_logic_vector(7 downto 0 ):= (others => '0');
    signal inter_op3 : std_logic_vector(7 downto 0 ):= (others => '0');
    signal inter_op4 : std_logic_vector(7 downto 0 ):= (others => '0');
begin

    out1 <= inter_op1;
    out2 <= inter_op2;
    out3 <= inter_op3;
    out4 <= inter_op4;
    
    
    process 
        begin
        wait until CLK'event and CLK='1';
        --if enable='0' then
            if rst ='0' or nop='0' then
                inter_op1 <= "00000000";
                inter_op2 <= "00000000";
                inter_op3 <= "00000000";
                inter_op4 <= "00000000";
            else
                inter_op1 <= op1;
                inter_op2 <= op2;
                inter_op3 <= op3;
                inter_op4 <= op4;
                end if;
               
         --end if;
      end process;
end Behavioral;
