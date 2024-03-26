
--------> /RAID2/cad/mentor/Catapult/2023.2/Mgc_home/pkgs/siflibs/ccs_in_wait_v1.vhd 
--------------------------------------------------------------------------------
-- Catapult Synthesis - Sample I/O Port Library
--
-- Copyright (c) 2003-2017 Mentor Graphics Corp.
--       All Rights Reserved
--
-- This document may be used and distributed without restriction provided that
-- this copyright statement is not removed from the file and that any derivative
-- work contains this copyright notice.
--
-- The design information contained in this file is intended to be an example
-- of the functionality which the end user may study in preparation for creating
-- their own custom interfaces. This design does not necessarily present a 
-- complete implementation of the named protocol or standard.
--
--------------------------------------------------------------------------------

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

PACKAGE ccs_in_wait_pkg_v1 IS

COMPONENT ccs_in_wait_v1
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    idat   : OUT std_logic_vector(width-1 DOWNTO 0);
    rdy    : OUT std_logic;
    ivld   : OUT std_logic;
    dat    : IN  std_logic_vector(width-1 DOWNTO 0);
    irdy   : IN  std_logic;
    vld    : IN  std_logic
   );
END COMPONENT;

END ccs_in_wait_pkg_v1;

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all; -- Prevent STARC 2.1.1.2 violation

ENTITY ccs_in_wait_v1 IS
  GENERIC (
    rscid : INTEGER;
    width : INTEGER
  );
  PORT (
    idat  : OUT std_logic_vector(width-1 DOWNTO 0);
    rdy   : OUT std_logic;
    ivld  : OUT std_logic;
    dat   : IN  std_logic_vector(width-1 DOWNTO 0);
    irdy  : IN  std_logic;
    vld   : IN  std_logic
  );
END ccs_in_wait_v1;

ARCHITECTURE beh OF ccs_in_wait_v1 IS
  constant stall_const : std_logic := '0';
  SIGNAL stall_ctrl : std_logic;
BEGIN
  stall_ctrl <= stall_const;

  idat <= dat;
  rdy  <= irdy and not stall_ctrl;
  ivld <= vld and not stall_ctrl;

END beh;


--------> /RAID2/cad/mentor/Catapult/2023.2/Mgc_home/pkgs/siflibs/ccs_out_wait_v1.vhd 
--------------------------------------------------------------------------------
-- Catapult Synthesis - Sample I/O Port Library
--
-- Copyright (c) 2003-2017 Mentor Graphics Corp.
--       All Rights Reserved
--
-- This document may be used and distributed without restriction provided that
-- this copyright statement is not removed from the file and that any derivative
-- work contains this copyright notice.
--
-- The design information contained in this file is intended to be an example
-- of the functionality which the end user may study in preparation for creating
-- their own custom interfaces. This design does not necessarily present a 
-- complete implementation of the named protocol or standard.
--
--------------------------------------------------------------------------------

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

PACKAGE ccs_out_wait_pkg_v1 IS

COMPONENT ccs_out_wait_v1
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    dat    : OUT std_logic_vector(width-1 DOWNTO 0);
    irdy   : OUT std_logic;
    vld    : OUT std_logic;
    idat   : IN  std_logic_vector(width-1 DOWNTO 0);
    rdy    : IN  std_logic;
    ivld   : IN  std_logic
  );
END COMPONENT;

END ccs_out_wait_pkg_v1;

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all; -- Prevent STARC 2.1.1.2 violation

ENTITY ccs_out_wait_v1 IS
  GENERIC (
    rscid : INTEGER;
    width : INTEGER
  );
  PORT (
    dat   : OUT std_logic_vector(width-1 DOWNTO 0);
    irdy  : OUT std_logic;
    vld   : OUT std_logic;
    idat  : IN  std_logic_vector(width-1 DOWNTO 0);
    rdy   : IN  std_logic;
    ivld  : IN  std_logic
  );
END ccs_out_wait_v1;

ARCHITECTURE beh OF ccs_out_wait_v1 IS
  constant stall_const : std_logic := '0';
  SIGNAL stall_ctrl : std_logic;
BEGIN
  stall_ctrl <= stall_const;

  dat  <= idat;
  irdy <= rdy and not stall_ctrl;
  vld  <= ivld and not stall_ctrl;

END beh;


--------> /RAID2/cad/mentor/Catapult/2023.2/Mgc_home/pkgs/siflibs/mgc_io_sync_v2.vhd 
--------------------------------------------------------------------------------
-- Catapult Synthesis - Sample I/O Port Library
--
-- Copyright (c) 2003-2017 Mentor Graphics Corp.
--       All Rights Reserved
--
-- This document may be used and distributed without restriction provided that
-- this copyright statement is not removed from the file and that any derivative
-- work contains this copyright notice.
--
-- The design information contained in this file is intended to be an example
-- of the functionality which the end user may study in preparation for creating
-- their own custom interfaces. This design does not necessarily present a 
-- complete implementation of the named protocol or standard.
--
--------------------------------------------------------------------------------

LIBRARY ieee;

