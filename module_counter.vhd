library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity module_counter is
    generic 
    ( 
        NBITS : integer := 4;  -- default is 4 bits counter
        INC   : integer := 1   -- default increment is +1
    );
    port
    (
        clk     : in std_logic;
        set     : in std_logic;
        enable  : in std_logic;
        load    : in std_logic_vector (NBITS - 1 downto 0);
        value   : out std_logic_vector (NBITS - 1 downto 0)
    );
end module_counter;

architecture module_counter_ar of module_counter is
begin
    process (clk)
        variable count : integer := 0;
    begin 
        if rising_edge (clk) then
            if set = '1' then
                count := to_integer (unsigned (load));
            else
                if enable = '1' then
                    count := count + INC;
                end if;
            end if;
            
            value <= std_logic_vector (to_unsigned (count, NBITS));
        end if;
    end process;
end module_counter_ar;