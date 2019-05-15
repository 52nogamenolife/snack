LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

entity game_lx_screen is
port(
	clk : in std_logic;
	en : in std_logic;
	RW : out std_logic;
	RS : out std_logic;
	D : out std_logic_vector(7 downto 0);
	linein : in std_logic_vector(127 downto 0)
);
end game_lx_screen;
architecture game_lx_screen_ar of game_lx_screen is
begin
process(clk,en)
variable linenum : integer range 15 downto 0:=0;
variable ynum : std_logic_vector(9 downto 0);
variable linetemp : std_logic_vector(127 downto 0);
variable flag : integer range 4 downto 0;
begin

if(clk'event and clk ='1')then
	if en='0' then
	flag:=0;
	RS<='0';
	RW<='0';
	D<="00111110";
	
	elsif(en ='1' and flag=0)then
	RS<='0';
	RW<='0';
	D<="00111100";
	flag:=1;
	elsif flag=1 then
	RS<='0';
	RW<='0';
	D<="10000000";
	flag:=2;
	elsif flag=2 then
	RS<='0';
	RW<='0';
	D<="10000000";
	flag:=3;
	
	elsif (en='1' and flag=3) then
		if linenum=0 then
		linetemp:=linein;
		end if;
		case linenum is 
				when 15=>
		D<=linetemp(7 downto 0);
		when 14=>
		D<=linetemp(15 downto 8);
		when 13=>
		D<=linetemp(23 downto 16);
		when 12=>
		D<=linetemp(31 downto 24);
		when 11=>
		D<=linetemp(39 downto 32);
		when 10=>
		D<=linetemp(47 downto 40);
		when 9=>
		D<=linetemp(55 downto 48);
		when 8=>
		D<=linetemp(63 downto 56);
		when 7=>
		D<=linetemp(71 downto 64);
		when 6=>
		D<=linetemp(79 downto 72);
		when 5=>
		D<=linetemp(87 downto 80);
		when 4=>
		D<=linetemp(95 downto 88);
		when 3=>
		D<=linetemp(103 downto 96);
		when 2=>
		D<=linetemp(111 downto 104);
		when 1=>
		D<=linetemp(119 downto 112);
		when 0=>
		D<=linetemp(127 downto 120);
		end case;
		if linenum=15 then
		linenum:=0;
		else
		linenum:=linenum+1;
		end if;
	end if;
end if;

end process;
end game_lx_screen_ar;