USE ieee.std_logic_1164.all;
PACKAGE mgc_io_sync_pkg_v2 IS

COMPONENT mgc_io_sync_v2
  GENERIC (
    valid    : INTEGER RANGE 0 TO 1
  );
  PORT (
    ld       : IN    std_logic;
    lz       : OUT   std_logic
  );
END COMPONENT;

END mgc_io_sync_pkg_v2;

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all; -- Prevent STARC 2.1.1.2 violation

ENTITY mgc_io_sync_v2 IS
  GENERIC (
    valid    : INTEGER RANGE 0 TO 1
  );
  PORT (
    ld       : IN    std_logic;
    lz       : OUT   std_logic
  );
END mgc_io_sync_v2;

ARCHITECTURE beh OF mgc_io_sync_v2 IS
BEGIN

  lz <= ld;

END beh;


--------> /RAID2/cad/mentor/Catapult/2023.2/Mgc_home/pkgs/siflibs/ccs_in_v1.vhd 
--------------------------------------------------------------------------------
-- Catapult Synthesis - Sample I/O Port Library
--
-- Copyright (c) 2003-2017 Mentor Graphics Corp.
--       All Rights Reserved
--
-- This document may be used and distributed without restriction provided that
-- this copyright statement is not removed from the file and that any derivative
-- work contains this copyright notice.
--
-- The design information contained in this file is intended to be an example
-- of the functionality which the end user may study in preparation for creating
-- their own custom interfaces. This design does not necessarily present a 
-- complete implementation of the named protocol or standard.
--
--------------------------------------------------------------------------------

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

PACKAGE ccs_in_pkg_v1 IS

COMPONENT ccs_in_v1
  GENERIC (
    rscid    : INTEGER;
    width    : INTEGER
  );
  PORT (
    idat   : OUT std_logic_vector(width-1 DOWNTO 0);
    dat    : IN  std_logic_vector(width-1 DOWNTO 0)
  );
END COMPONENT;

END ccs_in_pkg_v1;

LIBRARY ieee;

USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all; -- Prevent STARC 2.1.1.2 violation

ENTITY ccs_in_v1 IS
  GENERIC (
    rscid : INTEGER;
    width : INTEGER
  );
  PORT (
    idat  : OUT std_logic_vector(width-1 DOWNTO 0);
    dat   : IN  std_logic_vector(width-1 DOWNTO 0)
  );
END ccs_in_v1;

ARCHITECTURE beh OF ccs_in_v1 IS
BEGIN

  idat <= dat;

END beh;


--------> ./rtl.vhdl 
-- ----------------------------------------------------------------------
--  HLS HDL:        VHDL Netlister
--  HLS Version:    2023.2/1059873 Production Release
--  HLS Date:       Mon Aug  7 10:54:31 PDT 2023
-- 
--  Generated by:   asoc020@ee21
--  Generated date: Tue Mar 26 17:36:00 2024
-- ----------------------------------------------------------------------

-- 
-- ------------------------------------------------------------------
--  Design Unit:    fir_run_run_fsm
--  FSM Module
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;


ENTITY fir_run_run_fsm IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    run_wen : IN STD_LOGIC;
    fsm_output : OUT STD_LOGIC_VECTOR (1 DOWNTO 0)
  );
END fir_run_run_fsm;

ARCHITECTURE v2 OF fir_run_run_fsm IS
  -- Default Constants

  -- FSM State Type Declaration for fir_run_run_fsm_1
  TYPE fir_run_run_fsm_1_ST IS (run_rlp_C_0, main_C_0);

  SIGNAL state_var : fir_run_run_fsm_1_ST;
  SIGNAL state_var_NS : fir_run_run_fsm_1_ST;

BEGIN
  fir_run_run_fsm_1 : PROCESS (state_var)
  BEGIN
    CASE state_var IS
      WHEN main_C_0 =>
        fsm_output <= STD_LOGIC_VECTOR'( "10");
        state_var_NS <= main_C_0;
      -- run_rlp_C_0
      WHEN OTHERS =>
        fsm_output <= STD_LOGIC_VECTOR'( "01");
        state_var_NS <= main_C_0;
    END CASE;
  END PROCESS fir_run_run_fsm_1;

  fir_run_run_fsm_1_REG : PROCESS (clk)
  BEGIN
    IF clk'event AND ( clk = '1' ) THEN
      IF ( rst = '1' ) THEN
        state_var <= run_rlp_C_0;
      ELSE
        IF ( run_wen = '1' ) THEN
          state_var <= state_var_NS;
        END IF;
      END IF;
    END IF;
  END PROCESS fir_run_run_fsm_1_REG;

END v2;

-- ------------------------------------------------------------------
--  Design Unit:    fir_run_staller
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;


ENTITY fir_run_staller IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    run_wen : OUT STD_LOGIC;
    run_wten : OUT STD_LOGIC;
    input_rsci_wen_comp : IN STD_LOGIC;
    output_rsci_wen_comp : IN STD_LOGIC
  );
END fir_run_staller;

