----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.05.2023 10:18:50
-- Design Name: 
-- Module Name: ALU - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIgned.all;
use ieee.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           N : out STD_LOGIC;
           O : out STD_LOGIC;
           Z : out STD_LOGIC;
           C : out STD_LOGIC;
           S : out STD_LOGIC_VECTOR (7 downto 0);
           Ctrl_Alu : in STD_LOGIC_VECTOR (2 downto 0));
end ALU;

architecture Behavioral of ALU is
    
    signal Aux1 : STD_LOGIC_VECTOR (15 downto 0) := (others => '0'); --signal aux pour MUL
    
begin
  
  Aux1 <= (x"00" & A) + (x"00" & B) when Ctrl_Alu="001" else
          (x"00" & A) - (x"00" & B) when Ctrl_Alu="011" else
          A * B when Ctrl_Alu="010" else
          x"00000000";
          
    Z <= '1' when Aux1(7 downto 0) = x"0000" else '0';
    C <= Aux1(8);
    O <= '1' when Aux1(15 downto 8) /= x"0000" else '0';        
          
        
end Behavioral;
