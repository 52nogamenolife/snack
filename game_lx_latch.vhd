LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

entity game_lx_latch is
port(
	num : in integer range 5 downto -5;
	en: in std_logic;
	xvector : in integer range 63 downto 0;
	yvector : in integer range 31 downto 0;
	xout : out integer range 63 downto 0;
	yout : out integer range 31 downto 0
);
end game_lx_latch;

architecture game_lx_latch_ar of game_lx_latch is
	signal x: integer range 63 downto 0;
	signal y: integer range 31 downto 0;
	begin
	process(en)
	begin
	if(en'event and en='0')then
		if(num>0)then
	x<=num;
	y<=4;
	
	else
	x<=xvector;
	y<=yvector;
	end if;
	elsif(en'event and en='0')then
	xout <= x;
	yout <= y;
	end if;

	end process;
end game_lx_latch_ar;