ARCHITECTURE v2 OF fir_run_staller IS
  -- Default Constants

  -- Output Reader Declarations
  SIGNAL run_wen_drv : STD_LOGIC;

BEGIN
  -- Output Reader Assignments
  run_wen <= run_wen_drv;

  run_wen_drv <= input_rsci_wen_comp AND output_rsci_wen_comp;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        run_wten <= '0';
      ELSE
        run_wten <= NOT run_wen_drv;
      END IF;
    END IF;
  END PROCESS;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    fir_run_coeffs_triosy_obj_coeffs_triosy_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;


ENTITY fir_run_coeffs_triosy_obj_coeffs_triosy_wait_ctrl IS
  PORT(
    run_wten : IN STD_LOGIC;
    coeffs_triosy_obj_iswt0 : IN STD_LOGIC;
    coeffs_triosy_obj_biwt : OUT STD_LOGIC
  );
END fir_run_coeffs_triosy_obj_coeffs_triosy_wait_ctrl;

ARCHITECTURE v2 OF fir_run_coeffs_triosy_obj_coeffs_triosy_wait_ctrl IS
  -- Default Constants

BEGIN
  coeffs_triosy_obj_biwt <= (NOT run_wten) AND coeffs_triosy_obj_iswt0;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    fir_run_output_rsci_output_wait_dp
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;


ENTITY fir_run_output_rsci_output_wait_dp IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    output_rsci_oswt : IN STD_LOGIC;
    output_rsci_wen_comp : OUT STD_LOGIC;
    output_rsci_biwt : IN STD_LOGIC;
    output_rsci_bdwt : IN STD_LOGIC;
    output_rsci_bcwt : OUT STD_LOGIC
  );
END fir_run_output_rsci_output_wait_dp;

ARCHITECTURE v2 OF fir_run_output_rsci_output_wait_dp IS
  -- Default Constants

  -- Output Reader Declarations
  SIGNAL output_rsci_bcwt_drv : STD_LOGIC;

BEGIN
  -- Output Reader Assignments
  output_rsci_bcwt <= output_rsci_bcwt_drv;

  output_rsci_wen_comp <= (NOT output_rsci_oswt) OR output_rsci_biwt OR output_rsci_bcwt_drv;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        output_rsci_bcwt_drv <= '0';
      ELSE
        output_rsci_bcwt_drv <= NOT((NOT(output_rsci_bcwt_drv OR output_rsci_biwt))
            OR output_rsci_bdwt);
      END IF;
    END IF;
  END PROCESS;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    fir_run_output_rsci_output_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;


ENTITY fir_run_output_rsci_output_wait_ctrl IS
  PORT(
    run_wen : IN STD_LOGIC;
    output_rsci_oswt : IN STD_LOGIC;
    output_rsci_biwt : OUT STD_LOGIC;
    output_rsci_bdwt : OUT STD_LOGIC;
    output_rsci_bcwt : IN STD_LOGIC;
    output_rsci_irdy : IN STD_LOGIC;
    output_rsci_ivld_run_sct : OUT STD_LOGIC
  );
END fir_run_output_rsci_output_wait_ctrl;

ARCHITECTURE v2 OF fir_run_output_rsci_output_wait_ctrl IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL output_rsci_ogwt : STD_LOGIC;

BEGIN
  output_rsci_bdwt <= output_rsci_oswt AND run_wen;
  output_rsci_biwt <= output_rsci_ogwt AND output_rsci_irdy;
  output_rsci_ogwt <= output_rsci_oswt AND (NOT output_rsci_bcwt);
  output_rsci_ivld_run_sct <= output_rsci_ogwt;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    fir_run_input_rsci_input_wait_dp
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;


ENTITY fir_run_input_rsci_input_wait_dp IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    input_rsci_oswt : IN STD_LOGIC;
    input_rsci_wen_comp : OUT STD_LOGIC;
    input_rsci_idat_mxwt : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    input_rsci_biwt : IN STD_LOGIC;
    input_rsci_bdwt : IN STD_LOGIC;
    input_rsci_bcwt : OUT STD_LOGIC;
    input_rsci_idat : IN STD_LOGIC_VECTOR (7 DOWNTO 0)
  );
END fir_run_input_rsci_input_wait_dp;

ARCHITECTURE v2 OF fir_run_input_rsci_input_wait_dp IS
  -- Default Constants

  -- Output Reader Declarations
  SIGNAL input_rsci_bcwt_drv : STD_LOGIC;

  -- Interconnect Declarations
  SIGNAL input_rsci_idat_bfwt : STD_LOGIC_VECTOR (7 DOWNTO 0);

  FUNCTION MUX_v_8_2_2(input_0 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  input_1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  sel : STD_LOGIC)
  RETURN STD_LOGIC_VECTOR IS
    VARIABLE result : STD_LOGIC_VECTOR(7 DOWNTO 0);

    BEGIN
      CASE sel IS
        WHEN '0' =>
          result := input_0;
        WHEN others =>
          result := input_1;
      END CASE;
    RETURN result;
  END;

