-- ==========================================================
-- SPI Master Transmitter (Tx)
-- Передає байт даних по лінії MOSI синхронно з SCK
-- ==========================================================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity spi_master_tx is
    Port (
        clk     : in  std_logic;                         -- системний такт
        reset   : in  std_logic;                         -- асинхронне скидання
        start   : in  std_logic;                         -- сигнал початку передачі
        data_in : in  std_logic_vector(7 downto 0);      -- байт для передачі
        sck     : out std_logic;                         -- тактовий сигнал SPI
        mosi    : out std_logic;                         -- лінія MOSI
        ss      : out std_logic;                         -- вибір Slave
        done    : out std_logic                          -- завершення передачі
    );
end spi_master_tx;

architecture Behavioral of spi_master_tx is
    type state_type is (IDLE, LOAD, SHIFT, DONE);
    signal state      : state_type := IDLE;
    signal bit_cnt    : integer range 0 to 7 := 0;
    signal shift_reg  : std_logic_vector(7 downto 0) := (others => '0');
    signal sck_int    : std_logic := '0';
begin

    process(clk, reset)
    begin
        if reset = '1' then
            state <= IDLE;
            sck_int <= '0';
            mosi <= '0';
            ss <= '1';
            done <= '0';
        elsif rising_edge(clk) then
            case state is
                when IDLE =>
                    done <= '0';
                    ss <= '1';
                    if start = '1' then
                        shift_reg <= data_in;
                        bit_cnt <= 0;
                        ss <= '0';
                        state <= SHIFT;
                    end if;

                when SHIFT =>
                    sck_int <= not sck_int;               -- генеруємо SCK
                    if sck_int = '1' then                 -- передаємо біти на фронті
                        mosi <= shift_reg(7);
                        shift_reg <= shift_reg(6 downto 0) & '0';
                        bit_cnt <= bit_cnt + 1;
                        if bit_cnt = 7 then
                            state <= DONE;
                        end if;
                    end if;

                when DONE =>
                    done <= '1';
                    ss <= '1';
                    sck_int <= '0';
                    state <= IDLE;
            end case;
        end if;
    end process;

    sck <= sck_int;  -- виводимо локальний такт
end Behavioral;
