
-- Lumen.GL -- Lumen's own thin OpenGL bindings
--
-- Chip Richards, NiEstu, Phoenix AZ, Summer 2010

-- This code is covered by the ISC License:
--
-- Copyright © 2010, NiEstu
--
-- Permission to use, copy, modify, and/or distribute this software for any
-- purpose with or without fee is hereby granted, provided that the above
-- copyright notice and this permission notice appear in all copies.
--
-- The software is provided "as is" and the author disclaims all warranties
-- with regard to this software including all implied warranties of
-- merchantability and fitness. In no event shall the author be liable for any
-- special, direct, indirect, or consequential damages or any damages
-- whatsoever resulting from loss of use, data or profits, whether in an
-- action of contract, negligence or other tortious action, arising out of or
-- in connection with the use or performance of this software.

with Interfaces.C.Strings;

package body Lumen.GL is

   ---------------------------------------------------------------------------

   -- Misc stuff
   function Get_String (Name : Enum) return String is

      use type Interfaces.C.Strings.chars_ptr;

      function glGetString (Name : Enum) return Interfaces.C.Strings.chars_ptr;
      pragma Import (StdCall, glGetString, "glGetString");

      Ptr : constant Interfaces.C.Strings.chars_ptr := glGetString (Name);

   begin  -- Get_String
      if Ptr = Interfaces.C.Strings.Null_Ptr then
         return "";
      else
         return Interfaces.C.Strings.Value (Ptr);
      end if;
   end Get_String;

   function Get_String (Name  : Enum;
                        Index : Int) return String is

      use type Interfaces.C.Strings.chars_ptr;

      function glGetStringi (Name : Enum;
                             Index : Int) return Interfaces.C.Strings.chars_ptr;
      pragma Import (StdCall, glGetStringi, "glGetStringi");

      Ptr : constant Interfaces.C.Strings.chars_ptr :=
         glGetStringi (Name, Index);

   begin  -- Get_String
      if Ptr = Interfaces.C.Strings.Null_Ptr then
         return "";
      else
         return Interfaces.C.Strings.Value (Ptr);
      end if;
   end Get_String;

   ---------------------------------------------------------------------------

   procedure Vertex_Pointer (Size : in SizeI;
                             Element_Type : in Enum;
                             Stride : in SizeI;
                             Offset : in SizeI) is
      procedure glVertexPointer (Size : in SizeI;
                                 Element_Type : in Enum;
                                 Stride : in SizeI;
                                 Offset : in SizeI);
      pragma Import (StdCall, glVertexPointer, "glVertexPointer");
   begin
      glVertexPointer (Size, Element_Type, Stride, Offset);
   end Vertex_Pointer;

   ---------------------------------------------------------------------------

   -- Shader variables
   function Get_Uniform_Location (Program : UInt;   Name : String) return Int is
      C_Name : Interfaces.C.char_array := Interfaces.C.To_C (Name);

      function glGetUniformLocation (Program : UInt;
                                     Name : Pointer) return Int;
      pragma Import (StdCall, glGetUniformLocation, "glGetUniformLocation");

   begin  -- Get_Uniform_Location
      return glGetUniformLocation (Program, C_Name'Address);
   end Get_Uniform_Location;

   procedure Uniform (Location : in Int;
                      V0       : in Float) is
      procedure glUniform1f (Location : in Int;
                             V0       : in Float);
      pragma Import (StdCall, glUniform1f, "glUniform1f");
   begin  -- Uniform
      glUniform1f (Location, V0);
   end Uniform;

   procedure Uniform (Location : in Int;
                      V0       : in Float;
                      V1       : in Float) is
      procedure glUniform2f (Location : in Int;
                             V0       : in Float;
                             V1       : in Float);
      pragma Import (StdCall, glUniform2f, "glUniform2f");
   begin  -- Uniform
      glUniform2f (Location, V0, V1);
   end Uniform;

   procedure Uniform (Location : in Int;
                      V0       : in Float;
                      V1       : in Float;
                      V2       : in Float) is
      procedure glUniform3f (Location : in Int;
                             V0       : in Float;
                             V1       : in Float;
                             V2       : in Float);
      pragma Import (StdCall, glUniform3f, "glUniform3f");
   begin  -- Uniform
      glUniform3f (Location, V0, V1, V2);
   end Uniform;

   procedure Uniform (Location : in Int;
                      V0       : in Float;
                      V1       : in Float;
                      V2       : in Float;
                      V3       : in Float) is
      procedure glUniform4f (Location : in Int;
                             V0       : in Float;
                             V1       : in Float;
                             V2       : in Float;
                             V3       : in Float);
      pragma Import (StdCall, glUniform4f, "glUniform4f");
   begin  -- Uniform
      glUniform4f (Location, V0, V1, V2, V3);
   end Uniform;

   procedure Uniform (Location : in Int;
                      V0       : in Int) is
      procedure glUniform1i (Location : in Int;
                             V0       : in Int);
      pragma Import (StdCall, glUniform1i, "glUniform1i");
   begin  -- Uniform
      glUniform1i (Location, V0);
   end Uniform;

   procedure Uniform (Location : in Int;
                      V0       : in Int;
                      V1       : in Int) is
      procedure glUniform2i (Location : in Int;
                             V0       : in Int;
                             V1       : in Int);
      pragma Import (StdCall, glUniform2i, "glUniform2i");
   begin  -- Uniform
      glUniform2i (Location, V0, V1);
   end Uniform;

   procedure Uniform (Location : in Int;
                      V0       : in Int;
                      V1       : in Int;
                      V2       : in Int) is
      procedure glUniform3i (Location : in Int;
                             V0       : in Int;
                             V1       : in Int;
                             V2       : in Int);
      pragma Import (StdCall, glUniform3i, "glUniform3i");
   begin  -- Uniform
      glUniform3i (Location, V0, V1, V2);
   end Uniform;

   procedure Uniform (Location : in Int;
                      V0       : in Int;
                      V1       : in Int;
                      V2       : in Int;
                      V3       : in Int) is
      procedure glUniform4i (Location : in Int;
                             V0       : in Int;
                             V1       : in Int;
                             V2       : in Int;
                             V3       : in Int);
      pragma Import (StdCall, glUniform4i, "glUniform4i");
   begin  -- Uniform
      glUniform4i (Location, V0, V1, V2, V3);
   end Uniform;

   procedure Uniform (Location : in Int;
                      V0       : in UInt) is
      procedure glUniform1ui (Location : in Int;
                              V0       : in UInt);
      pragma Import (StdCall, glUniform1ui, "glUniform1ui");
   begin  -- Uniform
      glUniform1ui (Location, V0);
   end Uniform;

   procedure Uniform (Location : in Int;
                      V0       : in UInt;
                      V1       : in UInt) is
      procedure glUniform2ui (Location : in Int;
                              V0       : in UInt;
                              V1       : in UInt);
      pragma Import (StdCall, glUniform2ui, "glUniform2ui");
   begin  -- Uniform
      glUniform2ui (Location, V0, V1);
   end Uniform;

   procedure Uniform (Location : in Int;
                      V0       : in UInt;
                      V1       : in UInt;
                      V2       : in UInt) is
      procedure glUniform3ui (Location : in Int;
                              V0       : in UInt;
                              V1       : in UInt;
                              V2       : in UInt);
      pragma Import (StdCall, glUniform3ui, "glUniform3ui");
   begin  -- Uniform
      glUniform3ui (Location, V0, V1, V2);
   end Uniform;

   procedure Uniform (Location : in Int;
                      V0       : in UInt;
                      V1       : in UInt;
                      V2       : in UInt;
                      V3       : in UInt) is
      procedure glUniform4ui (Location : in Int;
                              V0       : in UInt;
                              V1       : in UInt;
                              V2       : in UInt;
                              V3       : in UInt);
      pragma Import (StdCall, glUniform4ui, "glUniform4ui");
   begin  -- Uniform
      glUniform4ui (Location, V0, V1, V2, V3);
   end Uniform;

   procedure Uniform (Location  : in Int;
                      Count     : in SizeI;
                      Transpose : in Bool;
                      Value     : in Float_Matrix) is
      procedure glUniformMatrix4fv (Location  : in Int;
                                    Count     : in SizeI;
                                    Transpose : in Bool;
                                    Value     : in Pointer);
      pragma Import (StdCall, glUniformMatrix4fv, "glUniformMatrix4fv");
   begin
      glUniformMatrix4fv (Location, Count, Transpose, Value'Address);
   end Uniform;

   function Get_Attribute_Location (Program : UInt;
                                    Name : String) return Int is
      C_Name : Interfaces.C.char_array := Interfaces.C.To_C (Name);

      function glGetAttribLocation (Program : UInt; Name : Pointer) return Int;
      pragma Import (StdCall, glGetAttribLocation, "glGetAttribLocation");

   begin  -- Get_Attribute_Location
      return glGetAttribLocation (Program, C_Name'Address);
   end Get_Attribute_Location;

   procedure Vertex_Attrib (Index : in UInt;
                            X     : in Float) is
      procedure glVertexAttrib1f (Index : in UInt;
                                  X     : in Float);
      pragma Import (StdCall, glVertexAttrib1f, "glVertexAttrib1f");
   begin
      glVertexAttrib1f (Index, X);
   end Vertex_Attrib;

   procedure Vertex_Attrib (Index : in UInt;
                            X     : in Float;
                            Y     : in Float) is
      procedure glVertexAttrib2f (Index : in UInt;
                                  X     : in Float;
                                  Y     : in Float);
      pragma Import (StdCall, glVertexAttrib2f, "glVertexAttrib2f");
   begin
      glVertexAttrib2f (Index, X, Y);
   end Vertex_Attrib;

   procedure Vertex_Attrib (Index : in UInt;
                            X     : in Float;
                            Y     : in Float;
                            Z     : in Float) is
      procedure glVertexAttrib3f (Index : in UInt;
                                  X     : in Float;
                                  Y     : in Float;
                                  Z     : in Float);
      pragma Import (StdCall, glVertexAttrib3f, "glVertexAttrib3f");
   begin
      glVertexAttrib3f (Index, X, Y, Z);
   end Vertex_Attrib;

   procedure Vertex_Attrib (Index : in UInt;
                            X     : in Float;
                            Y     : in Float;
                            Z     : in Float;
                            W     : in Float) is
      procedure glVertexAttrib4f (Index : in UInt;
                                  X     : in Float;
                                  Y     : in Float;
                                  Z     : in Float;
                                  W     : in Float);
      pragma Import (StdCall, glVertexAttrib4f, "glVertexAttrib4f");
   begin
      glVertexAttrib4f (Index, X, Y, Z, W);
   end  Vertex_Attrib;

   procedure Get_Double (Pname  : in Enum;
                         Params : out Double_Matrix)
   is
      procedure glGetDoublev (Pname  : in Enum;
                              Params : in Pointer);
      pragma Import (StdCall, glGetDoublev, "glGetDoublev");
   begin
      glGetDoublev (Pname, Params'Address);
   end Get_Double;

   ---------------------------------------------------------------------------

end Lumen.GL;