BEGIN
  -- Output Reader Assignments
  input_rsci_bcwt <= input_rsci_bcwt_drv;

  input_rsci_wen_comp <= (NOT input_rsci_oswt) OR input_rsci_biwt OR input_rsci_bcwt_drv;
  input_rsci_idat_mxwt <= MUX_v_8_2_2(input_rsci_idat, input_rsci_idat_bfwt, input_rsci_bcwt_drv);
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        input_rsci_bcwt_drv <= '0';
      ELSE
        input_rsci_bcwt_drv <= NOT((NOT(input_rsci_bcwt_drv OR input_rsci_biwt))
            OR input_rsci_bdwt);
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        input_rsci_idat_bfwt <= STD_LOGIC_VECTOR'( "00000000");
      ELSIF ( input_rsci_biwt = '1' ) THEN
        input_rsci_idat_bfwt <= input_rsci_idat;
      END IF;
    END IF;
  END PROCESS;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    fir_run_input_rsci_input_wait_ctrl
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;


ENTITY fir_run_input_rsci_input_wait_ctrl IS
  PORT(
    run_wen : IN STD_LOGIC;
    input_rsci_oswt : IN STD_LOGIC;
    input_rsci_biwt : OUT STD_LOGIC;
    input_rsci_bdwt : OUT STD_LOGIC;
    input_rsci_bcwt : IN STD_LOGIC;
    input_rsci_irdy_run_sct : OUT STD_LOGIC;
    input_rsci_ivld : IN STD_LOGIC
  );
END fir_run_input_rsci_input_wait_ctrl;

ARCHITECTURE v2 OF fir_run_input_rsci_input_wait_ctrl IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL input_rsci_ogwt : STD_LOGIC;

BEGIN
  input_rsci_bdwt <= input_rsci_oswt AND run_wen;
  input_rsci_biwt <= input_rsci_ogwt AND input_rsci_ivld;
  input_rsci_ogwt <= input_rsci_oswt AND (NOT input_rsci_bcwt);
  input_rsci_irdy_run_sct <= input_rsci_ogwt;
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    fir_run_coeffs_triosy_obj
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;


ENTITY fir_run_coeffs_triosy_obj IS
  PORT(
    coeffs_triosy_lz : OUT STD_LOGIC;
    run_wten : IN STD_LOGIC;
    coeffs_triosy_obj_iswt0 : IN STD_LOGIC
  );
END fir_run_coeffs_triosy_obj;

ARCHITECTURE v2 OF fir_run_coeffs_triosy_obj IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL coeffs_triosy_obj_biwt : STD_LOGIC;

  COMPONENT fir_run_coeffs_triosy_obj_coeffs_triosy_wait_ctrl
    PORT(
      run_wten : IN STD_LOGIC;
      coeffs_triosy_obj_iswt0 : IN STD_LOGIC;
      coeffs_triosy_obj_biwt : OUT STD_LOGIC
    );
  END COMPONENT;
BEGIN
  coeffs_triosy_obj : work.mgc_io_sync_pkg_v2.mgc_io_sync_v2
    GENERIC MAP(
      valid => 0
      )
    PORT MAP(
      ld => coeffs_triosy_obj_biwt,
      lz => coeffs_triosy_lz
    );
  fir_run_coeffs_triosy_obj_coeffs_triosy_wait_ctrl_inst : fir_run_coeffs_triosy_obj_coeffs_triosy_wait_ctrl
    PORT MAP(
      run_wten => run_wten,
      coeffs_triosy_obj_iswt0 => coeffs_triosy_obj_iswt0,
      coeffs_triosy_obj_biwt => coeffs_triosy_obj_biwt
    );
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    fir_run_output_rsci
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;


ENTITY fir_run_output_rsci IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    output_rsc_dat : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    output_rsc_vld : OUT STD_LOGIC;
    output_rsc_rdy : IN STD_LOGIC;
    run_wen : IN STD_LOGIC;
    output_rsci_oswt : IN STD_LOGIC;
    output_rsci_wen_comp : OUT STD_LOGIC;
    output_rsci_idat : IN STD_LOGIC_VECTOR (7 DOWNTO 0)
  );
END fir_run_output_rsci;

ARCHITECTURE v2 OF fir_run_output_rsci IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL output_rsci_biwt : STD_LOGIC;
  SIGNAL output_rsci_bdwt : STD_LOGIC;
  SIGNAL output_rsci_bcwt : STD_LOGIC;
  SIGNAL output_rsci_irdy : STD_LOGIC;
  SIGNAL output_rsci_ivld_run_sct : STD_LOGIC;

  SIGNAL output_rsci_idat_1 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL output_rsci_dat : STD_LOGIC_VECTOR (7 DOWNTO 0);

  COMPONENT fir_run_output_rsci_output_wait_ctrl
    PORT(
      run_wen : IN STD_LOGIC;
      output_rsci_oswt : IN STD_LOGIC;
      output_rsci_biwt : OUT STD_LOGIC;
      output_rsci_bdwt : OUT STD_LOGIC;
      output_rsci_bcwt : IN STD_LOGIC;
      output_rsci_irdy : IN STD_LOGIC;
      output_rsci_ivld_run_sct : OUT STD_LOGIC
    );
  END COMPONENT;
  COMPONENT fir_run_output_rsci_output_wait_dp
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      output_rsci_oswt : IN STD_LOGIC;
      output_rsci_wen_comp : OUT STD_LOGIC;
      output_rsci_biwt : IN STD_LOGIC;
      output_rsci_bdwt : IN STD_LOGIC;
      output_rsci_bcwt : OUT STD_LOGIC
    );
  END COMPONENT;
