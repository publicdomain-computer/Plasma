---------------------------------------------------------------------
-- TITLE: Random Access Memory for Xilinx
-- AUTHOR: Steve Rhoads (rhoadss@yahoo.com)
-- DATE CREATED: 11/06/05
-- FILENAME: ram_xilinx.vhd
-- PROJECT: Plasma CPU core
-- COPYRIGHT: Software placed into the public domain by the author.
--    Software 'as is' without warranty.  Author liable for nothing.
-- DESCRIPTION:
--    Implements the RAM for Spartan 3 Xilinx FPGA
--
--    Compile the MIPS C and assembly code into "text.exe".
--    Run convert.exe to change "text.exe" to "code.txt" which
--    will contain the hex values of the opcodes.
--    Next run "run_image ram_xilinx.vhd code.txt ram_image.vhd",
--    to create the "ram_image.vhd" file that will have the opcodes
--    corectly placed inside the INIT_00 => strings.
--    Then include ram_image.vhd in the simulation/synthesis.
---------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.mlite_pack.all;
library UNISIM;
use UNISIM.vcomponents.all;

entity ram is
   generic(memory_type : string := "DEFAULT");
   port(clk               : in std_logic;
        enable            : in std_logic;
        write_byte_enable : in std_logic_vector(3 downto 0);
        address           : in std_logic_vector(31 downto 2);
        data_write        : in std_logic_vector(31 downto 0);
        data_read         : out std_logic_vector(31 downto 0));
end; --entity ram

