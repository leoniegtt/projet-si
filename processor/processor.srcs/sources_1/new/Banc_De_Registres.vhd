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
signal registre : myTab;

begin
            QA <= Data when (Addr_A = Addr_W and w='1') 
                else registre(to_integer(unsigned(Addr_A)));
            QB <= Data when (Addr_B = Addr_W and w='1') 
                else registre(to_integer(unsigned(Addr_B)));
            
        process
            begin
            if (RST='1') then
                if(W='1') then
                wait until CLK'event and CLK='1';
                registre(to_integer(unsigned(Addr_W))) <= Data;
                end if;
             else  
                reset :for i IN 15 downto 0 LOOP
                registre(i) <=  (others => '0');
                end loop reset;
             end if;
       end process;  
           
        
end Behavioral;
