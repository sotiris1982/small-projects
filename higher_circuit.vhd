----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.07.2021 22:55:30
-- Design Name: 
-- Module Name: higher_circuit - Behavioral
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

entity higher_circuit is
    Port ( A       : in STD_LOGIC_VECTOR (3 downto 0);
           B       : in STD_LOGIC_VECTOR (3 downto 0);
           C       : in STD_LOGIC_VECTOR (3 downto 0);
           D       : in STD_LOGIC_VECTOR (3 downto 0);
           CLK     : in STD_LOGIC;
           RESET   : in STD_LOGIC;
           GREATER : out STD_LOGIC_VECTOR (3 downto 0);
           ONES    : out STD_LOGIC_VECTOR (2 downto 0));
end higher_circuit;

architecture Behavioral of higher_circuit is

    component REG4r
     --generic (WIDTH : positive := 4);
        Port ( CLK, RESET : in STD_LOGIC;
            d_in       : in STD_LOGIC_VECTOR (3 downto 0);
            d_out      : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
-- the generic was giving me trouble when i was changing the width so i made an ewxtra register to save the one counter value
    component REG3r
     --generic (WIDTH : positive := 4);
         Port ( CLK, RESET : in STD_LOGIC;
            d_in       : in STD_LOGIC_VECTOR (2 downto 0);
            d_out      : out STD_LOGIC_VECTOR (2 downto 0));
        end component;
    
    component Comparator is
        Port ( A, B    : in STD_LOGIC_VECTOR (3 downto 0);         
               greater_val : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component Ones_Counter is
        Port ( d_in : in STD_LOGIC_VECTOR (3 downto 0);
               ones_val : out STD_LOGIC_VECTOR (2 downto 0));
    end component;
    
-- INTERNAL SIGNALS

-- some explenations of the names given to the signals for better understanding the notation
-- R1_2Comp1_A means signal coming out of register 1 going to ('2') comparator 1 currying A
-- R3_2R6_C means  signal coming out of register 3 that has values of c going to register 6
-- the last underscored indicates which data the wire carries 
-- Comp2_max_ABC means signal coming out of comparator 2 carying the maximum value betweein the signals A,B from first stage and C

    signal R1_2Comp1_A     : STD_LOGIC_VECTOR (3 downto 0);
    signal R2_2Comp1_B     : STD_LOGIC_VECTOR (3 downto 0);
    signal R3_2R6_C        : STD_LOGIC_VECTOR (3 downto 0);
    signal R4_2R7_D        : STD_LOGIC_VECTOR (3 downto 0);
    signal Comp1_max_AB    : STD_LOGIC_VECTOR (3 downto 0);
    signal R5_2Comp2_AB    : STD_LOGIC_VECTOR (3 downto 0);
    signal R6_2Comp2_C     : STD_LOGIC_VECTOR (3 downto 0);
    signal Comp2_max_ABC   : STD_LOGIC_VECTOR (3 downto 0);
    signal R7_2R9_D        : STD_LOGIC_VECTOR (3 downto 0);
    signal R8_2Comp3_ABC   : STD_LOGIC_VECTOR (3 downto 0);
    signal R9_2Comp3_D     : STD_LOGIC_VECTOR (3 downto 0);
    signal Comp3_max_Final : STD_LOGIC_VECTOR (3 downto 0);
    signal ones_out        : STD_LOGIC_VECTOR (2 downto 0);
    signal Greater_out     : STD_LOGIC_VECTOR (3 downto 0);
    
begin

-- instantiations

U1 : REG4r
     --generic map (WIDTH => 4) -- Not sure if i need to rewrite the generic map since i dont change the width yet
     port map (
     CLK   => CLK,
     RESET => RESET,
     d_in  => A,
     d_out => R1_2Comp1_A);
     
U2 : REG4r
     --generic map (WIDTH => 4) 
     port map (
     CLK   => CLK,
     RESET => RESET,
     d_in  => B,
     d_out => R2_2Comp1_B);
     
U3 : REG4r
     --generic map (WIDTH => 4) 
     port map (
     CLK   => CLK,
     RESET => RESET,
     d_in  => C,
     d_out => R3_2R6_C);
     
U4 : REG4r
     --generic map (WIDTH => 4) 
     port map (
     CLK   => CLK,
     RESET => RESET,
     d_in  => D,
     d_out => R4_2R7_D);
     
U5 : Comparator 
     port map (
     A       => R1_2Comp1_A,
     B       => R2_2Comp1_B,
     greater_val => Comp1_max_AB);
     
U6 : REG4r
     --generic map (WIDTH => 4) 
     port map (
     CLK   => CLK,
     RESET => RESET,
     d_in  => Comp1_max_AB,
     d_out => R5_2Comp2_AB);
     
U7 : REG4r
     --generic map (WIDTH => 4) 
     port map (
     CLK   => CLK,
     RESET => RESET,
     d_in  => R3_2R6_C,
     d_out => R6_2Comp2_C);
     
U8 : REG4r
    -- generic map (WIDTH => 4) 
     port map (
     CLK   => CLK,
     RESET => RESET,
     d_in  => R4_2R7_D,
     d_out => R7_2R9_D);
  
U9 : Comparator
     port map (
     A       => R5_2Comp2_AB,
     B       => R6_2Comp2_C,
     greater_val => Comp2_max_ABC); 
     
U10 : REG4r
     --generic map (WIDTH => 4) 
     port map (
     CLK   => CLK,
     RESET => RESET,
     d_in  => Comp2_max_ABC,
     d_out => R8_2Comp3_ABC);
     
U11 : REG4r
     --generic map (WIDTH => 4) 
     port map (
     CLK   => CLK,
     RESET => RESET,
     d_in  => R7_2R9_D,
     d_out => R9_2Comp3_D); 
     
U12 : Comparator
      port map (
      A       => R8_2Comp3_ABC,
      B       => R9_2Comp3_D,
      greater_val => Comp3_max_Final);
      
U13 : Ones_counter 
      port map (
      d_in => Comp3_max_Final,
      ones_val => ones_out);
      
--U14 : REG3r
--      --generic map (WIDTH => 3) 
--      port map (
--      CLK   => CLK,
--      RESET => RESET,
--      d_in  => ones_out,
--      d_out => ONES);
      
U14 : REG4r
      --generic map (WIDTH => 3) 
      port map (
      CLK   => CLK,
      RESET => RESET,
      d_in  => Comp3_max_Final,
      d_out => GREATER); 

U15 : REG3r
     --generic map (WIDTH => 3) 
      port map (
      CLK   => CLK,
      RESET => RESET,
      d_in  => ones_out,
      d_out => ONES);
             
end Behavioral;
