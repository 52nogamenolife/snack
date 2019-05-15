LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

entity game is
port(
	clk : in std_logic;
	reset : in std_logic;
	scan : out std_logic_vector(3 downto 0);
	swro : in std_logic_vector(3 downto 0);
	RW : out std_logic;
	RS : out std_logic;
	died : out std_logic;
	win : out std_logic;
	D : out std_logic_vector(7 downto 0)
);
end game;

architecture game_ar of game is
component game_lx_screen is
port(
	clk : in std_logic;
	en : in std_logic;
	RW : out std_logic;
	RS : out std_logic;
	D : out std_logic_vector(7 downto 0);
	linein : in std_logic_vector(127 downto 0)
);
end component;
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
	lineout : out std_logic_vector(127 downto 0)
);
end component;
component exp4_lx is
port(
	clk : in std_logic;
	reset : in std_logic;
	size : in integer range 40 downto 4;
	swco :out std_logic_vector(3 downto 0);
	swro : in std_logic_vector(3 downto 0);
	direction : out std_logic_vector(3 downto 0);
	clock_f : out std_logic;
	clock_s : out std_logic
);
end component;
component game_lx_latchall is
	port(
		reset : in std_logic;
		clock : in std_logic;
		clk : in std_logic;
		size : in integer range 40 downto 4;
		newx : in integer range 63 downto 0;
		newy : in integer range 31 downto 0;
		x1out : inout integer range 63 downto 0;
		y1out : inout integer range 31 downto 0;
		xout : inout integer range 63 downto 0;
		yout : inout integer range 31 downto 0
		);
end component;
component game_lx_next is
	port(
		clock_f : in std_logic;
		clock_s : in std_logic;
		direction : in std_logic_vector(3 downto 0);
		hit : out std_logic;
		sizein : in integer range 40 downto 4;
		sizeout : out integer range 40 downto 4;
		x : in integer range 63 downto 0;
		y : in integer range 31 downto 0;
		applex : in integer range 63 downto 0;
		appley : in integer range 31 downto 0;
		win : out std_logic;
		newx : out integer range 63 downto 0;
		newy : out integer range 31 downto 0
	);
end component;
component game_lx_clock8191 is
port(
	clk : in std_logic;
	reset : in std_logic;
	hit : in std_logic;
	counter : out integer range 2047 downto 0
);
end component;
component game_lx_appple is
port(
	hit : in std_logic;
	counter : in integer range 2047 downto 0;
	clock : in std_logic;
	xout : out integer range 63 downto 0;
	yout : out integer range 31 downto 0
);
end component;
signal sizein : integer range 40 downto 4;
signal sizeout : integer range 40 downto 4;
signal direction : std_logic_vector(3 downto 0);
signal clock_s : std_logic;
signal clock_f : std_logic;
signal newx :  integer range 63 downto 0;
signal newy :  integer range 31 downto 0;
signal xout :  integer range 63 downto 0;
signal yout :  integer range 31 downto 0;
signal hit : std_logic;
signal applex :  integer range 63 downto 0;
signal appley :  integer range 31 downto 0;
signal x1out : integer range 63 downto 0;
signal y1out : integer range 31 downto 0;
signal counter :  integer range 2047 downto 0;
signal lineout : std_logic_vector(127 downto 0);
signal print : std_logic;

 begin
u1 : exp4_lx port map(clk,reset,sizeout,scan,swro,direction,clock_f,clock_s);
u2 : game_lx_latchall port map(reset,clock_s,clk,sizeout,newx,newy,x1out,y1out,xout,yout);
u3 : game_lx_next port map(clock_f,clock_s,direction,hit,sizein,sizeout,x1out,y1out,applex,appley,win,newx,newy);
u4 : game_lx_clock8191 port map(clk,reset,hit,counter);
u5 : game_lx_appple port map(hit,counter,clock_s,applex,appley);
u6 : game_lx_ram port map(reset,died,clock_s,print,clk,sizeout,applex,appley,xout,yout,lineout);
u7 : game_lx_screen port map(clk,print,RW,RS,D,lineout);


end game_ar;