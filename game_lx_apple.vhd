LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

entity game_lx_appple is
port(
	hit : in std_logic;
	counter : in integer range 2047 downto 0;
	clock : in std_logic;
	xout : out integer range 63 downto 0;
	yout : out integer range 31 downto 0
);
end game_lx_appple;

architecture game_lx_appple_ar of game_lx_appple is

begin
process(clock)
variable ycounter : integer range 31 downto 0:=0;
variable countertemp : integer range 2047 downto 0:=0;
begin
if(clock'event and clock ='1')then 
if hit='1' then 
ycounter:=0;
countertemp:=counter;
while (countertemp>63 and ycounter<31)loop
	countertemp:=countertemp-63;
	
	ycounter:=ycounter+1;
	
end loop;
xout<=countertemp;
yout<=ycounter;
end if;
end if;
end process;
end game_lx_appple_ar;