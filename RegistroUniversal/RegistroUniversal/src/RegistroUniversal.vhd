--Maestria en Ciencias (Mecatronica)
--Electronica Avanzada

--Registro Unviersal

--Declaracion de librerias
library ieee;
use ieee.std_logic_1164.all;

--Definicion de la entidad Registro Universal
entity RegistroUniversal is
generic(
	n : integer := 4	
	);
	port(
	rst : in 	std_logic;
	clk : in 	std_logic;
	do 	: out	std_logic_vector(n-1 downto 0);	 
	di	: in	std_logic_vector(n-1 downto 0);	
	opr : in	std_logic_vector(1 downto 0)
	);
end RegistroUniversal;

--Definicion de la arquitectura
architecture Universal of RegistroUniversal is
signal qn, qp: 	std_logic_vector(n-1 downto 0); 
	begin
		-- opr	| qn
		--------|-----
		-- 00	| di						habilitado
		-- 01	| qp(n-2 downto 0) & di	 	serie	 
		-- 10	| qp(n-2 downto 0) & 0	 	paralelo	
		-- 11	| qp					 	hold
	 Seleccion: process(opr, qp, di)
	 begin
		 if opr="00" then
			 qn <= di;
		 elsif opr = "01" then
			 qn <= qp(n-2 downto 0) & di(1);
		 elsif opr = "10" then
			 qn <= qp(n-2 downto 0) & '0';
		 else 
			 qn <= qp;
		 end if;
	 end process Seleccion;
	qp <= (others => '0') when rst = '1' else qn when rising_edge(clk); --FlipFlop
end Universal;

