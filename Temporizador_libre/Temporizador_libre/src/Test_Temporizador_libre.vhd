--Maestria en Ciencias (Mecatronica)
--Electronica Avanzada

--Banco de pruebas Contador Descendente

--Declaracion de librerias
library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

--definir entidad
entity Test_Temporizador_libre is
end Test_Temporizador_libre;

--definir arquitectura
architecture test of Test_Temporizador_libre is

component Temporizador_libre
	generic(n: integer := 8
	);
	port (
	rst	:	in	std_logic;
	clk	:	in	std_logic;
	k	:	in	std_logic_vector(n-1 downto 0);
	tout:	out std_logic
	);
end component;
--seniales internas del banco de pruebas
--entradas 
signal  rst	:	std_logic := '0';
signal	clk	:	std_logic := '0';
signal	k	:	std_logic_vector(7 downto 0) := (others => '0');
--salidas 
signal tout : std_logic;
--tiempo
constant clk_period : time := 20 ns;

begin
	uut: Temporizador_libre port map( 
	rst 	=> rst,
	clk 	=> clk,
	k  		=> k,  
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
			
end test; 