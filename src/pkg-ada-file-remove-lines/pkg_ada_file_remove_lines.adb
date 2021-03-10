-- File   : pkg_ada_file_remove_lines.adb
-- Date   : Thu 25 Feb 2021 01:51:47 PM +08
-- Author : WRY wruslandr@gmail.com
-- ========================================================

-- ADA STANDARD PACKAGES
with Ada.Text_IO;
with Ada.Characters.Latin_1;
with Ada.Strings.Unbounded;   use Ada.Strings.Unbounded;
with Ada.Strings.Fixed;
with Ada.Real_Time;

-- WRY CREATED PACKAGES 
with pkg_ada_datetime_stamp;

-- ========================================================
package body pkg_ada_file_remove_lines
-- ========================================================
--   with SPARK_Mode => on
is

   package ATIO   renames Ada.Text_IO;
   package ASU    renames Ada.Strings.Unbounded;
   package ASF    renames Ada.Strings.Fixed;
   package ACL1   renames Ada.Characters.Latin_1;
   package ART    renames Ada.Real_Time;
   package PADTS  renames pkg_ada_datetime_stamp;
   
   -- FILE RELATED PACKAGE-WIDE GLOBAL VARIABLES
   -- =====================================================
   inp_fhandle : ATIO.File_Type; 
   inp_fmode   : ATIO.File_Mode := ATIO.In_File;
-- inp_fname   : String := already defined in procedure call
   
   out_fhandle : ATIO.File_Type;
   out_fmode   : ATIO.File_Mode := ATIO.Out_File;
