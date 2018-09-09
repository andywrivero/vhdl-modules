library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity module_7seg_refresh is
    port 
    (
        clk     : in std_logic; -- 100 MHz clock
        seg3,
        seg2,
        seg1,
        seg0    : in std_logic_vector (6 downto 0); -- all 4 7-seg inputs
        seg     : out std_logic_vector (6 downto 0); -- which 7-seg to select
        an      : out std_logic_vector (3 downto 0) -- which anode to select    
    );
end module_7seg_refresh;

architecture module_7seg_refresh_ar of module_7seg_refresh is
    signal sel : unsigned (1 downto 0) := "00"; -- current selected display
begin
    process (clk)
        variable counter     : integer := 0; -- clk divider
        constant MAX_COUNTER : integer := 416666; -- 1/4 of a cycle of 60Hz
    begin    
        if rising_edge (clk) then   
            if counter = MAX_COUNTER then
                counter := 0; 
                sel <= sel + 1; -- select next 7-seg
            else
                counter := counter + 1;
            end if;                
        end if;
    end process;
    
    -- select the 7-seg cathodes
    seg <= seg0 when sel = "00" else
           seg1 when sel = "01" else
           seg2 when sel = "10" else
           seg3;
    
    -- select the anode
    an <= "1110" when sel = "00" else
          "1101" when sel = "01" else
          "1011" when sel = "10" else
          "0111";
                      
end module_7seg_refresh_ar;
