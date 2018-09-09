library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity module_debouncer is
    generic 
    (
        MAX_TICKS : integer := 2e6 -- default is 2e6 ticks for a 20ms delay    
    );

    port 
    (
        clk     : in std_logic; -- 100MHz lock
        btn_in  : in std_logic; -- button input
        btn_out : out std_logic -- button output
    );
end module_debouncer;

architecture module_debouncer_ar of module_debouncer is 
    signal t, reset : std_logic;       
    signal Q        : std_logic := '0'; -- the flip-flop that maintains the current output
begin
    -- clk-divider
    M1 : entity work.module_clk_div (module_clk_div_ar)
            generic map (MAX_TICKS => MAX_TICKS)
            port map (clk => clk, reset => reset, t => t);
           
    -- flip the current output if the input changed and it has been stable for the desired time
    process (clk)
    begin
        if rising_edge(clk) then
            Q <= Q xor t; -- Q flips when t='1'
        end if;
    end process;
  
    -- reset and output logic
    reset <= btn_in xnor Q; -- reset='1' if btn_in = Q
    btn_out <= Q; -- current button state output
end module_debouncer_ar;