LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

entity exp4_lx is
port(
	clk : in std_logic;
	reset : in std_logic;
	size : in integer range 40 downto 4;
	swco :out std_logic_vector(3 downto 0);
	swro : in std_logic_vector(3 downto 0);
	direction : out std_logic_vector(3 downto 0);
	clock_f : inout std_logic;
	clock_s : out std_logic
);
end exp4_lx;

architecture exp4_lx_ar of exp4_lx is
component counter is
	port(
		clock_f : in std_logic;
		clock_s : out std_logic;
		counter_out : out std_logic_vector(1 downto 0)
	);
end component;
component exp4_lx_clock IS
port(
		clk : in std_logic;
		reset : in std_logic;
		size : in integer range 40 downto 4;
		clock : out std_logic
	);
end component;

component exp4_lx_scancode IS
port(
	counter : in std_logic_vector(1 downto 0);
	scancode : out std_logic_vector(3 downto 0)
);
end component;
component exp4_lx_readstatus is
port(
	counter : in std_logic_vector(1 downto 0);
	swro : in std_logic_vector(3 downto 0);
	status : out std_logic_vector(3 downto 0)
);
end component;
component exp4_lx_dis is
port(
	clock : in std_logic;
	counter : in std_logic_vector(1 downto 0);
	status : in std_logic_vector(3 downto 0);
	direction : out std_logic_vector(3 downto 0)
);
end component;
signal status : std_logic_vector(3 downto 0);
signal counter_out : std_logic_vector(1 downto 0);
begin
exp4_clk : exp4_lx_clock port map(clk,reset,size,clock_f);
game_counter : counter port map(clock_f,clock_s,counter_out);
exp4_scan : exp4_lx_scancode port map(counter_out,swco);
exp4_read : exp4_lx_readstatus port map(counter_out,swro,status);
exp4_dis : exp4_lx_dis port map(clock_f,counter_out,status,direction);

end exp4_lx_ar;