--Maestria en Ciencias (Mecatronica)
--Electronica Avanzada

--Registro Serie Paralelo
							 
--Declaracion de librerias
library ieee;
use ieee.std_logic_1164.all;

--Definir la entidad
entity Test_SerieParalelo is
end Test_SerieParalelo;

-- Definir la arquitectura 
architecture test of Test_SerieParalelo is 

--Declarar componente

component SerieParalelo
		generic (
		n : integer := 4
		);
	port (
		rst  : in	std_logic;
		clk  : in	std_logic;
		di   : in	std_logic;
		shl  : in	std_logic;
		do	 : out	std_logic_vector(3 downto 0) 
		);					 
end component; 

-- Declarar señales internas 
-- Entradas del la UUT (circuito)
signal rst 	: std_logic := '1';
signal clk 	: std_logic := '0';
signal di	: std_logic := '0';
signal shl	: std_logic := '0';

-- Salidas de la UUI
signal do	:std_logic_vector(3 downto 0);	  
--constante temporal
constant clk_period : time := 20 ns;

begin
	
	--Instanciacion
	uut:  SerieParalelo port map( 
	rst => rst,
	clk => clk,	
	di  => di,
	shl  => shl,
	do => do
	);
	
	--Definicion de los estimulos
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
	
	di_process: process
	begin
		di <= '0';
		wait for clk_period*12;
		di <= '1';
		wait for clk_period*3;
		di <= '0';
		wait for clk_period*3;
		di <= '1';	
		wait for clk_period*3;
		di <= '0';
		wait;
	end process di_process;	 
	
	shl_process:process
	begin
		shl <= '0';
		wait for clk_period*13;
		shl <= '1';
		wait for clk_period;
		shl <= '0';	  
		wait for clk_period*2;
		shl <= '1';
		wait for clk_period;
		shl <= '0';	  
		wait for clk_period*2;
		shl <= '1';
		wait for clk_period;
		shl <= '0';	  
		wait for clk_period*2;
		shl <= '1';
		wait for clk_period;
		shl <= '0';	  
		wait;
		
	end process shl_process;
	
	
end architecture test;

	
	