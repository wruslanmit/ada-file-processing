-- File   : testdriver_main_ada_file_processing.adb
-- Date   : Tue 09 Mar 2021 09:18:35 AM +08
-- Author : wruslandr@gmail.com
-- Version: 1.0 Tue 09 Mar 2021 09:18:35 AM +08
-- ========================================================
-- IMPORT STANDARD ADA PACKAGES
-- REF: http://www.ada-auth.org/standards/rm12_w_tc1/html/RM-A-10-1.html

with Ada.Text_IO;
use  Ada.Text_IO;
with Ada.Strings.Unbounded;  
-- use Ada.Strings.Unbounded;  

-- IMPORT USER-DEFINED ADA PACKAGES
with pkg_ada_datetime_stamp;
with pkg_ada_file_open_close;
with pkg_ada_file_properties;
with pkg_ada_file_line_properties;
with pkg_ada_file_read_write;
with pkg_ada_file_remove_lines;

-- ========================================================
procedure testdriver_main_ada_file_processing
-- ========================================================
--	with SPARK_Mode => on
is 
   -- RENAME STANDARD ADA PACKAGES FOR CONVENIENCE
   package ATIO   renames Ada.Text_IO;
   package ASU    renames Ada.Strings.Unbounded;  
      
   -- RENAME USER-DEFINED ADA PACKAGES FOR CONVENIENCE
   package PADTS  renames pkg_ada_datetime_stamp;
   package PAFOC  renames pkg_ada_file_open_close;
   package PAFP   renames pkg_ada_file_properties;
   package PAFLP  renames pkg_ada_file_line_properties;
   package PAFRW  renames pkg_ada_file_read_write;
   package PAFRL  renames pkg_ada_file_remove_lines;
   
   -- PACKAGE-WIDE VARIABLES
   -- ====================================================

   inp_fhandle_main : ATIO.File_Type; 
   inp_fhandle      : ATIO.File_Type;
   
   inp_fmode        : ATIO.File_Mode  := ATIO.In_File;
   out_fmode        : ATIO.File_Mode  := ATIO.Out_File;
   app_fmode        : ATIO.File_Mode  := ATIO.Append_File;
   
   -- MUST SELECT ONLY ONE FILE
   
   inp_fname_01     : String := "files/test_file.txt"; 
   out_fname_01     : String := "files/test_file_after_blankline_removals.txt";
   
   inp_fname_02     : String := "files/test_file_after_blankline_removals.txt";
   out_fname_02     : String := "files/test_file_after_hash_line_removals.txt";
   
   substr_condition_02 : String := "ONLY"; -- Lines containing substring "ONLY"
   substr_condition_03 : String := "#";    -- Lines containing substring  hash
   
   -- inp_fname      : String := "files/ngc-files/bismillah.ngc";
   -- inp_fname      : String := "files/ngc-files/butterfly.nc";
   -- inp_fname      : String := "files/ngc-files/just-KSG.ngc";
   -- inp_fname      : String := "files/ngc-files/linuxcnc-logo.nc";
   
   -- TO ALLOW MULTIPLE HANDLES TO A SINGLE FILE
   inp_fform      : String := "shared=yes";   
   
   -- USET SET IDs FOR TRACING EXECUTIONS
   inp_fOwnID_00 : String := "ID: 00 MAIN";
   inp_fOwnID_01 : String := "ID: 01 PAFP";
   inp_fOwnID_02 : String := "ID: 02 PALFP";
   
     
-- ========================================================   
begin  -- FOR procedure main_xxx
   
   PADTS.dtstamp; ATIO.Put_Line ("STARTED: main Bismillah 3 times WRY");
   ATIO.New_Line;

   -- =====================================================
   -- EXECUTE OPEN FILE PAFOC - pkg-ada-file-open-close
   -- =====================================================
   -- PAFOC.exec_file_open (inp_fhandle_MAIN, inp_fmode, inp_fname, inp_fform, inp_fOwnID_00);
   
   -- =====================================================
   -- (1) EXECUTE PAFP - pkg-ada-file-properties
   -- =====================================================
   PAFP.exec_file_properties (inp_fmode, inp_fname_01, inp_fform, inp_fOwnID_01);
      
   -- =====================================================
   -- (2) EXECUTE PAFLP - pkg-ada-file-line-properties
   -- =====================================================
   PAFLP.exec_file_line_properties (inp_fmode, inp_fname_01, inp_fform, inp_fOwnID_02);
   
   -- =====================================================
   -- (3) EXECUTE PAFRL - pkg-ada-file-remove-lines
   -- =====================================================
   PAFRL.exec_remove_blank_lines (inp_fname_01, out_fname_01);
   
   -- ATIO.New_Line;
   ATIO.Put_Line("Running (3) ... PAFRL");
   PAFRL.exec_remove_lines_oncondition (inp_fname_02, out_fname_02, substr_condition_02); 
   
   -- exec_remove_lines_oncondition (inp_fname : in String; out_fname : in out String; pattern_substring : in String); 
   
   
   -- =====================================================
   -- (4) EXECUTE PAFTL - pkg-ada-file-trim-lines
   -- =====================================================
   
   
    -- =====================================================
   -- (5) EXECUTE PAFLT - pkg-ada-file-line-tokenize
   -- =====================================================
   
   
   
   
   -- =====================================================
   -- EXECUTE CLOSE FILE PAFOC - pkg-ada-file-open-close
   -- ===================================================== 
   -- PAFOC.exec_file_close (inp_fhandle_MAIN, inp_fform, inp_fOwnID_00);
        
   ATIO.New_Line;  
   PADTS.dtstamp; ATIO.Put_Line ("ENDED: main Alhamdulillah 3 times WRY");
-- ========================================================   
end testdriver_main_ada_file_processing;
-- ========================================================
