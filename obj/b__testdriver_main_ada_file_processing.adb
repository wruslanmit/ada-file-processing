pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__testdriver_main_ada_file_processing.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__testdriver_main_ada_file_processing.adb");
pragma Suppress (Overflow_Check);
with Ada.Exceptions;

package body ada_main is

   E069 : Short_Integer; pragma Import (Ada, E069, "system__os_lib_E");
   E010 : Short_Integer; pragma Import (Ada, E010, "system__soft_links_E");
   E008 : Short_Integer; pragma Import (Ada, E008, "system__exception_table_E");
   E064 : Short_Integer; pragma Import (Ada, E064, "ada__io_exceptions_E");
   E033 : Short_Integer; pragma Import (Ada, E033, "ada__containers_E");
   E018 : Short_Integer; pragma Import (Ada, E018, "system__exceptions_E");
   E005 : Short_Integer; pragma Import (Ada, E005, "ada__strings_E");
   E051 : Short_Integer; pragma Import (Ada, E051, "ada__strings__maps_E");
   E055 : Short_Integer; pragma Import (Ada, E055, "ada__strings__maps__constants_E");
   E038 : Short_Integer; pragma Import (Ada, E038, "interfaces__c_E");
   E093 : Short_Integer; pragma Import (Ada, E093, "system__soft_links__initialize_E");
   E075 : Short_Integer; pragma Import (Ada, E075, "system__object_reader_E");
   E045 : Short_Integer; pragma Import (Ada, E045, "system__dwarf_lines_E");
   E032 : Short_Integer; pragma Import (Ada, E032, "system__traceback__symbolic_E");
   E214 : Short_Integer; pragma Import (Ada, E214, "ada__numerics_E");
   E101 : Short_Integer; pragma Import (Ada, E101, "ada__tags_E");
   E118 : Short_Integer; pragma Import (Ada, E118, "ada__streams_E");
   E135 : Short_Integer; pragma Import (Ada, E135, "system__file_control_block_E");
   E120 : Short_Integer; pragma Import (Ada, E120, "system__finalization_root_E");
   E116 : Short_Integer; pragma Import (Ada, E116, "ada__finalization_E");
   E134 : Short_Integer; pragma Import (Ada, E134, "system__file_io_E");
   E122 : Short_Integer; pragma Import (Ada, E122, "system__storage_pools_E");
   E113 : Short_Integer; pragma Import (Ada, E113, "system__finalization_masters_E");
   E111 : Short_Integer; pragma Import (Ada, E111, "system__storage_pools__subpools_E");
   E097 : Short_Integer; pragma Import (Ada, E097, "ada__strings__unbounded_E");
   E174 : Short_Integer; pragma Import (Ada, E174, "system__task_info_E");
   E168 : Short_Integer; pragma Import (Ada, E168, "system__task_primitives__operations_E");
   E139 : Short_Integer; pragma Import (Ada, E139, "ada__calendar_E");
   E145 : Short_Integer; pragma Import (Ada, E145, "ada__calendar__time_zones_E");
   E159 : Short_Integer; pragma Import (Ada, E159, "ada__real_time_E");
   E130 : Short_Integer; pragma Import (Ada, E130, "ada__text_io_E");
   E209 : Short_Integer; pragma Import (Ada, E209, "system__regexp_E");
   E204 : Short_Integer; pragma Import (Ada, E204, "ada__directories_E");
   E137 : Short_Integer; pragma Import (Ada, E137, "pkg_ada_datetime_stamp_E");
   E196 : Short_Integer; pragma Import (Ada, E196, "pkg_ada_file_open_close_E");
   E192 : Short_Integer; pragma Import (Ada, E192, "pkg_ada_file_line_properties_E");
   E202 : Short_Integer; pragma Import (Ada, E202, "pkg_ada_file_properties_E");
   E211 : Short_Integer; pragma Import (Ada, E211, "pkg_ada_file_read_write_E");
   E222 : Short_Integer; pragma Import (Ada, E222, "pkg_ada_file_remove_lines_E");

   Sec_Default_Sized_Stacks : array (1 .. 1) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      E204 := E204 - 1;
      declare
         procedure F1;
         pragma Import (Ada, F1, "ada__directories__finalize_spec");
      begin
         F1;
      end;
      E209 := E209 - 1;
      declare
         procedure F2;
         pragma Import (Ada, F2, "system__regexp__finalize_spec");
      begin
         F2;
      end;
      E130 := E130 - 1;
      declare
         procedure F3;
         pragma Import (Ada, F3, "ada__text_io__finalize_spec");
      begin
         F3;
      end;
      E097 := E097 - 1;
      declare
         procedure F4;
         pragma Import (Ada, F4, "ada__strings__unbounded__finalize_spec");
      begin
         F4;
      end;
      E111 := E111 - 1;
      declare
         procedure F5;
         pragma Import (Ada, F5, "system__storage_pools__subpools__finalize_spec");
      begin
         F5;
      end;
      E113 := E113 - 1;
      declare
         procedure F6;
         pragma Import (Ada, F6, "system__finalization_masters__finalize_spec");
      begin
         F6;
      end;
      declare
         procedure F7;
         pragma Import (Ada, F7, "system__file_io__finalize_body");
      begin
         E134 := E134 - 1;
         F7;
      end;
      declare
         procedure Reraise_Library_Exception_If_Any;
            pragma Import (Ada, Reraise_Library_Exception_If_Any, "__gnat_reraise_library_exception_if_any");
      begin
         Reraise_Library_Exception_If_Any;
      end;
   end finalize_library;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (C, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Default_Secondary_Stack_Size : System.Parameters.Size_Type;
      pragma Import (C, Default_Secondary_Stack_Size, "__gnat_default_ss_size");
      Leap_Seconds_Support : Integer;
      pragma Import (C, Leap_Seconds_Support, "__gl_leap_seconds_support");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
      Binder_Sec_Stacks_Count : Natural;
      pragma Import (Ada, Binder_Sec_Stacks_Count, "__gnat_binder_ss_count");
      Default_Sized_SS_Pool : System.Address;
      pragma Import (Ada, Default_Sized_SS_Pool, "__gnat_default_ss_pool");

   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;
      Leap_Seconds_Support := 0;

      ada_main'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 1;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;

      Runtime_Initialize (1);

      Finalize_Library_Objects := finalize_library'access;

      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E008 := E008 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E064 := E064 + 1;
      Ada.Containers'Elab_Spec;
      E033 := E033 + 1;
      System.Exceptions'Elab_Spec;
      E018 := E018 + 1;
      Ada.Strings'Elab_Spec;
      E005 := E005 + 1;
      System.Os_Lib'Elab_Body;
      E069 := E069 + 1;
      Ada.Strings.Maps'Elab_Spec;
      Ada.Strings.Maps.Constants'Elab_Spec;
      E055 := E055 + 1;
      Interfaces.C'Elab_Spec;
      System.Soft_Links.Initialize'Elab_Body;
      E093 := E093 + 1;
      E010 := E010 + 1;
      E051 := E051 + 1;
      E038 := E038 + 1;
      System.Object_Reader'Elab_Spec;
      System.Dwarf_Lines'Elab_Spec;
      E045 := E045 + 1;
      System.Traceback.Symbolic'Elab_Body;
      E032 := E032 + 1;
      E075 := E075 + 1;
      Ada.Numerics'Elab_Spec;
      E214 := E214 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Tags'Elab_Body;
      E101 := E101 + 1;
      Ada.Streams'Elab_Spec;
      E118 := E118 + 1;
      System.File_Control_Block'Elab_Spec;
      E135 := E135 + 1;
      System.Finalization_Root'Elab_Spec;
      E120 := E120 + 1;
      Ada.Finalization'Elab_Spec;
      E116 := E116 + 1;
      System.File_Io'Elab_Body;
      E134 := E134 + 1;
      System.Storage_Pools'Elab_Spec;
      E122 := E122 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E113 := E113 + 1;
      System.Storage_Pools.Subpools'Elab_Spec;
      E111 := E111 + 1;
      Ada.Strings.Unbounded'Elab_Spec;
      E097 := E097 + 1;
      System.Task_Info'Elab_Spec;
      E174 := E174 + 1;
      System.Task_Primitives.Operations'Elab_Body;
      E168 := E168 + 1;
      Ada.Calendar'Elab_Spec;
      Ada.Calendar'Elab_Body;
      E139 := E139 + 1;
      Ada.Calendar.Time_Zones'Elab_Spec;
      E145 := E145 + 1;
      Ada.Real_Time'Elab_Spec;
      Ada.Real_Time'Elab_Body;
      E159 := E159 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E130 := E130 + 1;
      System.Regexp'Elab_Spec;
      E209 := E209 + 1;
      Ada.Directories'Elab_Spec;
      Ada.Directories'Elab_Body;
      E204 := E204 + 1;
      pkg_ada_datetime_stamp'elab_body;
      E137 := E137 + 1;
      pkg_ada_file_open_close'elab_body;
      E196 := E196 + 1;
      pkg_ada_file_line_properties'elab_body;
      E192 := E192 + 1;
      pkg_ada_file_properties'elab_body;
      E202 := E202 + 1;
      pkg_ada_file_read_write'elab_body;
      E211 := E211 + 1;
      pkg_ada_file_remove_lines'elab_body;
      E222 := E222 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_testdriver_main_ada_file_processing");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      gnat_argc := argc;
      gnat_argv := argv;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   /home/wruslan/github-mit/ada-file-processing/obj/pkg_ada_datetime_stamp.o
   --   /home/wruslan/github-mit/ada-file-processing/obj/pkg_ada_file_open_close.o
   --   /home/wruslan/github-mit/ada-file-processing/obj/pkg_ada_file_line_properties.o
   --   /home/wruslan/github-mit/ada-file-processing/obj/pkg_ada_file_properties.o
   --   /home/wruslan/github-mit/ada-file-processing/obj/pkg_ada_file_read_write.o
   --   /home/wruslan/github-mit/ada-file-processing/obj/pkg_ada_file_remove_lines.o
   --   /home/wruslan/github-mit/ada-file-processing/obj/testdriver_main_ada_file_processing.o
   --   -L/home/wruslan/github-mit/ada-file-processing/obj/
   --   -L/home/wruslan/github-mit/ada-file-processing/obj/
   --   -L/usr/lib/gcc/x86_64-linux-gnu/9/adalib/
   --   -shared
   --   -lgnarl-9
   --   -lgnat-9
   --   -lpthread
   --   -lrt
   --   -ldl
--  END Object file/option list   

end ada_main;