-- out_fname   : String := already defined in procedure call   
   
   -- FOR REPORT FILE
   rep_fhandle  : ATIO.File_Type;
   rep_fmode    : ATIO.File_Mode := ATIO.Out_File; 
   rep_UBSfname : ASU.Unbounded_String; -- Initialization not needed
   
   inp_UBSlineStr : ASU.Unbounded_String; -- Initialization not needed
   
   -- NON-FILE PACKAGE-WIDE GLOBAL VARIABLEs
   -- =====================================================
   lineCount         : Integer := 999;
   cnt_lineRemoved   : Integer := 999;
   cnt_lineRemaining : Integer := 999;
   cnt_lineTotal     : Integer := 999;
   
   cur_UBSlineLength : Integer := 999;
   int_FirstIndexInString : Integer := 999; -- First index for non-blank in string
   cnt_lineBlank_BUT_WhiteSpace   : Integer := 999;  -- With white spaces
   cnt_lineBlank_NO_WhiteSpace    : Integer := 999;  -- Truly "Null" line
   cnt_lineNonBlank_NonWhiteSpace : Integer := 999;
           
   UBSTimeString : ASU.Unbounded_String;
   
   -- =====================================================
   procedure exec_remove_blank_lines (inp_fname : in String;
                                      out_fname : in String) 
   -- =====================================================
   -- with SPARK_Mode => on
   is
      
   begin
      -- CHECK INPUT AND OUTPUT FILES
      -- ATIO.Put_Line ("inp_fname: " & inp_fname);
      -- ATIO.Put_Line ("out_fname: " & out_fname);
      
      -- CHECK REPORT FILE NAME
      UBSTimeString := PADTS.get_time_stamp (ART.Clock); -- return AASU.Unbounded_String;
      
      rep_UBSfname := ASU.To_Unbounded_String(inp_fname) & ("_report_") 
                    & ASU.To_String (UBSTimeString) & (".txt");  
      -- ATIO.Put_Line ("rep_fname: " & ASU.To_String (rep_UBSfname));
      
      -- OPEN INPUT, OUTPUT AND REPORT FILES
      ATIO.Open   (inp_fhandle, ATIO.In_File,  inp_fname);
      ATIO.Create (out_fhandle, ATIO.Out_File, out_fname);
      ATIO.Create (rep_fhandle, ATIO.Out_File, ASU.To_String (rep_UBSfname));
      
      lineCount         := 0;
      cnt_lineRemoved   := 0;
      cnt_lineRemaining := 0;
           
      cur_UBSlineLength := 0;
      int_FirstIndexInString         := 0;
      cnt_lineBlank_BUT_WhiteSpace   := 0;
      cnt_lineBlank_NO_WhiteSpace    := 0;
      cnt_lineNonBlank_NonWhiteSpace := 0;
      
      -- =================================================
      -- RUN READ AND WRITE LOOP FOR BOTH INPUT/OUTPUT FILES
      -- ==================================================
      while not ATIO.End_Of_File (inp_fhandle) loop
         inp_UBSlineStr := ASU.To_Unbounded_String(ATIO.Get_Line (inp_fhandle));
         lineCount := lineCount + 1;
         
         -- GRAB BLANK LINES FROM INPUT FILE 
         -- USE CODE FROM pkg-ada-file-line-properties
         cur_UBSlineLength := ASU.Length (inp_UBSlineStr);
         int_FirstIndexInString := ASF.Index_Non_Blank(ASU.To_String(inp_UBSlineStr));
                 
         -- (1) BLANK LINE CONSISTING OF WHITE SPACES
         if (cur_UBSlineLength /= 0) and (int_FirstIndexInString = 0) then
            cnt_lineRemoved   := cnt_lineRemoved + 1;
            cnt_lineBlank_BUT_WhiteSpace := cnt_lineBlank_BUT_WhiteSpace + 1;
          
            -- Write to report file
            ATIO.Put (rep_fhandle, "LINENO: " & Integer'Image(lineCount));
            ATIO.Put (rep_fhandle, " REMOVED. Contained " & Integer'Image (cur_UBSlineLength) & " whitespaces.");
            ATIO.Put_Line (rep_fhandle, " LINESTR = " &  ASU.To_String (inp_UBSlineStr));
         
         -- (2) BLANK LINE WITHOUT WHIRE SPACES (Null STRING)
         elsif (cur_UBSlineLength = 0) and (int_FirstIndexInString = 0) then
            cnt_lineRemoved   := cnt_lineRemoved + 1;
            cnt_lineBlank_NO_WhiteSpace := cnt_lineBlank_NO_WhiteSpace + 1;
            
            -- Write to report file
            ATIO.Put (rep_fhandle, "LINENO: " & Integer'Image(lineCount));
            ATIO.Put (rep_fhandle, " REMOVED. Contained " & Integer'Image (cur_UBSlineLength) & " whitespaces.");
            ATIO.Put_Line (rep_fhandle, " LINESTR = " &  ASU.To_String (inp_UBSlineStr));
         
         -- (3) NON-BLANK USABLE LINES      
         else 
            -- Write to output file
            -- ============================================
            ATIO.Put_Line (out_fhandle, ASU.To_String (inp_UBSlineStr));
            cnt_lineRemaining := cnt_lineRemaining + 1;
            cnt_lineNonBlank_NonWhiteSpace := cnt_lineNonBlank_NonWhiteSpace + 1;
            
            -- Write to terminal (screen)
            -- ============================================
            -- ATIO.Set_Output (ATIO.Standard_Output);
            -- ATIO.Put_Line (ATIO.Standard_Output, ASU.To_String (inp_UBSlineStr)); 
            -- ATIO.Put_Line (ASU.To_String (inp_UBSlineStr)); 
                     
         end if;
                 
         -- ===============================================
         -- TO START PRINT DEBUGGING, UNCOMMENT THE LINES BELOW
         -- ATIO.Put ("LINENO: " & Integer'Image (lineCount) );
         -- if inp_UBSlineStr /= ASU.Null_Unbounded_String then
         --   ATIO.Put (" :NotNull  ");
         -- else 
         --   ATIO.Put (" :Null <== ");
         -- end if; 
         -- ATIO.Put (" LINELENGTH: " & Integer'Image (cur_UBSlineLength));
         -- ATIO.Put (" FIRSTINDEX: " & Natural'Image (int_FirstIndexInString));
         -- ATIO.Put_Line (" LINESTR: " & ASU.To_String (inp_UBSlineStr));
         
         -- END PRINT DEBUGGING
         -- ===============================================
         
      end loop;   
      -- ================================================== 
      cnt_lineTotal := lineCount;
      
      -- WRITE TO REPORT FILE
      ATIO.Set_Output (rep_fhandle);
      ATIO.New_Line;
      ATIO.Put_Line ("REPORT ON FILE BLANK LINE REMOVALS");
      ATIO.Put_Line ("   cnt_lineRemoved                = " & Integer'Image(cnt_lineRemoved));  
      ATIO.Put_Line ("   cnt_lineRemaining              = " & Integer'Image(cnt_lineRemaining));
      
      ATIO.Put_Line ("   cnt_lineBlank_BUT_WhiteSpace   = " & Integer'Image(cnt_lineBlank_BUT_WhiteSpace) & " (Blank lines with all white spaces) "); 
      ATIO.Put_Line ("   cnt_lineBlank_NO_WhiteSpace    = " & Integer'Image(cnt_lineBlank_NO_WhiteSpace) & " (Blank lines with no white spaces) "); 
      ATIO.Put_Line ("   cnt_lineNonBlank_NonWhiteSpace = " & Integer'Image(cnt_lineNonBlank_NonWhiteSpace) & " (Effective usable lines)"); 
      ATIO.Put_Line ("   Overall File cnt_lineTotal     = " & Integer'Image(cnt_lineTotal));
      ATIO.New_Line;
      ATIO.Put_Line ("inp_fname: " & inp_fname);
      ATIO.Put_Line ("out_fname: " & out_fname);
      ATIO.Put_Line ("rep_fname: " & ASU.To_String (rep_UBSfname));
      ATIO.New_Line;
      
      -- WRITE TO TERMINAL (SCREEN)
      ATIO.Set_Output (ATIO.Standard_Output);
      ATIO.New_Line;
      ATIO.Put_Line ("REPORT ON FILE BLANK LINE REMOVALS");
      ATIO.Put_Line ("   cnt_lineRemoved                = " & Integer'Image(cnt_lineRemoved));  
      ATIO.Put_Line ("   cnt_lineRemaining              = " & Integer'Image(cnt_lineRemaining));
      
      ATIO.Put_Line ("   cnt_lineBlank_BUT_WhiteSpace   = " & Integer'Image(cnt_lineBlank_BUT_WhiteSpace) & " (Blank lines with all white spaces) "); 
      ATIO.Put_Line ("   cnt_lineBlank_NO_WhiteSpace    = " & Integer'Image(cnt_lineBlank_NO_WhiteSpace) & " (Blank lines with no white spaces) "); 
      ATIO.Put_Line ("   cnt_lineNonBlank_NonWhiteSpace = " & Integer'Image(cnt_lineNonBlank_NonWhiteSpace) & " (Effective usable lines)"); 
      ATIO.Put_Line ("   Overall File cnt_lineTotal     = " & Integer'Image(cnt_lineTotal));
      ATIO.New_Line;
      ATIO.Put_Line ("inp_fname: " & inp_fname);
      ATIO.Put_Line ("out_fname: " & out_fname);
      ATIO.Put_Line ("rep_fname: " & ASU.To_String (rep_UBSfname));
      ATIO.New_Line;
      
      -- ==================================================
      -- CLOSE INPUT, OUTPUT AND REPORT FILES
      ATIO.Close (inp_fhandle);
      ATIO.Close (out_fhandle);
      ATIO.Close (rep_fhandle);
      -- Ensure finish file closing.

   end exec_remove_blank_lines;
   
   -- =====================================================
   procedure exec_remove_lines_oncondition (inp_fname : in String; 
                                            out_fname : in String; 
                                            substr_condition : in String)
   -- =====================================================
   -- with SPARK_Mode => on
   is
      
   begin
   
     null;
   end exec_remove_lines_oncondition;
-- =======================================================
begin
       null;
-- ========================================================
end pkg_ada_file_remove_lines;
-- ========================================================    