BEGIN
  output_rsci : work.ccs_out_wait_pkg_v1.ccs_out_wait_v1
    GENERIC MAP(
      rscid => 3,
      width => 8
      )
    PORT MAP(
      irdy => output_rsci_irdy,
      ivld => output_rsci_ivld_run_sct,
      idat => output_rsci_idat_1,
      rdy => output_rsc_rdy,
      vld => output_rsc_vld,
      dat => output_rsci_dat
    );
  output_rsci_idat_1 <= output_rsci_idat;
  output_rsc_dat <= output_rsci_dat;

  fir_run_output_rsci_output_wait_ctrl_inst : fir_run_output_rsci_output_wait_ctrl
    PORT MAP(
      run_wen => run_wen,
      output_rsci_oswt => output_rsci_oswt,
      output_rsci_biwt => output_rsci_biwt,
      output_rsci_bdwt => output_rsci_bdwt,
      output_rsci_bcwt => output_rsci_bcwt,
      output_rsci_irdy => output_rsci_irdy,
      output_rsci_ivld_run_sct => output_rsci_ivld_run_sct
    );
  fir_run_output_rsci_output_wait_dp_inst : fir_run_output_rsci_output_wait_dp
    PORT MAP(
      clk => clk,
      rst => rst,
      output_rsci_oswt => output_rsci_oswt,
      output_rsci_wen_comp => output_rsci_wen_comp,
      output_rsci_biwt => output_rsci_biwt,
      output_rsci_bdwt => output_rsci_bdwt,
      output_rsci_bcwt => output_rsci_bcwt
    );
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    fir_run_input_rsci
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;


ENTITY fir_run_input_rsci IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    input_rsc_dat : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    input_rsc_vld : IN STD_LOGIC;
    input_rsc_rdy : OUT STD_LOGIC;
    run_wen : IN STD_LOGIC;
    input_rsci_oswt : IN STD_LOGIC;
    input_rsci_wen_comp : OUT STD_LOGIC;
    input_rsci_idat_mxwt : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
  );
END fir_run_input_rsci;

