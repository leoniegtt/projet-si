----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.05.2023 14:42:53
-- Design Name: 
-- Module Name: Banc de registre - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Banc de registre is
    Port ( A_addr : in STD_LOGIC_VECTOR (3 downto 0);
           B_addr : in STD_LOGIC_VECTOR (3 downto 0);
           W_addr : in STD_LOGIC_VECTOR (3 downto 0);
           W : in STD_LOGIC;
           DATA_addr : in STD_LOGIC_VECTOR (7 downto 0);
           RST : in STD_LOGIC;
           CLK : in STD_LOGIC);
end Banc de registre;

architecture Behavioral of Banc de registre is

begin


end Behavioral;
