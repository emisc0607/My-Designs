--Maestria en Ciencias (Mecatronica)
--Electronica Avanzada

--Banco de pruebas Contador Descendente

--Declaracion de librerias
library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

--definir entidad
entity Test_EliminarRebotes is
end Test_EliminarRebotes;

architecture test of Test_EliminarRebotes is

component EliminarRebotes
	port (
	rst	: in	std_logic;
	clk : in	std_logic; 
	k	: in	std_logic_vector(3 downto 0);
	b	: in	std_logic;
	bf	: out	std_logic
		);
end component;	 

signal  rst	:	std_logic := '0';
signal	clk	:	std_logic := '0';
signal	k	:	std_logic_vector(3 downto 0) := (others => '0');
signal	b	:	std_logic := '0';

signal bf	:	std_logic;
constant clk_period : time := 20 ns;

begin
	uut: EliminarRebotes port map( 
		rst 	=> rst,
		clk 	=> clk,
		k  		=> k,  
		b		=> b,
		bf		=> bf
	);
	 	--Senial de rst
	rst_process:process
	begin 
		rst <= '1';
		wait for 110 ns;
		rst <= '0';
		wait;
	end process rst_process;
	--Senial de reloj
	clk_process:process
	begin
		clk <='0';
		wait for clk_period/2;
		clk <='1';
		wait for clk_period/2;
	end process clk_process;
	
	k <= "1111";
	
	eliminador: process
	begin  
		b <= '0';
		wait for 160 ns;
		for i in 0 to 2 loop
			b <= '0';
			wait for clk_period*2;
			b <= '1';
			wait for clk_period*2;
		end loop;
		
		wait for clk_period*20;
		
		for i in 0 to 2 loop
			b <= '0';
			wait for clk_period*2;
			b <= '1';
			wait for clk_period*2; 
			b <= '0';
		end loop;
		wait;
	end process eliminador;
	
end test;