-- File	 : pkg_ada_file_properties.adb
-- Date	 : Tue 09 Mar 2021 09:18:35 AM +08
-- Author: WRY wruslandr@gmail.com
-- ========================================================
-- REF: https://www.adaic.org/resources/add_content/standards/05rm/html/RM-A-16.html
-- Ada.Directories

-- ADA STANDARD PACKAGES
with Ada.Text_IO;
with Ada.Directories;  
with Ada.Calendar;
with Ada.Calendar.Formatting;
use  Ada.Calendar.Formatting;

-- USER CREATED ADA PACKAGES 
with pkg_ada_file_open_close;

-- ========================================================
package body pkg_ada_file_properties 
-- ========================================================
--   with SPARK_Mode => on
is

   package ATIO   renames Ada.Text_IO;
   package AD     renames Ada.Directories;
   package ACal   renames Ada.Calendar;
   package ACalF  renames Ada.Calendar.Formatting;
   
   package PAFOC renames pkg_ada_file_open_close;
   
   -- =======================================================
   -- TEMPLATE FOR GENERIC FILE VARIABLES
   -- =======================================================
   -- new filehandle possible with sharing
   inp_fhandle_PAFP  : ATIO.File_Type;   
   
       
   -- NOTE: inp_fhandel_01 will be obtained internally in this package
   -- =====================================================
   procedure exec_file_properties (inp_fmode  : in ATIO.File_Mode;
                                   inp_fname  : in String;
                                   inp_fform  : in String;
                                   inp_fOwnID : in String
                                  )
   -- =====================================================
   -- with SPARK_Mode => on
   is
      
   begin 
         
      -- NOTE CALL ANOTHER PACKAGE
      -- new filehandle possible with sharing because fform sharing=yes
      -- ATIO.Put_Line("Running (1.1) ... PAFOC.exec_file_open (inp_fhandle_PAFP, inp_fmode, " & inp_fname & ", " & inp_fform & ", " & inp_fOwnID & ")");
      PAFOC.exec_file_open (inp_fhandle_PAFP, inp_fmode, inp_fname, inp_fform, inp_fOwnID);
      -- ATIO.Put_Line("Completed (1.1) : PAFOC.exec_file_open (inp_fhandle_PAFP, inp_fmode, " & inp_fname & ", " & inp_fform & ", " & inp_fOwnID & ")");
      
      -- ATIO.New_Line;
      ATIO.Put_Line ("REPORT ON FILE PROPERTIES");
      ATIO.Put_Line ("   inp_fmode  = " & ATIO.File_Mode'Image (inp_fmode));
      ATIO.Put_Line ("   inp_fname  = " & inp_fname);
      ATIO.Put_Line ("   inp_fform  = " & inp_fform);
      ATIO.Put_Line ("   inp_fOwnID = " & inp_fOwnID);
      ATIO.Put_Line ("   File Size  = " & AD.File_Size'Image (AD.Size (inp_fname)) & " bytes");
      ATIO.Put_Line ("   Full_Name  = " & AD.Full_Name (inp_fname));
      ATIO.Put_Line ("   Extension  = " & AD.Extension (inp_fname));
      ATIO.Put ("   Modification_Time = "); 
      ATIO.Put_Line (ACALF.Image (AD.Modification_Time (inp_fname)));
      
   -- ATIO.Put ("File_Kind  = ");
   -- ATIO.Put_Line (AD.File_Kind'Image (AD.File_Kind (inp_fname)));
      -- ATIO.New_Line;
      
      -- NOTE CALL ANOTHER PACKAGE
      -- ATIO.Put_Line("Running (1.2) ... PAFOC.exec_file_close (inp_fhandle_PAFP, " & inp_fform & ", " & inp_fOwnID & ")");
      PAFOC.exec_file_close (inp_fhandle_PAFP, inp_fform, inp_fOwnID);
      -- ATIO.Put_Line("Completed (1.2) ... PAFOC.exec_file_close (inp_fhandle_PAFP, " & inp_fform & ", " & inp_fOwnID & ")");
      
   end exec_file_properties;
-- =======================================================   
begin  -- FOR PACKAGE BODY
  null;
-- ========================================================
end pkg_ada_file_properties;
-- ========================================================    
