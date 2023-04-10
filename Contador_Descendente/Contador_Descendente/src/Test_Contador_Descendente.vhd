--Maestria en Ciencias (Mecatronica)
--Electronica Avanzada

--Banco de pruebas Contador Descendente

--Declaracion de librerias
library ieee;
use ieee.std_logic_1164.all;  

--definir entidad
entity Test_Contador_Descendente is
end Test_Contador_Descendente;

--definir arquitectura
architecture test of Test_Contador_Descendente is

component Contador_Descendente
	generic(n: integer := 8
	);
	port (
	rst	:	in	std_logic;
	clk	:	in	std_logic;
	k	:	in	std_logic_vector(n-1 downto 0);
	opc	:	in	std_logic_vector(1 downto 0);
	q	:	out	std_logic_vector(n-1 downto 0);
	z	:	out	std_logic
	);
end component;
--seniales internas del banco de pruebas
--entradas 
signal rst	:	std_logic := '0';
signal	clk	:	std_logic := '0';
signal	k	:	std_logic_vector(7 downto 0) := (others => '0');
signal	opc	:	std_logic_vector(1 downto 0) := "00";
--salidas
signal q	:	std_logic_vector(7 downto 0);
signal z	:	std_logic;
--tiempo
constant clk_period : time := 20 ns;

begin
	uut: Contador_Descendente port map( 
	rst => rst,
	clk => clk,
	opc => opc,
	k  => k,
	q  => q,
	z  => z
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
	
	opc_process:process
	begin
		opc <= "00";
		wait for 200ns;
		opc <= "10";
		wait for clk_period;
		for i in 0 to 15 loop
			opc <= "00";
			wait for clk_period*3;
			opc <= "01";
			wait for clk_period;
		end loop;
		opc <= "00";
		wait;
	end process opc_process;
	
end test;
