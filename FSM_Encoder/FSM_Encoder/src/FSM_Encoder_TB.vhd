-- Maestria en Ciencias en Mecatronica
-- Electronica Avanzada
-- Decodificador de direccion encoder (FSM) TestBench

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Encoder_direccion_TB is
end Encoder_direccion_TB;

architecture test of Encoder_direccion_TB is
	
component Encoder_direccion
	port 
	(
			RST : in  STD_LOGIC;
		   CLK : in  STD_LOGIC;
			A   : in  STD_LOGIC;
			B   : in  STD_LOGIC;
			S   : out STD_LOGIC
			);
end component;	
--Entradas
	signal RST : std_logic := '0';
	signal CLK : std_logic := '0';
	signal A   : std_logic := '0';
	signal B   : std_logic := '0';
--Salida
	signal S : std_logic;

	constant CLK_period : time := 20 ns;

begin
	
	uut: Encoder_direccion port map (
		   	RST => RST,
				CLK => CLK,
				A   => A,
				B   => B,
				S   => S
		  );

	RST_process: process
	begin
		RST <= '1';
		wait for 110 ns;
		RST <= '0';
		wait;
	end process RST_process;

	CLK_process: process
	begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
	end process CLK_process;
	
	A_process: process
	begin
		A <= '0';
		wait for CLK_period*2;
		A <= '1';
		wait for CLK_period*2;
		A <= '0';
		wait for CLK_period*2;
		A <= '1';
		wait for CLK_period*2;
		A <= '0';
		wait for CLK_period*2;
	end process A_process;
	
	B_process: process
	begin
		B <= '0';
		wait for CLK_period;
		B <= '1';
		wait for CLK_period*2;
		B <= '0';
		wait for CLK_period*2;
		B <= '1';
		wait for CLK_period*2;
		B <= '0';
		wait for CLK_period*2;
		B <= '1';
		wait for CLK_period*2;
		B <= '0';
		wait for CLK_period;
	end process B_process;
	
end test;