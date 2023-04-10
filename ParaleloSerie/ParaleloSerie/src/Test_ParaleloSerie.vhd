--Maestria en Ciencias (Mecatronica)
--Electronica Avanzada

--Registro Paralelo Serie

--Declaracion de librerias
library ieee;
use ieee.std_logic_1164.all;

--Definir la entidad
entity Test_ParaleloSerie is
end Test_ParaleloSerie;

-- Definir la arquitectura 
architecture test of Test_ParaleloSerie is 

--Declarar componente

component ParaleloSerie
		generic (
		n : integer := 4
		);
	port (
		rst : in	std_logic;
		clk : in	std_logic;
		opr : in	std_logic_vector(1 downto 0);
		di  : in	std_logic_vector(n-1 downto 0);
		do  : out	std_logic
		);					 
end component; 

-- Declarar señales internas 
-- Entradas del la UUT (circuito)
signal rst 	: std_logic := '1';
signal clk 	: std_logic := '0';
signal opr 	: std_logic_vector(1 downto 0) := "00";
signal di	: std_logic_vector(3 downto 0) := (others => '0');

-- Salidas de la UUI
signal do	:std_logic;	  
--constante temporal
constant clk_period : time := 20 ns;

begin
	
	--Instanciacion
	uut:  ParaleloSerie port map( 
	rst => rst,
	clk => clk,
	opr => opr,
	di  => di,
	do  => do
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
	
	--di
	di <= "1111";
	
	opr_process:process
	begin
		opr <= "00";
		wait for 180 ns;
		opr <= "10";
		
		wait for clk_period;
		opr <= "00";
		wait for clk_period*4;
		opr <= "01";
		
		wait for clk_period;
		opr <= "00";
		wait for clk_period*4;
		opr <= "01";
		
		wait for clk_period;
		opr <= "00";
		wait for clk_period*4;
		opr <= "01";  
		
		wait for clk_period;
		opr <= "00";
		wait;
		
	end process opr_process;

end test;
