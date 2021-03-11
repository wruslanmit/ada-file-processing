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
-- NOTE: ADA LOOKS FOR THE CORRESPONDING .ads FILE
with pkg_ada_datetime_stamp;
with pkg_ada_file_open_close;
with pkg_ada_file_properties;
with pkg_ada_file_line_properties;
with pkg_ada_file_read_write;
with pkg_ada_file_remove_lines;
with pkg_ada_file_trim_lines;

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
   package PAFTL  renames pkg_ada_file_trim_lines;
   
   -- PACKAGE-WIDE VARIABLES
   -- ====================================================

   inp_fhandle_main : ATIO.File_Type; 
   inp_fhandle      : ATIO.File_Type;
   
   inp_fmode        : ATIO.File_Mode  := ATIO.In_File;
   out_fmode        : ATIO.File_Mode  := ATIO.Out_File;
   app_fmode        : ATIO.File_Mode  := ATIO.Append_File;
   
       
   -- MUST SELECT ONLY ONE FILE
   
   -- (1) FOR REMOVING BLANK LINES IN FILE   
   inp_fname_01        : String := "files/bismillah.ngc"; 
   out_fname_01        : String := "files/bismillah.ngc_after_blankline_removals.txt";
   
   -- (2) FOR REMOVING LINES CONTAINING SPECIFIC SUBSTR_CONDITION
   inp_fname_02        : String := "files/bismillah.ngc_after_blankline_removals.txt";
   
   -- DANGER: OnCondition can wipe all lines inside file meeting the set 
   -- condition. It must be used properly 
   -- substr_condition_02 : String := "(";  
   -- out_fname_02        : String := "files/bismillah.ngc_after_substr(()_line_removals.txt";
   
   -- (3) FOR TRIMMING LINES IN FILE (TRIM LEADING, TRAILING AND BOTH ENDS OF LINES) 
   inp_fname_03        : String := "files/bismillah.ngc_after_blankline_removals.txt";
   out_fname_031       : String := "files/bismillah.ngc_after_trimmed_lines_left.txt";
   out_fname_032       : String := "files/bismillah.ngc_after_trimmed_lines_right.txt";
   out_fname_033       : String := "files/bismillah.ngc_after_trimmed_lines_both.txt";
   
   -- EXAMPLE FILES THAT CAN BE USED IN THE FOLDER
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
   
   -- DANGER: OnCondition can wipe all lines in file if not used properly 
   -- PAFRL.exec_remove_lines_oncondition (inp_fname_02, out_fname_02, substr_condition_02); 
   
   -- =====================================================
   -- (4) EXECUTE PAFTL - pkg-ada-file-trim-lines
   -- =====================================================
   PAFTL.exec_file_trim_lines_right(inp_fname_03, out_fname_032);
   PAFTL.exec_file_trim_lines_left (inp_fname_03, out_fname_031);
   PAFTL.exec_file_trim_lines_both (inp_fname_03, out_fname_033);
   -- IF RUN BOTH TRIM (LEADING AND TRAILING) WHITESPACES
   -- NO NEED TO DO left AND right TRIMS. 
      
   -- =====================================================
   -- EXECUTE CLOSE FILE PAFOC - pkg-ada-file-open-close
   -- ===================================================== 
   -- PAFOC.exec_file_close (inp_fhandle_MAIN, inp_fform, inp_fOwnID_00);
        
   ATIO.New_Line;  
   PADTS.dtstamp; ATIO.Put_Line ("ENDED: main Alhamdulillah 3 times WRY");
-- ========================================================   
end testdriver_main_ada_file_processing;
-- ========================================================
