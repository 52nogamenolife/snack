LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

entity exp4_lx_clock is
	port(
		clk : in std_logic;
		reset : in std_logic;
		size : in integer range 40 downto 4;
		clock : out std_logic
	);
end exp4_lx_clock;

architecture exp4_lx_clock_ar of exp4_lx_clock is 

signal temp : std_logic;
	begin
	process(clk)
	
	variable limit : integer range 49999999 downto 0:=12499999;
	variable counter : integer range 49999999 downto 0:=0;
	
	begin
	
	if(clk'event and clk='1')then
	if reset='1'then
	temp<='1';
	--limit:=12499999;
	limit:=2;
	counter:=0;
	end if;
	
	if size<14 then
	--limit := 12499999;
	limit:=2;
	elsif size=14 then
	limit:=6249999;
	elsif size=34 then
	limit:=4166665;
	end if;
	
	if(counter=limit)then
	counter:=0;
	temp <= not temp;
	else
	counter:=counter+1;
	end if;
	end if;
	
	end process;
	clock<=temp;
end exp4_lx_clock_ar;
