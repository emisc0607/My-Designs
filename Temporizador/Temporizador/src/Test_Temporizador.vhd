--Maestria en Ciencias (Mecatronica)
--Electronica Avanzada

--Banco de pruebas Contador Descendente

--Declaracion de librerias
library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

--definir entidad
entity Test_Temporizador is
end Test_Temporizador;

--definir arquitectura
architecture test of Test_Temporizador is

component Temporizador
	generic(n: integer := 8
	);
	port (
	rst	:	in	std_logic;
	clk	:	in	std_logic;
	k	:	in	std_logic_vector(n-1 downto 0);
	str	: 	in	std_logic;
	tout:	out std_logic
	);
end component;
--seniales internas del banco de pruebas
--entradas 
signal  rst	:	std_logic := '0';
signal	clk	:	std_logic := '0';
signal	k	:	std_logic_vector(7 downto 0) := (others => '0');
signal  str :   std_logic;
--salidas 
signal tout : std_logic;
--tiempo
constant clk_period : time := 20 ns;

begin
	uut: Temporizador port map( 
	rst 	=> rst,
	clk 	=> clk,
	k  		=> k,
	str		=> str,
	tout	=> tout
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
	
	k <= "00010000";
	
	str_process: process
	begin
		str <= '0';
		wait for clk_period;
		str <= '1';
		wait;
		
	end process str_process;	
			
end test; 


