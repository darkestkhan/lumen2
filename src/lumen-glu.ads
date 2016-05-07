
-- Lumen.GLU -- Lumen's own thin OpenGL utilities bindings
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

-- Environment
with System;

with Lumen.GL;
use  Lumen.GL;

package Lumen.GLU is

   ---------------------------------------------------------------------------
   -- Build mipmaps
   function Build_1D_Mipmaps (Target     : in Enum;
                              Components : in Int;
                              Width      : in Int;
                              Format     : in Enum;
                              Data_Type  : in Enum;
                              Data       : in Pointer)
     return Int
     with Import => True, Convention => StdCall,
          External_Name => "gluBuild1DMipmaps";

   function Build_2D_Mipmaps (Target     : in Enum;
                              Components : in Int;
                              Width      : in Int;
                              Height     : in Int;
                              Format     : in Enum;
                              Data_Type  : in Enum;
                              Data       : in Pointer)
     return Int
     with Import => True, Convention => StdCall,
          External_Name => "gluBuild2DMipmaps";

   -- Projections
   procedure Ortho_2D (Left   : in Double;
                       Right  : in Double;
                       Bottom : in Double;
                       Top    : in Double)
     with Import => True, Convention => StdCall, External_Name => "gluOrtho2D";

   procedure Perspective (FOV_Y_Angle, Aspect, Z_Near, Z_Far : in Double)
     with Import => True, Convention => StdCall,
          External_Name => "gluPerspective";

   -- Quadrics
   type Quadric is new Pointer;

   function New_Quadric return Quadric
     with Import => True, Convention => StdCall,
          External_Name => "gluNewQuadric";

   procedure Delete_Quadric (Quad : in Quadric)
     with Import => True, Convention => StdCall,
          External_Name => "gluDeleteQuadric";

   procedure Quadric_Draw_Style (Quad : in Quadric;
                                 Draw : in Enum)
     with Import => True, Convention => StdCall,
          External_Name => "gluQuadricDrawStyle";

   procedure Quadric_Normals (Quad   : in Quadric;
                              Normal : in Enum)
     with Import => True, Convention => StdCall,
          External_Name => "gluQuadricNormals";

   procedure Quadric_Orientation (Quad        : in Quadric;
                                  Orientation : in Enum)
     with Import => True, Convention => StdCall,
          External_Name => "gluQuadricOrientation";

   procedure Quadric_Texture (Quad    : in Quadric;
                              Texture : in Bool)
     with Import => True, Convention => StdCall,
          External_Name => "gluQuadricTexture";

   -- Shapes
   procedure Cylinder (Quad   : in Quadric;
                       Base   : in Double;
                       Top    : in Double;
                       Height : in Double;
                       Slices : in Int;
                       Stacks : in Int)
     with Import => True, Convention => StdCall, External_Name => "gluCylinder";

   procedure Disk (Quad   : in Quadric;
                   Inner  : in Double;
                   Outer  : in Double;
                   Slices : in Int;
                   Loops  : in Int)
     with Import => True, Convention => StdCall, External_Name => "gluDisk";

   procedure Partial_Disk (Quad   : in Quadric;
                           Inner  : in Double;
                           Outer  : in Double;
                           Slices : in Int;
                           Loops  : in Int;
                           Start  : in Double;
                           Sweep  : in Double)
     with Import => True, Convention => StdCall,
          External_Name => "gluPartialDisk";

   procedure Sphere (Quad   : in Quadric;
                     Radius : in Double;
                     Slices : in Int;
                     Stacks : in Int)
     with Import => True, Convention => StdCall, External_Name => "gluSphere";

   ---------------------------------------------------------------------------

end Lumen.GLU;
