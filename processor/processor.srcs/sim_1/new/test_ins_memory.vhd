----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.05.2023 11:51:57
-- Design Name: 
-- Module Name: test_ins_memory - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
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
signal registre : myTab;

begin

process 
begin
    wait until CLK'event and CLK='1';
    O <= registre(to_integer(unsigned(Addr)));
    
end process;

end Behavioral;