----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.05.2023 14:53:39
-- Design Name: 
-- Module Name: Banc_De_Registres - Behavioral
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

entity Banc_De_Registres is
    Port ( Addr_A : in STD_LOGIC_VECTOR (3 downto 0);
           Addr_B : in STD_LOGIC_VECTOR (3 downto 0);
           Addr_W : in STD_LOGIC_VECTOR (3 downto 0);
           Data : in STD_LOGIC_VECTOR (7 downto 0);
           RST : in STD_LOGIC;
           CLK : in STD_LOGIC;
           QA : out STD_LOGIC_VECTOR (7 downto 0);
           QB: out STD_LOGIC_VECTOR (7 downto 0));
end Banc_De_Registres;

architecture Behavioral of Banc_De_Registres is

begin
    process(Addr_A,Addr_B)
        begin
            QA <=Addr_A;
            QB <=Addr_B;
        end process;
    process
        begin
             wait until CLK'event and CLK='1';
             

end Behavioral;
