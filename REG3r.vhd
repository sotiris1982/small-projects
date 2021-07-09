----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.07.2021 01:29:23
-- Design Name: 
-- Module Name: REG3r - Behavioral
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

entity REG3r is
    --generic (WIDTH : positive := 4);
    Port ( CLK, RESET : in STD_LOGIC;
           d_in : in STD_LOGIC_VECTOR (2 downto 0);
           d_out : out STD_LOGIC_VECTOR (2 downto 0));
end REG3r;

architecture Behavioral of REG3r is
begin

process(CLK) --synchronous register , reset out of sensitivity list and inside the if statement
    begin
    if (CLK = '1' and CLK'event) then
        if (RESET = '1')  then 
            d_out <= (others => '0');
        else 
            d_out <= d_in;
        end if;
    end if;
 end process;



end Behavioral;