ARCHITECTURE v2 OF fir_run_input_rsci IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL input_rsci_biwt : STD_LOGIC;
  SIGNAL input_rsci_bdwt : STD_LOGIC;
  SIGNAL input_rsci_bcwt : STD_LOGIC;
  SIGNAL input_rsci_irdy_run_sct : STD_LOGIC;
  SIGNAL input_rsci_ivld : STD_LOGIC;
  SIGNAL input_rsci_idat : STD_LOGIC_VECTOR (7 DOWNTO 0);

  SIGNAL input_rsci_dat : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL input_rsci_idat_1 : STD_LOGIC_VECTOR (7 DOWNTO 0);

  COMPONENT fir_run_input_rsci_input_wait_ctrl
    PORT(
      run_wen : IN STD_LOGIC;
      input_rsci_oswt : IN STD_LOGIC;
      input_rsci_biwt : OUT STD_LOGIC;
      input_rsci_bdwt : OUT STD_LOGIC;
      input_rsci_bcwt : IN STD_LOGIC;
      input_rsci_irdy_run_sct : OUT STD_LOGIC;
      input_rsci_ivld : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT fir_run_input_rsci_input_wait_dp
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      input_rsci_oswt : IN STD_LOGIC;
      input_rsci_wen_comp : OUT STD_LOGIC;
      input_rsci_idat_mxwt : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      input_rsci_biwt : IN STD_LOGIC;
      input_rsci_bdwt : IN STD_LOGIC;
      input_rsci_bcwt : OUT STD_LOGIC;
      input_rsci_idat : IN STD_LOGIC_VECTOR (7 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL fir_run_input_rsci_input_wait_dp_inst_input_rsci_idat_mxwt : STD_LOGIC_VECTOR
      (7 DOWNTO 0);
  SIGNAL fir_run_input_rsci_input_wait_dp_inst_input_rsci_idat : STD_LOGIC_VECTOR
      (7 DOWNTO 0);

BEGIN
  input_rsci : work.ccs_in_wait_pkg_v1.ccs_in_wait_v1
    GENERIC MAP(
      rscid => 1,
      width => 8
      )
    PORT MAP(
      rdy => input_rsc_rdy,
      vld => input_rsc_vld,
      dat => input_rsci_dat,
      irdy => input_rsci_irdy_run_sct,
      ivld => input_rsci_ivld,
      idat => input_rsci_idat_1
    );
  input_rsci_dat <= input_rsc_dat;
  input_rsci_idat <= input_rsci_idat_1;

  fir_run_input_rsci_input_wait_ctrl_inst : fir_run_input_rsci_input_wait_ctrl
    PORT MAP(
      run_wen => run_wen,
      input_rsci_oswt => input_rsci_oswt,
      input_rsci_biwt => input_rsci_biwt,
      input_rsci_bdwt => input_rsci_bdwt,
      input_rsci_bcwt => input_rsci_bcwt,
      input_rsci_irdy_run_sct => input_rsci_irdy_run_sct,
      input_rsci_ivld => input_rsci_ivld
    );
  fir_run_input_rsci_input_wait_dp_inst : fir_run_input_rsci_input_wait_dp
    PORT MAP(
      clk => clk,
      rst => rst,
      input_rsci_oswt => input_rsci_oswt,
      input_rsci_wen_comp => input_rsci_wen_comp,
      input_rsci_idat_mxwt => fir_run_input_rsci_input_wait_dp_inst_input_rsci_idat_mxwt,
      input_rsci_biwt => input_rsci_biwt,
      input_rsci_bdwt => input_rsci_bdwt,
      input_rsci_bcwt => input_rsci_bcwt,
      input_rsci_idat => fir_run_input_rsci_input_wait_dp_inst_input_rsci_idat
    );
  input_rsci_idat_mxwt <= fir_run_input_rsci_input_wait_dp_inst_input_rsci_idat_mxwt;
  fir_run_input_rsci_input_wait_dp_inst_input_rsci_idat <= input_rsci_idat;

END v2;

-- ------------------------------------------------------------------
--  Design Unit:    fir_run
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;


ENTITY fir_run IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    input_rsc_dat : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    input_rsc_vld : IN STD_LOGIC;
    input_rsc_rdy : OUT STD_LOGIC;
    coeffs_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    coeffs_triosy_lz : OUT STD_LOGIC;
    output_rsc_dat : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    output_rsc_vld : OUT STD_LOGIC;
    output_rsc_rdy : IN STD_LOGIC
  );
END fir_run;

ARCHITECTURE v2 OF fir_run IS
  -- Default Constants

  -- Interconnect Declarations
  SIGNAL run_wen : STD_LOGIC;
  SIGNAL run_wten : STD_LOGIC;
  SIGNAL input_rsci_wen_comp : STD_LOGIC;
  SIGNAL input_rsci_idat_mxwt : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL coeffs_rsci_idat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL output_rsci_wen_comp : STD_LOGIC;
  SIGNAL output_rsci_idat : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL fsm_output : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL reg_coeffs_triosy_obj_iswt0_cse : STD_LOGIC;
  SIGNAL reg_input_rsci_iswt0_cse : STD_LOGIC;
  SIGNAL and_18_cse : STD_LOGIC;
  SIGNAL regs_1_sva : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL regs_0_sva : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL MAC_asn_1_itm : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL MAC_asn_3_itm : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL MAC_asn_4_itm : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL MAC_asn_5_itm : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL MAC_asn_6_itm : STD_LOGIC_VECTOR (7 DOWNTO 0);

  SIGNAL MAC_8_acc_1_nl : STD_LOGIC_VECTOR (18 DOWNTO 0);
  SIGNAL MAC_3_mul_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL MAC_4_mul_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL MAC_7_mul_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL MAC_8_mul_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL MAC_5_mul_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL MAC_6_mul_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL MAC_1_mul_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL MAC_2_mul_nl : STD_LOGIC_VECTOR (15 DOWNTO 0);
  SIGNAL coeffs_rsci_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL coeffs_rsci_idat_1 : STD_LOGIC_VECTOR (63 DOWNTO 0);

  COMPONENT fir_run_input_rsci
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      input_rsc_dat : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      input_rsc_vld : IN STD_LOGIC;
      input_rsc_rdy : OUT STD_LOGIC;
      run_wen : IN STD_LOGIC;
      input_rsci_oswt : IN STD_LOGIC;
      input_rsci_wen_comp : OUT STD_LOGIC;
      input_rsci_idat_mxwt : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL fir_run_input_rsci_inst_input_rsc_dat : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL fir_run_input_rsci_inst_input_rsci_idat_mxwt : STD_LOGIC_VECTOR (7 DOWNTO
      0);

  COMPONENT fir_run_output_rsci
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      output_rsc_dat : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      output_rsc_vld : OUT STD_LOGIC;
      output_rsc_rdy : IN STD_LOGIC;
      run_wen : IN STD_LOGIC;
      output_rsci_oswt : IN STD_LOGIC;
      output_rsci_wen_comp : OUT STD_LOGIC;
      output_rsci_idat : IN STD_LOGIC_VECTOR (7 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL fir_run_output_rsci_inst_output_rsc_dat : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL fir_run_output_rsci_inst_output_rsci_idat : STD_LOGIC_VECTOR (7 DOWNTO 0);

  COMPONENT fir_run_coeffs_triosy_obj
    PORT(
      coeffs_triosy_lz : OUT STD_LOGIC;
      run_wten : IN STD_LOGIC;
      coeffs_triosy_obj_iswt0 : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT fir_run_staller
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      run_wen : OUT STD_LOGIC;
      run_wten : OUT STD_LOGIC;
      input_rsci_wen_comp : IN STD_LOGIC;
      output_rsci_wen_comp : IN STD_LOGIC
    );
  END COMPONENT;
  COMPONENT fir_run_run_fsm
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      run_wen : IN STD_LOGIC;
      fsm_output : OUT STD_LOGIC_VECTOR (1 DOWNTO 0)
    );
  END COMPONENT;
  SIGNAL fir_run_run_fsm_inst_fsm_output : STD_LOGIC_VECTOR (1 DOWNTO 0);

BEGIN
  coeffs_rsci : work.ccs_in_pkg_v1.ccs_in_v1
    GENERIC MAP(
      rscid => 2,
      width => 64
      )
    PORT MAP(
      dat => coeffs_rsci_dat,
      idat => coeffs_rsci_idat_1
    );
  coeffs_rsci_dat <= coeffs_rsc_dat;
  coeffs_rsci_idat <= coeffs_rsci_idat_1;

  fir_run_input_rsci_inst : fir_run_input_rsci
    PORT MAP(
      clk => clk,
      rst => rst,
      input_rsc_dat => fir_run_input_rsci_inst_input_rsc_dat,
      input_rsc_vld => input_rsc_vld,
      input_rsc_rdy => input_rsc_rdy,
      run_wen => run_wen,
      input_rsci_oswt => reg_input_rsci_iswt0_cse,
      input_rsci_wen_comp => input_rsci_wen_comp,
      input_rsci_idat_mxwt => fir_run_input_rsci_inst_input_rsci_idat_mxwt
    );
  fir_run_input_rsci_inst_input_rsc_dat <= input_rsc_dat;
  input_rsci_idat_mxwt <= fir_run_input_rsci_inst_input_rsci_idat_mxwt;

  fir_run_output_rsci_inst : fir_run_output_rsci
    PORT MAP(
      clk => clk,
      rst => rst,
      output_rsc_dat => fir_run_output_rsci_inst_output_rsc_dat,
      output_rsc_vld => output_rsc_vld,
      output_rsc_rdy => output_rsc_rdy,
      run_wen => run_wen,
      output_rsci_oswt => reg_coeffs_triosy_obj_iswt0_cse,
      output_rsci_wen_comp => output_rsci_wen_comp,
      output_rsci_idat => fir_run_output_rsci_inst_output_rsci_idat
    );
  output_rsc_dat <= fir_run_output_rsci_inst_output_rsc_dat;
  fir_run_output_rsci_inst_output_rsci_idat <= output_rsci_idat;

  fir_run_coeffs_triosy_obj_inst : fir_run_coeffs_triosy_obj
    PORT MAP(
      coeffs_triosy_lz => coeffs_triosy_lz,
      run_wten => run_wten,
      coeffs_triosy_obj_iswt0 => reg_coeffs_triosy_obj_iswt0_cse
    );
  fir_run_staller_inst : fir_run_staller
    PORT MAP(
      clk => clk,
      rst => rst,
      run_wen => run_wen,
      run_wten => run_wten,
      input_rsci_wen_comp => input_rsci_wen_comp,
      output_rsci_wen_comp => output_rsci_wen_comp
    );
  fir_run_run_fsm_inst : fir_run_run_fsm
    PORT MAP(
      clk => clk,
      rst => rst,
      run_wen => run_wen,
      fsm_output => fir_run_run_fsm_inst_fsm_output
    );
  fsm_output <= fir_run_run_fsm_inst_fsm_output;

  and_18_cse <= run_wen AND (NOT (fsm_output(0)));
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        reg_coeffs_triosy_obj_iswt0_cse <= '0';
        reg_input_rsci_iswt0_cse <= '0';
      ELSIF ( run_wen = '1' ) THEN
        reg_coeffs_triosy_obj_iswt0_cse <= fsm_output(1);
        reg_input_rsci_iswt0_cse <= '1';
      END IF;
    END IF;
  END PROCESS;
  PROCESS (clk)
  BEGIN
    IF clk'EVENT AND ( clk = '1' ) THEN
      IF (rst = '1') THEN
        output_rsci_idat <= STD_LOGIC_VECTOR'( "00000000");
        regs_0_sva <= STD_LOGIC_VECTOR'( "00000000");
        MAC_asn_1_itm <= STD_LOGIC_VECTOR'( "00000000");
        regs_1_sva <= STD_LOGIC_VECTOR'( "00000000");
        MAC_asn_3_itm <= STD_LOGIC_VECTOR'( "00000000");
        MAC_asn_4_itm <= STD_LOGIC_VECTOR'( "00000000");
        MAC_asn_5_itm <= STD_LOGIC_VECTOR'( "00000000");
        MAC_asn_6_itm <= STD_LOGIC_VECTOR'( "00000000");
      ELSIF ( and_18_cse = '1' ) THEN
        output_rsci_idat <= MAC_8_acc_1_nl(18 DOWNTO 11);
        regs_0_sva <= input_rsci_idat_mxwt;
        MAC_asn_1_itm <= regs_1_sva;
        regs_1_sva <= regs_0_sva;
        MAC_asn_3_itm <= MAC_asn_4_itm;
        MAC_asn_4_itm <= MAC_asn_1_itm;
        MAC_asn_5_itm <= MAC_asn_6_itm;
        MAC_asn_6_itm <= MAC_asn_3_itm;
      END IF;
    END IF;
  END PROCESS;
  MAC_3_mul_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED'( SIGNED(coeffs_rsci_idat(47
      DOWNTO 40)) * SIGNED(MAC_asn_3_itm)), 16));
  MAC_4_mul_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED'( SIGNED(coeffs_rsci_idat(39
      DOWNTO 32)) * SIGNED(MAC_asn_4_itm)), 16));
  MAC_7_mul_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED'( SIGNED(coeffs_rsci_idat(15
      DOWNTO 8)) * SIGNED(regs_0_sva)), 16));
  MAC_8_mul_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED'( SIGNED(coeffs_rsci_idat(7
      DOWNTO 0)) * SIGNED(input_rsci_idat_mxwt)), 16));
  MAC_5_mul_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED'( SIGNED(coeffs_rsci_idat(31
      DOWNTO 24)) * SIGNED(MAC_asn_1_itm)), 16));
  MAC_6_mul_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED'( SIGNED(coeffs_rsci_idat(23
      DOWNTO 16)) * SIGNED(regs_1_sva)), 16));
  MAC_1_mul_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED'( SIGNED(coeffs_rsci_idat(63
      DOWNTO 56)) * SIGNED(MAC_asn_5_itm)), 16));
  MAC_2_mul_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(SIGNED'( SIGNED(coeffs_rsci_idat(55
      DOWNTO 48)) * SIGNED(MAC_asn_6_itm)), 16));
  MAC_8_acc_1_nl <= STD_LOGIC_VECTOR(CONV_SIGNED(CONV_SIGNED(SIGNED(MAC_3_mul_nl),
      19) + CONV_SIGNED(SIGNED(MAC_4_mul_nl), 19) + CONV_SIGNED(SIGNED(MAC_7_mul_nl),
      19) + CONV_SIGNED(SIGNED(MAC_8_mul_nl), 19) + CONV_SIGNED(SIGNED(MAC_5_mul_nl),
      19) + CONV_SIGNED(SIGNED(MAC_6_mul_nl), 19) + CONV_SIGNED(SIGNED(MAC_1_mul_nl),
      19) + CONV_SIGNED(SIGNED(MAC_2_mul_nl), 19), 19));
