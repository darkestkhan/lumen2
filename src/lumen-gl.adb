
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
   function Get_String (Name : in Enum) return String
   is

      use type Interfaces.C.Strings.chars_ptr;

      function glGetString (Name : in Enum)
                           return Interfaces.C.Strings.chars_ptr
        with Import => True, Convention => StdCall,
             External_Name => "glGetString";

      Ptr : constant Interfaces.C.Strings.chars_ptr := glGetString (Name);

   begin  -- Get_String
      if Ptr = Interfaces.C.Strings.Null_Ptr then
         return "";
      else
         return Interfaces.C.Strings.Value (Ptr);
      end if;
   end Get_String;

   function Get_String (Name  : in Enum;
                        Index : in Int) return String
   is

      use type Interfaces.C.Strings.chars_ptr;

      function glGetStringi (Name  : in Enum;
                             Index : in Int)
                            return Interfaces.C.Strings.chars_ptr
        with Import => True, Convention => StdCall,
             External_Name => "glGetStringi";

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
   -- Shader variables
   function Get_Uniform_Location (Program : in UInt;
                                  Name    : in String
                                 ) return Int
   is
      C_Name : constant Interfaces.C.char_array := Interfaces.C.To_C (Name);

      function glGetUniformLocation (Program : in UInt;
                                     Name    : in Pointer
                                    ) return Int
        with Import => True, Convention => StdCall,
             External_Name => "glGetUniformLocation";

   begin  -- Get_Uniform_Location
      return glGetUniformLocation (Program, C_Name'Address);
   end Get_Uniform_Location;

   function Get_Attribute_Location (Program : in UInt;
                                    Name    : in String
                                   ) return Int
   is
      C_Name : Interfaces.C.char_array := Interfaces.C.To_C (Name);

      function glGetAttribLocation (Program : in UInt;
                                    Name    : in Pointer
                                   ) return Int
        with Import => True, Convention => StdCall,
             External_Name => "glGetAttribLocation";

   begin  -- Get_Attribute_Location
      return glGetAttribLocation (Program, C_Name'Address);
   end Get_Attribute_Location;

   ---------------------------------------------------------------------------

end Lumen.GL;