architecture logic of ram is
begin

   RAMB16_S9_inst0 : RAMB16_S9
   generic map (
INIT_00 => X"8c8c8c8c8c8c8c8c8c8c8c8c3403acacacacacacacacacacacac40034008000c",
INIT_01 => X"afafafaf272703008f240c3c000caf2700030014009024ac303c001000903403",
INIT_02 => X"24008c001030008d343c353c001827038f8f8f8f02021402260c9002001a0000",
INIT_03 => X"3c301030008c343c30038c343c1030008c343c3c1430008c343c0003001400a0",
INIT_04 => X"0000109000900010001400240010001400900090000018ac033c001430008c34",
INIT_05 => X"240024241000102c0090000018000003a00024140090a0002490001000900003",
INIT_06 => X"1400002400000024900000180000030014000024002490000018000003001400",
INIT_07 => X"00900010ad0014009024140090ad24248d00142c2424100090ad00af27000300",
INIT_08 => X"009000102c14002c242c00902410001400241000140090241424002424240010",
INIT_09 => X"2c24002703008f240c240010000c0011000010240c24241524ad00008d242414",
INIT_0A => X"24a024042414a02590000000000000000000143c142400001400243ca0100014",
INIT_0B => X"900030000000243c242424a024a02401030014002424a0a0909000100024a025",
INIT_0C => X"0000000010270c020cac2427343c240c3c8c343cafaf270003a000a004242400",
INIT_0D => X"0000726f4800433834305854504c4844393531333742464a4e52565a0a000000",
INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000")
   port map (
      DO   => data_read(31 downto 24),
      DOP  => open, 
      ADDR => address(12 downto 2),
      CLK  => clk, 
      DI   => data_write(31 downto 24),
      DIP  => ZERO(0 downto 0),
      EN   => enable,
      SSR  => ZERO(0),
      WE   => write_byte_enable(3));

   RAMB16_S9_inst1 : RAMB16_S9
   generic map (
INIT_00 => X"9f9d9c9e979695949392919002e09f9d9c9e979695949392919084e002000000",
INIT_01 => X"b0b1b2bfbdbde000bf8400040000bfbd00e0004000828462420300400082a2e0",
INIT_02 => X"c686e30040420002e707080800a0bde0b0b1b2bf20504011100044508020a000",
INIT_03 => X"038440420042420242e042420240420062630302404200424202c0e00040c543",
INIT_04 => X"00620042a74387e68740e6e7006000620042a7438700c044e002004042006263",
INIT_05 => X"e743424200064062004387e0a000c0e04086c64000a26286a5a2004000a200e0",
INIT_06 => X"40e54342024606e74387e0a000e0e00040c5434207c64386c0a000c0e00040e5",
INIT_07 => X"0062000020854000824240008222428422004042420840008220a0bfbdc0e000",
INIT_08 => X"00e20040c2606242c2c300e60800004a000800004b0082e7aca5600a0b0c0040",
INIT_09 => X"42c2a0bde000bfa50084000000000002000000a5008402020222450022a5a540",
INIT_0A => X"e7e20261e780e20842496b008600000006008101c1010786c0804902a0000040",
INIT_0B => X"636863c383c94802090607a202a20200e00040a7a5e7a3e2e3a20040a7e7e008",
INIT_0C => X"0000000000a40000005006a54202840004504202b0bfbde0e040a743c1c6e7a7",
INIT_0D => X"00006c206500443935315955514d494541363232364145494d5155590d000000",
INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000")
   port map (
      DO   => data_read(23 downto 16),
      DOP  => open, 
      ADDR => address(12 downto 2),
      CLK  => clk, 
      DI   => data_write(23 downto 16),
      DIP  => ZERO(0 downto 0),
      EN   => enable,
      SSR  => ZERO(0),
      WE   => write_byte_enable(2));

   RAMB16_S9_inst2 : RAMB16_S9
   generic map (
INIT_00 => X"0000000000000000000000000000000000000000000000000000600060000001",
INIT_01 => X"00000000ff00000000060040000000ff000000ff000000000020000000000000",
INIT_02 => X"00100000000000000020002030000000000000001010ff100000001090008880",
INIT_03 => X"20000000000000200000000020ff000000002020000000000020100000ff1000",
INIT_04 => X"101000001000100010ff1000000000000000100010380000002000ff00000000",
INIT_05 => X"0030ffff001100000000103000381000001000ff000000180000300000000000",
INIT_06 => X"ff1030ff101010000010300038100000ff1038ff10000010380030100000ff10",
INIT_07 => X"000010000018000000ffff000000000000000000ff00002800004800ff100000",
INIT_08 => X"0000000000001800ff0000000000000000000000000000000000380000000000",
INIT_09 => X"00ff3800000000ff0000000000000000000000ff000000000000100000ff00ff",
INIT_0A => X"0000000000ff000000101058000000200000008000ff00000018064000004000",
INIT_0B => X"001800181818064000000000000000100000ff1000ff00000000000010ff0000",
INIT_0C => X"00000000ff0000200100000000200600400000200000ff1000001000ffff0010",
INIT_0D => X"000064576c00454136325a56524e4a4642373331353944484c50545800000000",
INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000")
   port map (
      DO   => data_read(15 downto 8),
      DOP  => open, 
      ADDR => address(12 downto 2),
      CLK  => clk, 
      DI   => data_write(15 downto 8),
      DIP  => ZERO(0 downto 0),
      EN   => enable,
      SSR  => ZERO(0),
      WE   => write_byte_enable(1));

   RAMB16_S9_inst3 : RAMB16_S9
   generic map (
INIT_00 => X"2c2824201c1814100c08040000082c2824201c1814100c080400000800020089",
INIT_01 => X"1014181ce0180800108c2200002210e8000800fa00000100ff00000900000008",
INIT_02 => X"012100000808000004000800251120081014181c2521fb2a0178002125082525",
INIT_03 => X"00ff080100000800ff08000400fc080000080000080800000800250800f52a00",
INIT_04 => X"252302002100210621f52a01000500070000210021250e00080000fc01000008",
INIT_05 => X"0121c9d00200033a000021250f252508002101f9000000210100250900000008",
INIT_06 => X"f62a21d0402180010021250c25250800f82a21d040010021250a25250800f32a",
INIT_07 => X"0000253c0021040000d0f600000001010000090ad064122500002510e8250800",
INIT_08 => X"0000000647082507c6300000620b000300781000030001010c01256278010022",
INIT_09 => X"23fe2518080010fec502000400d3000500000bfeb20262067800210000ff01e6",
INIT_0A => X"01002d0401eb000123212312180000120d00020004ff0d1a02259000002c2503",
INIT_0B => X"0021ff072404d8000f1c0201780030250800f82b01ff00000000000a2bff0001",
INIT_0C => X"00000000ff1030253d000a106000ec22000070005054a82508002100f6fc0121",
INIT_0D => X"0000206f6c00464237330057534f4b4743383430343843474b4f535700000000",
INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000")
   port map (
      DO   => data_read(7 downto 0),
      DOP  => open, 
      ADDR => address(12 downto 2),
      CLK  => clk, 
      DI   => data_write(7 downto 0),
      DIP  => ZERO(0 downto 0),
      EN   => enable,
      SSR  => ZERO(0),
      WE   => write_byte_enable(0));

end; --architecture logic
