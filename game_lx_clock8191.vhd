LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

entity game_lx_clock8191 is
port(
	clk : in std_logic;
	reset : in std_logic;
	hit : in std_logic;
	counter : out integer range 2047 downto 0
);
end game_lx_clock8191;

architecture game_lx_clock8191_ar of game_lx_clock8191 is
	
	begin
	process(clk)
	variable temp : integer range 2047 downto 0:=0;
	begin
	if reset='1'then
	temp:=0;
	end if;
	if clk='1'then
	if(temp=2047)then
	temp:=0;
	else
	temp:=temp+1;
	end if;
	end if;
	
	if(hit'event and hit ='1')then
	counter<=temp;
	end if;
	
	end process;
end game_lx_clock8191_ar;