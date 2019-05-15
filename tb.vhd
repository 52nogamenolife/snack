LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

entity tb is
end tb;
architecture tb_ar of tb is
component game_lx_ram is
port(
		reset : in std_logic;
	died : out std_logic;
	clock_s : in std_logic;
	print : inout std_logic;
	clk : in std_logic;
	size : in integer range 40 downto 4;
	applexout : in integer range 63 downto 0;
	appleyout : in integer range 31 downto 0;
	xout : in integer range 63 downto 0;
	yout : in integer range 31 downto 0;
	num : inout integer range 16 downto 0;
	linenum : inout integer range 63 downto 0;
	l0 : inout std_logic_vector(127 downto 0);
	lineout : out std_logic_vector(127 downto 0)
);
end component;
signal num : integer range 16 downto 0;
signal linenum : integer range 63 downto 0;
signal l0 : std_logic_vector(127 downto 0);
signal lineout : std_logic_vector(127 downto 0);
signal reset : std_logic;
signal clock_s : std_logic;
signal clk : std_logic;
signal print : std_logic;
signal died : std_logic;
signal size : integer range 40 downto 4;
signal applexout : integer range 63 downto 0;
signal appleyout : integer range 31 downto 0;
signal xout : integer range 63 downto 0;
signal yout : integer range 31 downto 0;
begin
u2 : game_lx_ram port map(reset,died,clock_s,print,clk,size,applexout,appleyout,xout,yout,num,linenum,l0,lineout);

process
begin
clk<='1';
wait for 1 ns;
clk<='0';
wait for 1 ns;
end process;

process
begin
reset<='1';
size<=6;
wait for 2 ns;
reset<='0';
size<=4;
wait for 198 ns;
applexout<=20;
appleyout<=20;
xout<=1;
yout<=1;
wait for 2 ns;
applexout<=20;
appleyout<=20;
xout<=2;
yout<=2;
wait for 2 ns;
applexout<=20;
appleyout<=20;
xout<=3;
yout<=3;
wait for 2 ns;
applexout<=20;
appleyout<=20;
xout<=4;
yout<=4;
wait for 2000 ns;
end process;

process
begin
clock_s<='0';
wait for 200 ns;
clock_s<='1';
wait for 200 ns;
end process;

end tb_ar;