-- ==========================================================
-- SPI Master Receiver (Rx)
-- Приймає дані по лінії MISO синхронно з SCK
-- ==========================================================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity spi_master_rx is
    Port (
        clk      : in  std_logic;
        reset    : in  std_logic;
        sck      : in  std_logic;                        -- тактовий SPI сигнал
        miso     : in  std_logic;                        -- вхідні дані від Slave
        start    : in  std_logic;                        -- початок прийому
        data_out : out std_logic_vector(7 downto 0);     -- прийнятий байт
        done     : out std_logic                         -- завершення прийому
    );
end spi_master_rx;

architecture Behavioral of spi_master_rx is
    type state_type is (IDLE, RECEIVE, DONE);
    signal state     : state_type := IDLE;
    signal bit_cnt   : integer range 0 to 7 := 0;
    signal recv_reg  : std_logic_vector(7 downto 0) := (others => '0');
begin
    process(clk, reset)
    begin
        if reset = '1' then
            state <= IDLE;
            bit_cnt <= 0;
            recv_reg <= (others => '0');
            done <= '0';
        elsif rising_edge(clk) then
            case state is
                when IDLE =>
                    done <= '0';
                    if start = '1' then
                        bit_cnt <= 0;
                        state <= RECEIVE;
                    end if;

                when RECEIVE =>
                    if rising_edge(sck) then
                        recv_reg <= recv_reg(6 downto 0) & miso;
                        bit_cnt <= bit_cnt + 1;
                        if bit_cnt = 7 then
                            state <= DONE;
                        end if;
                    end if;

                when DONE =>
                    data_out <= recv_reg;
                    done <= '1';
                    state <= IDLE;
            end case;
        end if;
    end process;
end Behavioral;
