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
with pkg_ada_file_open_close;
with pkg_ada_file_properties;

-- ========================================================
procedure testdriver_main_ada_file_processing
-- ========================================================
--	with SPARK_Mode => on
is 
   -- RENAME STANDARD ADA PACKAGES FOR CONVENIENCE
   package ATIO   renames Ada.Text_IO;
   package ASU    renames Ada.Strings.Unbounded;  
      
   -- RENAME USER-DEFINED ADA PACKAGES FOR CONVENIENCE
   package PAFOC  renames pkg_ada_file_open_close;
   package PAFP   renames pkg_ada_file_properties;
   
   -- PACKAGE-WIDE VARIABLES
   -- ====================================================

   inp_fhandle : ATIO.File_Type; 
   inp_fmode   : ATIO.File_Mode;
   inp_fname   : String := "files/test_file.txt"; 
   inp_fform   : String := "shared=yes";   -- For file identification 
   
   -- FOR TRACING EXECUTIONS
   inp_fOwnID_00 : String := "ID: 00 main";
   inp_fOwnID_01 : String := "ID: 01 fproperties";
   
-- ========================================================   
begin  -- FOR procedure main_xxx
   
   ATIO.Put_Line ("STARTED: main Bismillah 3 times WRY");
   
   ATIO.New_Line;
   -- EXECUTE OPEN FILE
   -- inp_fhandle (Hidden by the system for security) - limited type 
   inp_fmode  := ATIO.In_File;
   ATIO.Put_Line("Running... PAFOC.exec_file_open (inp_fhandle, inp_fmode, " & inp_fname & ", " & inp_fform & ", " & inp_fOwnID_00 & ")");
   PAFOC.exec_file_open (inp_fhandle, inp_fmode, inp_fname, inp_fform, inp_fOwnID_00);
   ATIO.Put_Line("Completed: PAFOC.exec_file_open (inp_fhandle, inp_fmode, " & inp_fname & ", " & inp_fform & ", " & inp_fOwnID_00 & ")");
   
   ATIO.New_Line;
   -- EXECUTE DISPLAY FILE PROPERTIES 
   -- NOTE: (No inp_fhandle because user-own procedure)
   ATIO.Put_Line("Running... PAFP.exec_file_properties (inp_fmode, " & inp_fname & ", " & inp_fform & ", " & inp_fOwnID_01 & ")");
   PAFP.exec_file_properties (inp_fmode, inp_fname, inp_fform, inp_fOwnID_01);
   ATIO.Put_Line("Completed: PAFP.exec_file_properties (inp_fmode, " & inp_fname & ", " & inp_fform & ", " & inp_fOwnID_01 & ")");
   
   ATIO.New_Line;
   -- EXECUTE CLOSE FILE
   ATIO.Put_Line("Running... PAFOC.exec_file_close (inp_fhandle, " & inp_fform & ", " & inp_fOwnID_00 & ")");
   PAFOC.exec_file_close (inp_fhandle, inp_fform, inp_fOwnID_00);
   ATIO.Put_Line("Completed: PAFOC.exec_file_close (inp_fhandle, " & inp_fform & ", " & inp_fOwnID_00 & ")"); 
    
   ATIO.New_Line;  
   ATIO.Put_Line ("ENDED: main Alhamdulillah 3 times WRY");
-- ========================================================   
end testdriver_main_ada_file_processing;
-- ========================================================