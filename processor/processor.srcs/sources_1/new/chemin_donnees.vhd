----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.05.2023 11:50:29
-- Design Name: 
-- Module Name: chemin_donnees - Behavioral
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

entity chemin_donnees is
    Port ( 
           CLK ,rst, en : in STD_LOGIC;
           O : out STD_LOGIC);
end chemin_donnees;

architecture Behavioral of chemin_donnees is
    component ALU
        port(CLK :in std_logic;
        A,B : in std_logic_vector(7 downto 0);
        Ctrl_Alu : in std_logic_vector(1 downto 0);
        S : out std_logic_vector(7 downto 0);
        Flags : out std_logic_vector(3 downto 0));
        end component ALU;
        
begin


end Behavioral;
