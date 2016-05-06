
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

   procedure Tex_Parameter (Target : in Enum;
                           PName  : in Enum;
                           Param  : in Int) is
      procedure glTexParameteri (Target : in Enum;
                                 PName  : in Enum;
                                 Param  : in Int);
      pragma Import (StdCall, glTexParameteri, "glTexParameteri");
   begin  -- TexParameter
      glTexParameteri (Target, PName, Param);
   end Tex_Parameter;

   procedure Tex_Parameter (Target : in Enum;
                           PName  : in Enum;
                           Param  : in Float) is
      procedure glTexParameterf (Target : in Enum;
                                 PName  : in Enum;
                                 Param  : in Float);
      pragma Import (StdCall, glTexParameterf, "glTexParameterf");
   begin  -- TexParameter
      glTexParameterf (Target, PName, Param);
   end Tex_Parameter;

   -- Texture images
   procedure Tex_Image (Target          : in Enum;
                       Level           : in Int;
                       Internal_Format : in Enum;
                       Width           : in SizeI;
                       Border          : in Int;
                       Format          : in Enum;
                       Pixel_Type      : in Enum;
                       Pixels          : in System.Address) is
      procedure glTexImage1D (Target          : in Enum;
                              Level           : in Int;
                              Internal_Format : in Enum;
                              Width           : in SizeI;
                              Border          : in Int;
                              Format          : in Enum;
                              Pixel_Type      : in Enum;
                              Pixels          : in System.Address);
      pragma Import (StdCall, glTexImage1D, "glTexImage1D");
   begin  -- TexImage
      glTexImage1D (Target,
                    Level,
                    Internal_Format,
                    Width,
                    Border,
                    Format,
                    Pixel_Type,
                    Pixels);
   end Tex_Image;

   procedure Tex_Image (Target          : in Enum;
                       Level           : in Int;
                       Internal_Format : in Enum;
                       Width           : in SizeI;
                       Height          : in SizeI;
                       Border          : in Int;
                       Format          : in Enum;
                       Pixel_Type      : in Enum;
                       Pixels          : in System.Address) is
      procedure glTexImage2D (Target          : in Enum;
                              Level           : in Int;
                              Internal_Format : in Enum;
                              Width           : in SizeI;
                              Height          : in SizeI;
                              Border          : in Int;
                              Format          : in Enum;
                              Pixel_Type      : in Enum;
                              Pixels          : in System.Address);
      pragma Import (StdCall, glTexImage2D, "glTexImage2D");
   begin  -- TexImage
      glTexImage2D (Target,
                    Level,
                    Internal_Format,
                    Width,
                    Height,
                    Border,
                    Format,
                    Pixel_Type,
                    Pixels);
   end Tex_Image;

   procedure Tex_Sub_Image (Target      : in Enum;
                            Level      : in Int;
                            X_Offset   : in Int;
                            Y_Offset   : in Int;
                            Width      : in SizeI;
                            Height     : in SizeI;
                            Format     : in Enum;
                            Pixel_Type : in Enum;
                            Pixels     : in GL.Pointer) is
      procedure glTexSubImage2D (Target      : in Enum;
                                 Level      : in Int;
                                 X_Offset   : in Int;
                                 Y_Offset   : in Int;
                                 Width      : in SizeI;
                                 Height     : in SizeI;
                                 Format     : in Enum;
                                 Pixel_Type : in Enum;
                                 Pixels     : in GL.Pointer);
      pragma Import (StdCall, glTexSubImage2D, "glTexSubImage2D");
   begin
      glTexSubImage2D (Target,
                       Level,
                       X_Offset,
                       Y_Offset,
                       Width,
                       Height,
                       Format,
                       Pixel_Type,
                       Pixels);
   end Tex_Sub_Image;