END v2;

-- ------------------------------------------------------------------
--  Design Unit:    fir
-- ------------------------------------------------------------------

LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

USE work.ccs_in_wait_pkg_v1.ALL;
USE work.ccs_out_wait_pkg_v1.ALL;
USE work.mgc_io_sync_pkg_v2.ALL;
USE work.ccs_in_pkg_v1.ALL;


ENTITY fir IS
  PORT(
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    input_rsc_dat : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    input_rsc_vld : IN STD_LOGIC;
    input_rsc_rdy : OUT STD_LOGIC;
    coeffs_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
    coeffs_triosy_lz : OUT STD_LOGIC;
    output_rsc_dat : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
    output_rsc_vld : OUT STD_LOGIC;
    output_rsc_rdy : IN STD_LOGIC
  );
END fir;

ARCHITECTURE v2 OF fir IS
  -- Default Constants

  COMPONENT fir_run
    PORT(
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      input_rsc_dat : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      input_rsc_vld : IN STD_LOGIC;
      input_rsc_rdy : OUT STD_LOGIC;
      coeffs_rsc_dat : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
      coeffs_triosy_lz : OUT STD_LOGIC;
      output_rsc_dat : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      output_rsc_vld : OUT STD_LOGIC;
      output_rsc_rdy : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL fir_run_inst_input_rsc_dat : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL fir_run_inst_coeffs_rsc_dat : STD_LOGIC_VECTOR (63 DOWNTO 0);
  SIGNAL fir_run_inst_output_rsc_dat : STD_LOGIC_VECTOR (7 DOWNTO 0);

BEGIN
  fir_run_inst : fir_run
    PORT MAP(
      clk => clk,
      rst => rst,
      input_rsc_dat => fir_run_inst_input_rsc_dat,
      input_rsc_vld => input_rsc_vld,
      input_rsc_rdy => input_rsc_rdy,
      coeffs_rsc_dat => fir_run_inst_coeffs_rsc_dat,
      coeffs_triosy_lz => coeffs_triosy_lz,
      output_rsc_dat => fir_run_inst_output_rsc_dat,
      output_rsc_vld => output_rsc_vld,
      output_rsc_rdy => output_rsc_rdy
    );
  fir_run_inst_input_rsc_dat <= input_rsc_dat;
  fir_run_inst_coeffs_rsc_dat <= coeffs_rsc_dat;
  output_rsc_dat <= fir_run_inst_output_rsc_dat;

END v2;



