library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity module_uart is	
	port 
	(
		clk 			: in std_logic;
		rx_data  		: out std_logic_vector (7 downto 0); 
		rx_data_present : out std_logic;
		tx_data  		: in std_logic_vector (7 downto 0);
		tx_data_present : in std_logic;
		tx_read_ack  	: out std_logic;
		serial_in    	: in std_logic;
		serial_out		: out std_logic
	);
end module_uart;

architecture module_uart_ar of module_uart is
begin
	I_UART_RX : entity work.module_uart_rx (module_uart_rx_ar)
					port map
					(
						clk => clk,
						data => rx_data,
						data_present => rx_data_present,
						serial_in => serial_in
					);
					
	I_UART_TX : entity work.module_uart_tx (module_uart_tx_ar)
					port map
					(
						clk => clk,
						data => tx_data,
						data_present => tx_data_present,
						read_ack => tx_read_ack,
						serial_out => serial_out
					);
end module_uart_ar;