--   procedure Tex_Image (Target          : in Enum;
--                       Level           : in Int;
--                       Internal_Format : in Int;
--                       Width           : in SizeI;
--                       Height          : in SizeI;
--                       Depth           : in SizeI;
--                       Border          : in Int;
--                       Format          : in Enum;
--                       Pixel_Type      : in Enum;
--                       Pixels          : in System.Address) is
--      procedure glTexImage3D (Target          : in Enum;
--                              Level           : in Int;
--                              Internal_Format : in Int;
--                              Width           : in SizeI;
--                              Height          : in SizeI;
--                              Depth           : in SizeI;
--                              Border          : in Int;
--                              Format          : in Enum;
--                              Pixel_Type      : in Enum;
--                              Pixels          : in System.Address);
--      pragma Import (StdCall, glTexImage3D, "glTexImage3D");
--   begin  -- TexImage
--      glTexImage3D (Target,
--                    Level,
--                    Internal_Format,
--                    Width,
--                    Height,
--                    Depth,
--                    Border,
--                    Format,
--                    Pixel_Type,
--                    Pixels);
--   end Tex_Image;

   ---------------------------------------------------------------------------

   procedure Map (Target : in Enum;
                  U1     : in Float;
                  U2     : in Float;
                  Stride : in Int;
                  Order  : in Int;
                  Points : in System.Address) is
      procedure glMap1f (Target : in Enum;
                         U1     : in Float;
                         U2     : in Float;
                         Stride : in Int;
                         Order  : in Int;
                         Points : in System.Address);
      pragma Import (StdCall, glMap1f, "glMap1f");
   begin  -- Map
      glMap1f (Target, U1, U2, Stride, Order, Points);
   end Map;

   procedure Map (Target : in Enum;
                  U1     : in Double;
                  U2     : in Double;
                  Stride : in Int;
                  Order  : in Int;
                  Points : in System.Address) is
      procedure glMap1d (Target : in Enum;
                         U1     : in Double;
                         U2     : in Double;
                         Stride : in Int;
                         Order  : in Int;
                         Points : in System.Address);
      pragma Import (StdCall, glMap1d, "glMap1d");
   begin  -- Map
      glMap1d (Target, U1, U2, Stride, Order, Points);
   end Map;

   procedure Map (Target  : in Enum;
                  U1      : in Float;
                  U2      : in Float;
                  UStride : in Int;
                  UOrder  : in Int;
                  V1      : in Float;
                  V2      : in Float;
                  VStride : in Int;
                  VOrder  : in Int;
                  Points  : in System.Address) is
      procedure glMap2f (Target  : in Enum;
                         U1      : in Float;
                         U2      : in Float;
                         UStride : in Int;
                         UOrder  : in Int;
                         V1      : in Float;
                         V2      : in Float;
                         VStride : in Int;
                         VOrder  : in Int;
                         Points : in System.Address);
      pragma Import (StdCall, glMap2f, "glMap2f");
   begin  -- Map
      glMap2f (Target,
               U1, U2, UStride, UOrder,
               V1, V2, VStride, VOrder,
               Points);
   end Map;

   procedure Map (Target  : in Enum;
                  U1      : in Double;
                  U2      : in Double;
                  UStride : in Int;
                  UOrder  : in Int;
                  V1      : in Double;
                  V2      : in Double;
                  VStride : in Int;
                  VOrder  : in Int;
                  Points  : in System.Address) is
      procedure glMap2d (Target  : in Enum;
                         U1      : in Double;
                         U2      : in Double;
                         UStride : in Int;
                         UOrder  : in Int;
                         V1      : in Double;
                         V2      : in Double;
                         VStride : in Int;
                         VOrder  : in Int;
                         Points : in System.Address);
      pragma Import (StdCall, glMap2d, "glMap2d");
   begin  -- Map
      glMap2d (Target,
               U1, U2, UStride, UOrder,
               V1, V2, VStride, VOrder,
               Points);
   end Map;

   procedure Map_Grid (Un : in Int;
                       U1 : in Float;
                       U2 : in Float) is
      procedure glMapGrid1f (Un : in Int;
                             U1 : in Float;
                             U2 : in Float);
      pragma Import (StdCall, glMapGrid1f, "glMapGrid1f");
   begin  -- Map_Grid
      glMapGrid1f (Un, U1, U2);
   end Map_Grid;

   procedure Map_Grid (Un : in Int;
                       U1 : in Double;
                       U2 : in Double) is
      procedure glMapGrid1d (Un : in Int;
                             U1 : in Double;
                             U2 : in Double);
      pragma Import (StdCall, glMapGrid1d, "glMapGrid1d");
   begin  -- Map_Grid
      glMapGrid1d (Un, U1, U2);
   end Map_Grid;

   procedure Map_Grid (Un : in Int;
                       U1 : in Float;
                       U2 : in Float;
                       Vn : in Int;
                       V1 : in Float;
                       V2 : in Float) is
      procedure glMapGrid2f (Un : in Int;
                             U1 : in Float;
                             U2 : in Float;
                             Vn : in Int;
                             V1 : in Float;
                             V2 : in Float);
      pragma Import (StdCall, glMapGrid2f, "glMapGrid2f");
   begin  -- Map_Grid
      glMapGrid2f (Un, U1, U2, Vn, V1, V2);
   end Map_Grid;

   procedure Map_Grid (Un : in Int;
                       U1 : in Double;
                       U2 : in Double;
                       Vn : in Int;
                       V1 : in Double;
                       V2 : in Double) is
      procedure glMapGrid2d (Un : in Int;
                             U1 : in Double;
                             U2 : in Double;
                             Vn : in Int;
                             V1 : in Double;
                             V2 : in Double);
      pragma Import (StdCall, glMapGrid2d, "glMapGrid2d");
   begin  -- Map_Grid
      glMapGrid2d (Un, U1, U2, Vn, V1, V2);
   end Map_Grid;

   procedure Eval_Point (I : Int) is
      procedure glEvalPoint1 (I : in Int);
      pragma Import (StdCall, glEvalPoint1, "glEvalPoint1");
   begin  -- Eval_Point
      glEvalPoint1 (I);
   end Eval_Point;

   procedure Eval_Point (I : in Int;
                         J : in Int) is
      procedure glEvalPoint2 (I : in Int;
                              J : in Int);
      pragma Import (StdCall, glEvalPoint2, "glEvalPoint2");
   begin  -- Eval_Point
      glEvalPoint2 (I, J);
   end Eval_Point;

   procedure Eval_Mesh (Mode : in Enum;
                        I1   : in Int;
                        I2   : in Int) is
      procedure glEvalMesh1 (Mode : in Enum;
                             I1   : in Int;
                             I2   : in Int);
      pragma Import (StdCall, glEvalMesh1, "glEvalMesh1");
   begin  -- Eval_Mesh
      glEvalMesh1 (Mode, I1, I2);
   end Eval_Mesh;

   procedure Eval_Mesh (Mode : in Enum;
                        I1   : in Int;
                        I2   : in Int;
                        J1   : in Int;
                        J2   : in Int) is
      procedure glEvalMesh2 (Mode : in Enum;
                             I1   : in Int;
                             I2   : in Int;
                             J1   : in Int;
                             J2   : in Int);
      pragma Import (StdCall, glEvalMesh2, "glEvalMesh2");
   begin  -- Eval_Mesh
      glEvalMesh2 (Mode, I1, I2, J1, J2);
   end Eval_Mesh;

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

   procedure Tex_Coord_Pointer (Size      : in SizeI;
                                Type_Of   : in Enum;
                                Stride    : in SizeI;
                                Offset    : in SizeI)
   is
      procedure glTexCoordPointer (Size      : in SizeI;
                                   Type_Of   : in Enum;
                                   Stride    : in SizeI;
                                   Offset    : in SizeI);
      pragma Import (StdCall, glTexCoordPointer, "glTexCoordPointer");
   begin
      glTexCoordPointer (Size, Type_Of, Stride, Offset);
   end Tex_Coord_Pointer;

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
