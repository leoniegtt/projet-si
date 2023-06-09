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

entity test_ins_memory is

end test_ins_memory;

architecture Behavioral of test_ins_memory is
COMPONENT instruction_memory

  Port ( Addr : in STD_LOGIC_VECTOR (7 downto 0);
             entre : in STD_LOGIC_VECTOR (7 downto 0);
            CLK : in STD_LOGIC;
            bloque : in STD_LOGIC;
            jmp : in STD_LOGIC;
           O : out STD_LOGIC_VECTOR (31 downto 0));
end COMPONENT;


        SIGNAL Addr_test : STD_LOGIC_VECTOR (7 downto 0):= (others => '0');
        SIGNAL CLK_test : STD_LOGIC:='0';
        SIGNAL entre_test : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
        SIGNAL jmp_test: STD_logic := '0';
        SIGNAL bloque_test: STD_logic := '0';
        SIGNAL O_test : STD_LOGIC_VECTOR (31 downto 0):= (others => '0');
        
begin

test_ins_memory : instruction_memory PORT MAP (
        Addr => Addr_test,
        CLK => CLK_test,
        entre => entre_test,
        jmp => jmp_test,
        bloque => bloque_test,
        O => O_test);
        
 --test lecture
 Addr_test <= "00000001";

CLK_test <= not CLK_test after 10 ns;

bloque_test <= '1' after 50ns;

jmp_test<= '1'after 100ns;

entre_test <= x"02";

end Behavioral;