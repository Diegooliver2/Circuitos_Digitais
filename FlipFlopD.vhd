library ieee;
use ieee.std_logic_1164.all;

entity FlipFlopD is

port (
	D: in std_logic;
	clk: in std_logic;
	Q: out std_logic;
	Preset: in std_logic;
	Clear: in std_logic
);
end FlipFlopD;

architecture archFlipFlopD of FlipFlopD is
	signal Qsignal: std_logic :='0';
begin
	process (clk, Clear, Preset)
	begin
		if (Clear = '0') then
			Q <= '0'; 
		elsif (Preset = '0') then
			Q <= '1';
		elsif(clk'event and clk='0') then	
			Q <= D;
		
	end if;
end process;

end archFlipFlopD;
