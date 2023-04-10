--Maestria en Ciencias (Mecatronica)
--Electronica Avanzada

--Registro Paralelo Serie

--Declaracion de librerias
library ieee;
use ieee.std_logic_1164.all;

--Definir la entidad	 
entity ParaleloSerie is
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
end ParaleloSerie;

--Definicion de la arquitectura
architecture Registro of ParaleloSerie is
--Declarar inner signals
signal qn, qp :	std_logic_vector(n-1 downto 0);

begin
	do <= qp(n-1);
	
	-- opr 	| qn
	--------|-----
	-- 00	| qp				  	hold
	-- 01	| qp(n-2 downto 0) & 0	shift
	-- 1x	| di					load
	
	--Multiplexor
	Mux:process(opr, qp, di) 
	
	begin  
		if opr(1) = '1' then
			qn <= di;
		elsif opr(0) = '1' then
			qn <= qp(n-2 downto 0) & '0';
		else 
			qn <= qp;
		end if;
	end process Mux;
	
	qp <= (others => '0') when rst = '1' else qn when rising_edge(clk);	   --FilpFlop

end Registro;