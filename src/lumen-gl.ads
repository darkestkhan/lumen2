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

-- Environment
with System;

with Lumen.Binary;

package Lumen.GL is

   ---------------------------------------------------------------------------

   -- New names for old types
   subtype Bitfield is Binary.Word;
   subtype Bool     is Binary.Byte;
   subtype Byte     is Binary.S_Byte;
   subtype ClampD   is Long_Float range 0.0 .. 1.0;
   subtype ClampF   is Float range 0.0 .. 1.0;
   subtype Double   is Long_Float;
   subtype Int      is Integer;
   subtype Short    is Short_Integer;
   subtype SizeI    is Integer;
   subtype UByte    is Binary.Byte;
   subtype UInt     is Binary.Word;
   subtype UShort   is Binary.Short;
   subtype Pointer  is System.Address;

   -- Try to bring a touch of order to the GLenum mess
   subtype Enum is Binary.Word;

   -- Types added by Lumen.GL
   type Bools     is array (Positive range <>) of Bool;
   type Bytes     is array (Positive range <>) of Byte;
   type Bytes_1   is array (1 .. 1) of Byte;
   type Bytes_2   is array (1 .. 2) of Byte;
   type Bytes_3   is array (1 .. 3) of Byte;
   type Bytes_4   is array (1 .. 4) of Byte;
   type Shorts    is array (Positive range <>) of Short;
   type Shorts_1  is array (1 .. 1) of Short;
   type Shorts_2  is array (1 .. 2) of Short;
   type Shorts_3  is array (1 .. 3) of Short;
   type Shorts_4  is array (1 .. 4) of Short;
   type Ints      is array (Positive range <>) of Int;
   type Ints_1    is array (1 .. 1) of Int;
   type Ints_2    is array (1 .. 2) of Int;
   type Ints_3    is array (1 .. 3) of Int;
   type Ints_4    is array (1 .. 4) of Int;
   type Floats    is array (Positive range <>) of Float;
   type Floats_1  is array (1 .. 1) of Float;
   type Floats_2  is array (1 .. 2) of Float;
   type Floats_3  is array (1 .. 3) of Float;
   type Floats_4  is array (1 .. 4) of Float;
   type Doubles   is array (Positive range <>) of Double;
   type Doubles_1 is array (1 .. 1) of Double;
   type Doubles_2 is array (1 .. 2) of Double;
   type Doubles_3 is array (1 .. 3) of Double;
   type Doubles_4 is array (1 .. 4) of Double;
   type UBytes    is array (Positive range <>) of UByte;
   type UBytes_1  is array (1 .. 1) of UByte;
   type UBytes_2  is array (1 .. 2) of UByte;
   type UBytes_3  is array (1 .. 3) of UByte;
   type UBytes_4  is array (1 .. 4) of UByte;
   type UShorts   is array (Positive range <>) of UShort;
   type UShorts_1 is array (1 .. 1) of UShort;
   type UShorts_2 is array (1 .. 2) of UShort;
   type UShorts_3 is array (1 .. 3) of UShort;
   type UShorts_4 is array (1 .. 4) of UShort;
   type UInts     is array (Positive range <>) of UInt;
   type UInts_1   is array (1 .. 1) of UInt;
   type UInts_2   is array (1 .. 2) of UInt;
   type UInts_3   is array (1 .. 3) of UInt;
   type UInts_4   is array (1 .. 4) of UInt;
   type Float_Matrix  is array (1 .. 4, 1 .. 4) of Float;
   type Double_Matrix is array (1 .. 4, 1 .. 4) of Double;
   type ClampFs   is array (Positive range <>) of ClampF;
   type ClampDs   is array (Positive range <>) of ClampD;

   -- Useful value
   Null_Pointer : Pointer := System.Null_Address;

   ---------------------------------------------------------------------------
   -- "Enumeration" constants

   -- OpenGL 1.0
   -- Boolean Values
   GL_FALSE                                    : constant Bool := 16#0#;
   GL_TRUE                                     : constant Bool := 16#1#;

   GL_VERSION_1_1                              : constant Enum := 1;
   GL_VERSION_1_2                              : constant Enum := 1;
   GL_VERSION_1_3                              : constant Enum := 1;
   GL_ARB_imaging                              : constant Enum := 1;

   -- Date types
   GL_BYTE                                     : constant Enum := 16#1400#;
   GL_UNSIGNED_BYTE                            : constant Enum := 16#1401#;
   GL_SHORT                                    : constant Enum := 16#1402#;
   GL_UNSIGNED_SHORT                           : constant Enum := 16#1403#;
   GL_INT                                      : constant Enum := 16#1404#;
   GL_UNSIGNED_INT                             : constant Enum := 16#1405#;
   GL_FLOAT                                    : constant Enum := 16#1406#;
   GL_2_BYTES                                  : constant Enum := 16#1407#;
   GL_3_BYTES                                  : constant Enum := 16#1408#;
   GL_4_BYTES                                  : constant Enum := 16#1409#;
   GL_DOUBLE                                   : constant Enum := 16#140A#;

   -- Primitives
   GL_POINTS                                   : constant Enum := 16#0#;
   GL_LINES                                    : constant Enum := 16#1#;
   GL_LINE_LOOP                                : constant Enum := 16#2#;
   GL_LINE_STRIP                               : constant Enum := 16#3#;
   GL_TRIANGLES                                : constant Enum := 16#4#;
   GL_TRIANGLE_STRIP                           : constant Enum := 16#5#;
   GL_TRIANGLE_FAN                             : constant Enum := 16#6#;
   GL_QUADS                                    : constant Enum := 16#7#;
   GL_QUAD_STRIP                               : constant Enum := 16#8#;
   GL_POLYGON                                  : constant Enum := 16#9#;

   -- Vertex arrays
   GL_VERTEX_ARRAY                             : constant Enum := 16#8074#;
   GL_NORMAL_ARRAY                             : constant Enum := 16#8075#;
   GL_COLOR_ARRAY                              : constant Enum := 16#8076#;
   GL_INDEX_ARRAY                              : constant Enum := 16#8077#;
   GL_TEXTURE_COORD_ARRAY                      : constant Enum := 16#8078#;
   GL_EDGE_FLAG_ARRAY                          : constant Enum := 16#8079#;
   GL_VERTEX_ARRAY_SIZE                        : constant Enum := 16#807A#;
   GL_VERTEX_ARRAY_TYPE                        : constant Enum := 16#807B#;
   GL_VERTEX_ARRAY_STRIDE                      : constant Enum := 16#807C#;
   GL_NORMAL_ARRAY_TYPE                        : constant Enum := 16#807E#;
   GL_NORMAL_ARRAY_STRIDE                      : constant Enum := 16#807F#;
   GL_COLOR_ARRAY_SIZE                         : constant Enum := 16#8081#;
   GL_COLOR_ARRAY_TYPE                         : constant Enum := 16#8082#;
   GL_COLOR_ARRAY_STRIDE                       : constant Enum := 16#8083#;
   GL_INDEX_ARRAY_TYPE                         : constant Enum := 16#8085#;
   GL_INDEX_ARRAY_STRIDE                       : constant Enum := 16#8086#;
   GL_TEXTURE_COORD_ARRAY_SIZE                 : constant Enum := 16#8088#;
   GL_TEXTURE_COORD_ARRAY_TYPE                 : constant Enum := 16#8089#;
   GL_TEXTURE_COORD_ARRAY_STRIDE               : constant Enum := 16#808A#;
   GL_EDGE_FLAG_ARRAY_STRIDE                   : constant Enum := 16#808C#;
   GL_VERTEX_ARRAY_POINTER                     : constant Enum := 16#808E#;
   GL_NORMAL_ARRAY_POINTER                     : constant Enum := 16#808F#;
   GL_COLOR_ARRAY_POINTER                      : constant Enum := 16#8090#;
   GL_INDEX_ARRAY_POINTER                      : constant Enum := 16#8091#;
   GL_TEXTURE_COORD_ARRAY_POINTER              : constant Enum := 16#8092#;
   GL_EDGE_FLAG_ARRAY_POINTER                  : constant Enum := 16#8093#;
   GL_V2F                                      : constant Enum := 16#2A20#;
   GL_V3F                                      : constant Enum := 16#2A21#;
   GL_C4UB_V2F                                 : constant Enum := 16#2A22#;
   GL_C4UB_V3F                                 : constant Enum := 16#2A23#;
   GL_C3F_V3F                                  : constant Enum := 16#2A24#;
   GL_N3F_V3F                                  : constant Enum := 16#2A25#;
   GL_C4F_N3F_V3F                              : constant Enum := 16#2A26#;
   GL_T2F_V3F                                  : constant Enum := 16#2A27#;
   GL_T4F_V4F                                  : constant Enum := 16#2A28#;
   GL_T2F_C4UB_V3F                             : constant Enum := 16#2A29#;
   GL_T2F_C3F_V3F                              : constant Enum := 16#2A2A#;
   GL_T2F_N3F_V3F                              : constant Enum := 16#2A2B#;
   GL_T2F_C4F_N3F_V3F                          : constant Enum := 16#2A2C#;
   GL_T4F_C4F_N3F_V4F                          : constant Enum := 16#2A2D#;

   -- Matrix mode
   GL_MATRIX_MODE                              : constant Enum := 16#BA0#;
   GL_MODELVIEW                                : constant Enum := 16#1700#;
   GL_PROJECTION                               : constant Enum := 16#1701#;
   GL_TEXTURE                                  : constant Enum := 16#1702#;

   -- Points
   GL_POINT_SMOOTH                             : constant Enum := 16#B10#;
   GL_POINT_SIZE                               : constant Enum := 16#B11#;
   GL_POINT_SIZE_GRANULARITY                   : constant Enum := 16#B13#;
   GL_POINT_SIZE_RANGE                         : constant Enum := 16#B12#;

   -- Lines
   GL_LINE_SMOOTH                              : constant Enum := 16#B20#;
   GL_LINE_STIPPLE                             : constant Enum := 16#B24#;
   GL_LINE_STIPPLE_PATTERN                     : constant Enum := 16#B25#;
   GL_LINE_STIPPLE_REPEAT                      : constant Enum := 16#B26#;
   GL_LINE_WIDTH                               : constant Enum := 16#B21#;
   GL_LINE_WIDTH_GRANULARITY                   : constant Enum := 16#B23#;
   GL_LINE_WIDTH_RANGE                         : constant Enum := 16#B22#;

   -- Polygons
   GL_POINT                                    : constant Enum := 16#1B00#;
   GL_LINE                                     : constant Enum := 16#1B01#;
   GL_FILL                                     : constant Enum := 16#1B02#;
   GL_CW                                       : constant Enum := 16#900#;
   GL_CCW                                      : constant Enum := 16#901#;
   GL_FRONT                                    : constant Enum := 16#404#;
   GL_BACK                                     : constant Enum := 16#405#;
   GL_POLYGON_MODE                             : constant Enum := 16#B40#;
   GL_POLYGON_SMOOTH                           : constant Enum := 16#B41#;
   GL_POLYGON_STIPPLE                          : constant Enum := 16#B42#;
   GL_EDGE_FLAG                                : constant Enum := 16#B43#;
   GL_CULL_FACE                                : constant Enum := 16#B44#;
   GL_CULL_FACE_MODE                           : constant Enum := 16#B45#;
   GL_FRONT_FACE                               : constant Enum := 16#B46#;
   GL_POLYGON_OFFSET_FACTOR                    : constant Enum := 16#8038#;
   GL_POLYGON_OFFSET_UNITS                     : constant Enum := 16#2A00#;
   GL_POLYGON_OFFSET_POINT                     : constant Enum := 16#2A01#;
   GL_POLYGON_OFFSET_LINE                      : constant Enum := 16#2A02#;
   GL_POLYGON_OFFSET_FILL                      : constant Enum := 16#8037#;

   -- Display lists
   GL_COMPILE                                  : constant Enum := 16#1300#;
   GL_COMPILE_AND_EXECUTE                      : constant Enum := 16#1301#;
   GL_LIST_BASE                                : constant Enum := 16#B32#;
   GL_LIST_INDEX                               : constant Enum := 16#B33#;
   GL_LIST_MODE                                : constant Enum := 16#B30#;

   -- Depth buffer
   GL_NEVER                                    : constant Enum := 16#200#;
   GL_LESS                                     : constant Enum := 16#201#;
   GL_EQUAL                                    : constant Enum := 16#202#;
   GL_LEQUAL                                   : constant Enum := 16#203#;
   GL_GREATER                                  : constant Enum := 16#204#;
   GL_NOTEQUAL                                 : constant Enum := 16#205#;
   GL_GEQUAL                                   : constant Enum := 16#206#;
   GL_ALWAYS                                   : constant Enum := 16#207#;
   GL_DEPTH_TEST                               : constant Enum := 16#B71#;
   GL_DEPTH_BITS                               : constant Enum := 16#D56#;
   GL_DEPTH_CLEAR_VALUE                        : constant Enum := 16#B73#;
   GL_DEPTH_FUNC                               : constant Enum := 16#B74#;
   GL_DEPTH_RANGE                              : constant Enum := 16#B70#;
   GL_DEPTH_WRITEMASK                          : constant Enum := 16#B72#;
   GL_DEPTH_COMPONENT                          : constant Enum := 16#1902#;

   -- Lighting
   GL_LIGHTING                                 : constant Enum := 16#B50#;
   GL_LIGHT0                                   : constant Enum := 16#4000#;
   GL_LIGHT1                                   : constant Enum := 16#4001#;
   GL_LIGHT2                                   : constant Enum := 16#4002#;
   GL_LIGHT3                                   : constant Enum := 16#4003#;
   GL_LIGHT4                                   : constant Enum := 16#4004#;
   GL_LIGHT5                                   : constant Enum := 16#4005#;
   GL_LIGHT6                                   : constant Enum := 16#4006#;
   GL_LIGHT7                                   : constant Enum := 16#4007#;
   GL_SPOT_EXPONENT                            : constant Enum := 16#1205#;
   GL_SPOT_CUTOFF                              : constant Enum := 16#1206#;
   GL_CONSTANT_ATTENUATION                     : constant Enum := 16#1207#;
   GL_LINEAR_ATTENUATION                       : constant Enum := 16#1208#;
   GL_QUADRATIC_ATTENUATION                    : constant Enum := 16#1209#;
   GL_AMBIENT                                  : constant Enum := 16#1200#;
   GL_DIFFUSE                                  : constant Enum := 16#1201#;
   GL_SPECULAR                                 : constant Enum := 16#1202#;
   GL_SHININESS                                : constant Enum := 16#1601#;
   GL_EMISSION                                 : constant Enum := 16#1600#;
   GL_POSITION                                 : constant Enum := 16#1203#;
   GL_SPOT_DIRECTION                           : constant Enum := 16#1204#;
   GL_AMBIENT_AND_DIFFUSE                      : constant Enum := 16#1602#;
   GL_COLOR_INDEXES                            : constant Enum := 16#1603#;
   GL_LIGHT_MODEL_TWO_SIDE                     : constant Enum := 16#B52#;
   GL_LIGHT_MODEL_LOCAL_VIEWER                 : constant Enum := 16#B51#;
   GL_LIGHT_MODEL_AMBIENT                      : constant Enum := 16#B53#;
   GL_FRONT_AND_BACK                           : constant Enum := 16#408#;
   GL_SHADE_MODEL                              : constant Enum := 16#B54#;
   GL_FLAT                                     : constant Enum := 16#1D00#;
   GL_SMOOTH                                   : constant Enum := 16#1D01#;
   GL_COLOR_MATERIAL                           : constant Enum := 16#B57#;
   GL_COLOR_MATERIAL_FACE                      : constant Enum := 16#B55#;
   GL_COLOR_MATERIAL_PARAMETER                 : constant Enum := 16#B56#;
   GL_NORMALIZE                                : constant Enum := 16#BA1#;

   -- User clipping planes
   GL_CLIP_PLANE0                              : constant Enum := 16#3000#;
   GL_CLIP_PLANE1                              : constant Enum := 16#3001#;
   GL_CLIP_PLANE2                              : constant Enum := 16#3002#;
   GL_CLIP_PLANE3                              : constant Enum := 16#3003#;
   GL_CLIP_PLANE4                              : constant Enum := 16#3004#;
   GL_CLIP_PLANE5                              : constant Enum := 16#3005#;

   -- Accumulation buffer
   GL_ACCUM_RED_BITS                           : constant Enum := 16#D58#;
   GL_ACCUM_GREEN_BITS                         : constant Enum := 16#D59#;
   GL_ACCUM_BLUE_BITS                          : constant Enum := 16#D5A#;
   GL_ACCUM_ALPHA_BITS                         : constant Enum := 16#D5B#;
   GL_ACCUM_CLEAR_VALUE                        : constant Enum := 16#B80#;
   GL_ACCUM                                    : constant Enum := 16#100#;
   GL_ADD                                      : constant Enum := 16#104#;
   GL_LOAD                                     : constant Enum := 16#101#;
   GL_MULT                                     : constant Enum := 16#103#;
   GL_RETURN                                   : constant Enum := 16#102#;

   -- Alpha testing
   GL_ALPHA_TEST                               : constant Enum := 16#BC0#;
   GL_ALPHA_TEST_REF                           : constant Enum := 16#BC2#;
   GL_ALPHA_TEST_FUNC                          : constant Enum := 16#BC1#;

   -- Blending
   GL_BLEND                                    : constant Enum := 16#BE2#;
   GL_BLEND_SRC                                : constant Enum := 16#BE1#;
   GL_BLEND_DST                                : constant Enum := 16#BE0#;
   GL_ZERO                                     : constant Enum := 16#0#;
   GL_ONE                                      : constant Enum := 16#1#;
   GL_SRC_COLOR                                : constant Enum := 16#300#;
   GL_ONE_MINUS_SRC_COLOR                      : constant Enum := 16#301#;
   GL_SRC_ALPHA                                : constant Enum := 16#302#;
   GL_ONE_MINUS_SRC_ALPHA                      : constant Enum := 16#303#;
   GL_DST_ALPHA                                : constant Enum := 16#304#;
   GL_ONE_MINUS_DST_ALPHA                      : constant Enum := 16#305#;
   GL_DST_COLOR                                : constant Enum := 16#306#;
   GL_ONE_MINUS_DST_COLOR                      : constant Enum := 16#307#;
   GL_SRC_ALPHA_SATURATE                       : constant Enum := 16#308#;

   -- Render mode
   GL_FEEDBACK                                 : constant Enum := 16#1C01#;
   GL_RENDER                                   : constant Enum := 16#1C00#;
   GL_SELECT                                   : constant Enum := 16#1C02#;

   -- Feedback
   GL_2D                                       : constant Enum := 16#600#;
   GL_3D                                       : constant Enum := 16#601#;
   GL_3D_COLOR                                 : constant Enum := 16#602#;
   GL_3D_COLOR_TEXTURE                         : constant Enum := 16#603#;
   GL_4D_COLOR_TEXTURE                         : constant Enum := 16#604#;
   GL_POINT_TOKEN                              : constant Enum := 16#701#;
   GL_LINE_TOKEN                               : constant Enum := 16#702#;
   GL_LINE_RESET_TOKEN                         : constant Enum := 16#707#;
   GL_POLYGON_TOKEN                            : constant Enum := 16#703#;
   GL_BITMAP_TOKEN                             : constant Enum := 16#704#;
   GL_DRAW_PIXEL_TOKEN                         : constant Enum := 16#705#;
   GL_COPY_PIXEL_TOKEN                         : constant Enum := 16#706#;
   GL_PASS_THROUGH_TOKEN                       : constant Enum := 16#700#;
   GL_FEEDBACK_BUFFER_POINTER                  : constant Enum := 16#DF0#;
   GL_FEEDBACK_BUFFER_SIZE                     : constant Enum := 16#DF1#;
   GL_FEEDBACK_BUFFER_TYPE                     : constant Enum := 16#DF2#;

   -- Selection
   GL_SELECTION_BUFFER_POINTER                 : constant Enum := 16#DF3#;
   GL_SELECTION_BUFFER_SIZE                    : constant Enum := 16#DF4#;

   -- Fog
   GL_FOG                                      : constant Enum := 16#B60#;
   GL_FOG_MODE                                 : constant Enum := 16#B65#;
   GL_FOG_DENSITY                              : constant Enum := 16#B62#;
   GL_FOG_COLOR                                : constant Enum := 16#B66#;
   GL_FOG_INDEX                                : constant Enum := 16#B61#;
   GL_FOG_START                                : constant Enum := 16#B63#;
   GL_FOG_END                                  : constant Enum := 16#B64#;
   GL_LINEAR                                   : constant Enum := 16#2601#;
   GL_EXP                                      : constant Enum := 16#800#;
   GL_EXP2                                     : constant Enum := 16#801#;

   -- Logic Ops
   GL_LOGIC_OP                                 : constant Enum := 16#BF1#;
   GL_INDEX_LOGIC_OP                           : constant Enum := 16#BF1#;
   GL_COLOR_LOGIC_OP                           : constant Enum := 16#BF2#;
   GL_LOGIC_OP_MODE                            : constant Enum := 16#BF0#;
   GL_CLEAR                                    : constant Enum := 16#1500#;
   GL_SET                                      : constant Enum := 16#150F#;
   GL_COPY                                     : constant Enum := 16#1503#;
   GL_COPY_INVERTED                            : constant Enum := 16#150C#;
   GL_NOOP                                     : constant Enum := 16#1505#;
   GL_INVERT                                   : constant Enum := 16#150A#;
   GL_AND                                      : constant Enum := 16#1501#;
   GL_NAND                                     : constant Enum := 16#150E#;
   GL_OR                                       : constant Enum := 16#1507#;
   GL_NOR                                      : constant Enum := 16#1508#;
   GL_XOR                                      : constant Enum := 16#1506#;
   GL_EQUIV                                    : constant Enum := 16#1509#;
   GL_AND_REVERSE                              : constant Enum := 16#1502#;
   GL_AND_INVERTED                             : constant Enum := 16#1504#;
   GL_OR_REVERSE                               : constant Enum := 16#150B#;
   GL_OR_INVERTED                              : constant Enum := 16#150D#;

   -- Stencil
   GL_STENCIL_BITS                             : constant Enum := 16#D57#;
   GL_STENCIL_TEST                             : constant Enum := 16#B90#;
   GL_STENCIL_CLEAR_VALUE                      : constant Enum := 16#B91#;
   GL_STENCIL_FUNC                             : constant Enum := 16#B92#;
   GL_STENCIL_VALUE_MASK                       : constant Enum := 16#B93#;
   GL_STENCIL_FAIL                             : constant Enum := 16#B94#;
   GL_STENCIL_PASS_DEPTH_FAIL                  : constant Enum := 16#B95#;
   GL_STENCIL_PASS_DEPTH_PASS                  : constant Enum := 16#B96#;
   GL_STENCIL_REF                              : constant Enum := 16#B97#;
   GL_STENCIL_WRITEMASK                        : constant Enum := 16#B98#;
   GL_STENCIL_INDEX                            : constant Enum := 16#1901#;
   GL_KEEP                                     : constant Enum := 16#1E00#;
   GL_REPLACE                                  : constant Enum := 16#1E01#;
   GL_INCR                                     : constant Enum := 16#1E02#;
   GL_DECR                                     : constant Enum := 16#1E03#;

   -- Buffers, Pixel Drawing/Reading
   GL_NONE                                     : constant Enum := 16#0#;
   GL_LEFT                                     : constant Enum := 16#406#;
   GL_RIGHT                                    : constant Enum := 16#407#;
   GL_FRONT_LEFT                               : constant Enum := 16#400#;
   GL_FRONT_RIGHT                              : constant Enum := 16#401#;
   GL_BACK_LEFT                                : constant Enum := 16#402#;
   GL_BACK_RIGHT                               : constant Enum := 16#403#;
   GL_AUX0                                     : constant Enum := 16#409#;
   GL_AUX1                                     : constant Enum := 16#40A#;
   GL_AUX2                                     : constant Enum := 16#40B#;
   GL_AUX3                                     : constant Enum := 16#40C#;
   GL_COLOR_INDEX                              : constant Enum := 16#1900#;
   GL_RED                                      : constant Enum := 16#1903#;
   GL_GREEN                                    : constant Enum := 16#1904#;
   GL_BLUE                                     : constant Enum := 16#1905#;
   GL_ALPHA                                    : constant Enum := 16#1906#;
   GL_LUMINANCE                                : constant Enum := 16#1909#;
   GL_LUMINANCE_ALPHA                          : constant Enum := 16#190A#;
   GL_ALPHA_BITS                               : constant Enum := 16#D55#;
   GL_RED_BITS                                 : constant Enum := 16#D52#;
   GL_GREEN_BITS                               : constant Enum := 16#D53#;
   GL_BLUE_BITS                                : constant Enum := 16#D54#;
   GL_INDEX_BITS                               : constant Enum := 16#D51#;
   GL_SUBPIXEL_BITS                            : constant Enum := 16#D50#;
   GL_AUX_BUFFERS                              : constant Enum := 16#C00#;
   GL_READ_BUFFER                              : constant Enum := 16#C02#;
   GL_DRAW_BUFFER                              : constant Enum := 16#C01#;
   GL_DOUBLEBUFFER                             : constant Enum := 16#C32#;
   GL_STEREO                                   : constant Enum := 16#C33#;
   GL_BITMAP                                   : constant Enum := 16#1A00#;
   GL_COLOR                                    : constant Enum := 16#1800#;
   GL_DEPTH                                    : constant Enum := 16#1801#;
   GL_STENCIL                                  : constant Enum := 16#1802#;
   GL_DITHER                                   : constant Enum := 16#BD0#;
   GL_RGB                                      : constant Enum := 16#1907#;
   GL_RGBA                                     : constant Enum := 16#1908#;

   -- Implementation limits
   GL_MAX_LIST_NESTING                         : constant Enum := 16#B31#;
   GL_MAX_EVAL_ORDER                           : constant Enum := 16#D30#;
   GL_MAX_LIGHTS                               : constant Enum := 16#D31#;
   GL_MAX_CLIP_PLANES                          : constant Enum := 16#D32#;
   GL_MAX_TEXTURE_SIZE                         : constant Enum := 16#D33#;
   GL_MAX_PIXEL_MAP_TABLE                      : constant Enum := 16#D34#;
   GL_MAX_ATTRIB_STACK_DEPTH                   : constant Enum := 16#D35#;
   GL_MAX_MODELVIEW_STACK_DEPTH                : constant Enum := 16#D36#;
   GL_MAX_NAME_STACK_DEPTH                     : constant Enum := 16#D37#;
   GL_MAX_PROJECTION_STACK_DEPTH               : constant Enum := 16#D38#;
   GL_MAX_TEXTURE_STACK_DEPTH                  : constant Enum := 16#D39#;
   GL_MAX_VIEWPORT_DIMS                        : constant Enum := 16#D3A#;
   GL_MAX_CLIENT_ATTRIB_STACK_DEPTH            : constant Enum := 16#D3B#;

   -- Gets
   GL_ATTRIB_STACK_DEPTH                       : constant Enum := 16#BB0#;
   GL_CLIENT_ATTRIB_STACK_DEPTH                : constant Enum := 16#BB1#;
   GL_COLOR_CLEAR_VALUE                        : constant Enum := 16#C22#;
   GL_COLOR_WRITEMASK                          : constant Enum := 16#C23#;
   GL_CURRENT_INDEX                            : constant Enum := 16#B01#;
   GL_CURRENT_COLOR                            : constant Enum := 16#B00#;
   GL_CURRENT_NORMAL                           : constant Enum := 16#B02#;
   GL_CURRENT_RASTER_COLOR                     : constant Enum := 16#B04#;
   GL_CURRENT_RASTER_DISTANCE                  : constant Enum := 16#B09#;
   GL_CURRENT_RASTER_INDEX                     : constant Enum := 16#B05#;
   GL_CURRENT_RASTER_POSITION                  : constant Enum := 16#B07#;
   GL_CURRENT_RASTER_TEXTURE_COORDS            : constant Enum := 16#B06#;
   GL_CURRENT_RASTER_POSITION_VALID            : constant Enum := 16#B08#;
   GL_CURRENT_TEXTURE_COORDS                   : constant Enum := 16#B03#;
   GL_INDEX_CLEAR_VALUE                        : constant Enum := 16#C20#;
   GL_INDEX_MODE                               : constant Enum := 16#C30#;
   GL_INDEX_WRITEMASK                          : constant Enum := 16#C21#;
   GL_MODELVIEW_MATRIX                         : constant Enum := 16#BA6#;
   GL_MODELVIEW_STACK_DEPTH                    : constant Enum := 16#BA3#;
   GL_NAME_STACK_DEPTH                         : constant Enum := 16#D70#;
   GL_PROJECTION_MATRIX                        : constant Enum := 16#BA7#;
   GL_PROJECTION_STACK_DEPTH                   : constant Enum := 16#BA4#;
   GL_RENDER_MODE                              : constant Enum := 16#C40#;
   GL_RGBA_MODE                                : constant Enum := 16#C31#;
   GL_TEXTURE_MATRIX                           : constant Enum := 16#BA8#;
   GL_TEXTURE_STACK_DEPTH                      : constant Enum := 16#BA5#;
   GL_VIEWPORT                                 : constant Enum := 16#BA2#;

   -- Evaluators
   GL_AUTO_NORMAL                              : constant Enum := 16#D80#;
   GL_MAP1_COLOR_4                             : constant Enum := 16#D90#;
   GL_MAP1_INDEX                               : constant Enum := 16#D91#;
   GL_MAP1_NORMAL                              : constant Enum := 16#D92#;
   GL_MAP1_TEXTURE_COORD_1                     : constant Enum := 16#D93#;
   GL_MAP1_TEXTURE_COORD_2                     : constant Enum := 16#D94#;
   GL_MAP1_TEXTURE_COORD_3                     : constant Enum := 16#D95#;
   GL_MAP1_TEXTURE_COORD_4                     : constant Enum := 16#D96#;
   GL_MAP1_VERTEX_3                            : constant Enum := 16#D97#;
   GL_MAP1_VERTEX_4                            : constant Enum := 16#D98#;
   GL_MAP2_COLOR_4                             : constant Enum := 16#DB0#;
   GL_MAP2_INDEX                               : constant Enum := 16#DB1#;
   GL_MAP2_NORMAL                              : constant Enum := 16#DB2#;
   GL_MAP2_TEXTURE_COORD_1                     : constant Enum := 16#DB3#;
   GL_MAP2_TEXTURE_COORD_2                     : constant Enum := 16#DB4#;
   GL_MAP2_TEXTURE_COORD_3                     : constant Enum := 16#DB5#;
   GL_MAP2_TEXTURE_COORD_4                     : constant Enum := 16#DB6#;
   GL_MAP2_VERTEX_3                            : constant Enum := 16#DB7#;
   GL_MAP2_VERTEX_4                            : constant Enum := 16#DB8#;
   GL_MAP1_GRID_DOMAIN                         : constant Enum := 16#DD0#;
   GL_MAP1_GRID_SEGMENTS                       : constant Enum := 16#DD1#;
   GL_MAP2_GRID_DOMAIN                         : constant Enum := 16#DD2#;
   GL_MAP2_GRID_SEGMENTS                       : constant Enum := 16#DD3#;
   GL_COEFF                                    : constant Enum := 16#A00#;
   GL_ORDER                                    : constant Enum := 16#A01#;
   GL_DOMAIN                                   : constant Enum := 16#A02#;

   -- Hints
   GL_PERSPECTIVE_CORRECTION_HINT              : constant Enum := 16#C50#;
   GL_POINT_SMOOTH_HINT                        : constant Enum := 16#C51#;
   GL_LINE_SMOOTH_HINT                         : constant Enum := 16#C52#;
   GL_POLYGON_SMOOTH_HINT                      : constant Enum := 16#C53#;
   GL_FOG_HINT                                 : constant Enum := 16#C54#;
   GL_DONT_CARE                                : constant Enum := 16#1100#;
   GL_FASTEST                                  : constant Enum := 16#1101#;
   GL_NICEST                                   : constant Enum := 16#1102#;

   -- Scissor box
   GL_SCISSOR_BOX                              : constant Enum := 16#C10#;
   GL_SCISSOR_TEST                             : constant Enum := 16#C11#;

   -- Pixel Mode / Transfer
   GL_MAP_COLOR                                : constant Enum := 16#D10#;
   GL_MAP_STENCIL                              : constant Enum := 16#D11#;
   GL_INDEX_SHIFT                              : constant Enum := 16#D12#;
   GL_INDEX_OFFSET                             : constant Enum := 16#D13#;
   GL_RED_SCALE                                : constant Enum := 16#D14#;
   GL_RED_BIAS                                 : constant Enum := 16#D15#;
   GL_GREEN_SCALE                              : constant Enum := 16#D18#;
   GL_GREEN_BIAS                               : constant Enum := 16#D19#;
   GL_BLUE_SCALE                               : constant Enum := 16#D1A#;
   GL_BLUE_BIAS                                : constant Enum := 16#D1B#;
   GL_ALPHA_SCALE                              : constant Enum := 16#D1C#;
   GL_ALPHA_BIAS                               : constant Enum := 16#D1D#;
   GL_DEPTH_SCALE                              : constant Enum := 16#D1E#;
   GL_DEPTH_BIAS                               : constant Enum := 16#D1F#;
   GL_PIXEL_MAP_S_TO_S_SIZE                    : constant Enum := 16#CB1#;
   GL_PIXEL_MAP_I_TO_I_SIZE                    : constant Enum := 16#CB0#;
   GL_PIXEL_MAP_I_TO_R_SIZE                    : constant Enum := 16#CB2#;
   GL_PIXEL_MAP_I_TO_G_SIZE                    : constant Enum := 16#CB3#;
   GL_PIXEL_MAP_I_TO_B_SIZE                    : constant Enum := 16#CB4#;
   GL_PIXEL_MAP_I_TO_A_SIZE                    : constant Enum := 16#CB5#;
   GL_PIXEL_MAP_R_TO_R_SIZE                    : constant Enum := 16#CB6#;
   GL_PIXEL_MAP_G_TO_G_SIZE                    : constant Enum := 16#CB7#;
   GL_PIXEL_MAP_B_TO_B_SIZE                    : constant Enum := 16#CB8#;
   GL_PIXEL_MAP_A_TO_A_SIZE                    : constant Enum := 16#CB9#;
   GL_PIXEL_MAP_S_TO_S                         : constant Enum := 16#C71#;
   GL_PIXEL_MAP_I_TO_I                         : constant Enum := 16#C70#;
   GL_PIXEL_MAP_I_TO_R                         : constant Enum := 16#C72#;
   GL_PIXEL_MAP_I_TO_G                         : constant Enum := 16#C73#;
   GL_PIXEL_MAP_I_TO_B                         : constant Enum := 16#C74#;
   GL_PIXEL_MAP_I_TO_A                         : constant Enum := 16#C75#;
   GL_PIXEL_MAP_R_TO_R                         : constant Enum := 16#C76#;
   GL_PIXEL_MAP_G_TO_G                         : constant Enum := 16#C77#;
   GL_PIXEL_MAP_B_TO_B                         : constant Enum := 16#C78#;
   GL_PIXEL_MAP_A_TO_A                         : constant Enum := 16#C79#;
   GL_PACK_ALIGNMENT                           : constant Enum := 16#D05#;
   GL_PACK_LSB_FIRST                           : constant Enum := 16#D01#;
   GL_PACK_ROW_LENGTH                          : constant Enum := 16#D02#;
   GL_PACK_SKIP_PIXELS                         : constant Enum := 16#D04#;
   GL_PACK_SKIP_ROWS                           : constant Enum := 16#D03#;
   GL_PACK_SWAP_BYTES                          : constant Enum := 16#D00#;
   GL_UNPACK_ALIGNMENT                         : constant Enum := 16#CF5#;
   GL_UNPACK_LSB_FIRST                         : constant Enum := 16#CF1#;
   GL_UNPACK_ROW_LENGTH                        : constant Enum := 16#CF2#;
   GL_UNPACK_SKIP_PIXELS                       : constant Enum := 16#CF4#;
   GL_UNPACK_SKIP_ROWS                         : constant Enum := 16#CF3#;
   GL_UNPACK_SWAP_BYTES                        : constant Enum := 16#CF0#;
   GL_ZOOM_X                                   : constant Enum := 16#D16#;
   GL_ZOOM_Y                                   : constant Enum := 16#D17#;

   -- Texture mapping
   GL_TEXTURE_ENV                              : constant Enum := 16#2300#;
   GL_TEXTURE_ENV_MODE                         : constant Enum := 16#2200#;
   GL_TEXTURE_1D                               : constant Enum := 16#DE0#;
   GL_TEXTURE_2D                               : constant Enum := 16#DE1#;
   GL_TEXTURE_WRAP_S                           : constant Enum := 16#2802#;
   GL_TEXTURE_WRAP_T                           : constant Enum := 16#2803#;
   GL_TEXTURE_MAG_FILTER                       : constant Enum := 16#2800#;
   GL_TEXTURE_MIN_FILTER                       : constant Enum := 16#2801#;
   GL_TEXTURE_ENV_COLOR                        : constant Enum := 16#2201#;
   GL_TEXTURE_GEN_S                            : constant Enum := 16#C60#;
   GL_TEXTURE_GEN_T                            : constant Enum := 16#C61#;
   GL_TEXTURE_GEN_R                            : constant Enum := 16#C62#;
   GL_TEXTURE_GEN_Q                            : constant Enum := 16#C63#;
   GL_TEXTURE_GEN_MODE                         : constant Enum := 16#2500#;
   GL_TEXTURE_BORDER_COLOR                     : constant Enum := 16#1004#;
   GL_TEXTURE_WIDTH                            : constant Enum := 16#1000#;
   GL_TEXTURE_HEIGHT                           : constant Enum := 16#1001#;
   GL_TEXTURE_BORDER                           : constant Enum := 16#1005#;
   GL_TEXTURE_COMPONENTS                       : constant Enum := 16#1003#;
   GL_TEXTURE_RED_SIZE                         : constant Enum := 16#805C#;
   GL_TEXTURE_GREEN_SIZE                       : constant Enum := 16#805D#;
   GL_TEXTURE_BLUE_SIZE                        : constant Enum := 16#805E#;
   GL_TEXTURE_ALPHA_SIZE                       : constant Enum := 16#805F#;
   GL_TEXTURE_LUMINANCE_SIZE                   : constant Enum := 16#8060#;
   GL_TEXTURE_INTENSITY_SIZE                   : constant Enum := 16#8061#;
   GL_NEAREST_MIPMAP_NEAREST                   : constant Enum := 16#2700#;
   GL_NEAREST_MIPMAP_LINEAR                    : constant Enum := 16#2702#;
   GL_LINEAR_MIPMAP_NEAREST                    : constant Enum := 16#2701#;
   GL_LINEAR_MIPMAP_LINEAR                     : constant Enum := 16#2703#;
   GL_OBJECT_LINEAR                            : constant Enum := 16#2401#;
   GL_OBJECT_PLANE                             : constant Enum := 16#2501#;
   GL_EYE_LINEAR                               : constant Enum := 16#2400#;
   GL_EYE_PLANE                                : constant Enum := 16#2502#;
   GL_SPHERE_MAP                               : constant Enum := 16#2402#;
   GL_DECAL                                    : constant Enum := 16#2101#;
   GL_MODULATE                                 : constant Enum := 16#2100#;
   GL_NEAREST                                  : constant Enum := 16#2600#;
   GL_REPEAT                                   : constant Enum := 16#2901#;
   GL_CLAMP                                    : constant Enum := 16#2900#;
   GL_S                                        : constant Enum := 16#2000#;
   GL_T                                        : constant Enum := 16#2001#;
   GL_R                                        : constant Enum := 16#2002#;
   GL_Q                                        : constant Enum := 16#2003#;

   -- Utility
   GL_VENDOR                                   : constant Enum := 16#1F00#;
   GL_RENDERER                                 : constant Enum := 16#1F01#;
   GL_VERSION                                  : constant Enum := 16#1F02#;
   GL_EXTENSIONS                               : constant Enum := 16#1F03#;

   -- Errors
   GL_NO_ERROR                                 : constant Enum := 16#0#;
   GL_INVALID_ENUM                             : constant Enum := 16#500#;
   GL_INVALID_VALUE                            : constant Enum := 16#501#;
   GL_INVALID_OPERATION                        : constant Enum := 16#502#;
   GL_STACK_OVERFLOW                           : constant Enum := 16#503#;
   GL_STACK_UNDERFLOW                          : constant Enum := 16#504#;
   GL_OUT_OF_MEMORY                            : constant Enum := 16#505#;

   -- Push/Pop Attrib bits
   GL_CURRENT_BIT                              : constant Bitfield := 16#00001#;
   GL_POINT_BIT                                : constant Bitfield := 16#00002#;
   GL_LINE_BIT                                 : constant Bitfield := 16#00004#;
   GL_POLYGON_BIT                              : constant Bitfield := 16#00008#;
   GL_POLYGON_STIPPLE_BIT                      : constant Bitfield := 16#00010#;
   GL_PIXEL_MODE_BIT                           : constant Bitfield := 16#00020#;
   GL_LIGHTING_BIT                             : constant Bitfield := 16#00040#;
   GL_FOG_BIT                                  : constant Bitfield := 16#00080#;
   GL_DEPTH_BUFFER_BIT                         : constant Bitfield := 16#00100#;
   GL_ACCUM_BUFFER_BIT                         : constant Bitfield := 16#00200#;
   GL_STENCIL_BUFFER_BIT                       : constant Bitfield := 16#00400#;
   GL_VIEWPORT_BIT                             : constant Bitfield := 16#00800#;
   GL_TRANSFORM_BIT                            : constant Bitfield := 16#01000#;
   GL_ENABLE_BIT                               : constant Bitfield := 16#02000#;
   GL_COLOR_BUFFER_BIT                         : constant Bitfield := 16#04000#;
   GL_HINT_BIT                                 : constant Bitfield := 16#08000#;
   GL_EVAL_BIT                                 : constant Bitfield := 16#10000#;
   GL_LIST_BIT                                 : constant Bitfield := 16#20000#;
   GL_TEXTURE_BIT                              : constant Bitfield := 16#40000#;
   GL_SCISSOR_BIT                              : constant Bitfield := 16#80000#;
   GL_ALL_ATTRIB_BITS                          : constant Bitfield := 16#FFFFF#;

   ---------------------------------------------------------------------------
   -- OpenGL 1.1
   GL_PROXY_TEXTURE_1D                         : constant Enum := 16#8063#;
   GL_PROXY_TEXTURE_2D                         : constant Enum := 16#8064#;
   GL_TEXTURE_PRIORITY                         : constant Enum := 16#8066#;
   GL_TEXTURE_RESIDENT                         : constant Enum := 16#8067#;
   GL_TEXTURE_BINDING_1D                       : constant Enum := 16#8068#;
   GL_TEXTURE_BINDING_2D                       : constant Enum := 16#8069#;
   GL_TEXTURE_INTERNAL_FORMAT                  : constant Enum := 16#1003#;
   GL_ALPHA4                                   : constant Enum := 16#803B#;
   GL_ALPHA8                                   : constant Enum := 16#803C#;
   GL_ALPHA12                                  : constant Enum := 16#803D#;
   GL_ALPHA16                                  : constant Enum := 16#803E#;
   GL_LUMINANCE4                               : constant Enum := 16#803F#;
   GL_LUMINANCE8                               : constant Enum := 16#8040#;
   GL_LUMINANCE12                              : constant Enum := 16#8041#;
   GL_LUMINANCE16                              : constant Enum := 16#8042#;
   GL_LUMINANCE4_ALPHA4                        : constant Enum := 16#8043#;
   GL_LUMINANCE6_ALPHA2                        : constant Enum := 16#8044#;
   GL_LUMINANCE8_ALPHA8                        : constant Enum := 16#8045#;
   GL_LUMINANCE12_ALPHA4                       : constant Enum := 16#8046#;
   GL_LUMINANCE12_ALPHA12                      : constant Enum := 16#8047#;
   GL_LUMINANCE16_ALPHA16                      : constant Enum := 16#8048#;
   GL_INTENSITY                                : constant Enum := 16#8049#;
   GL_INTENSITY4                               : constant Enum := 16#804A#;
   GL_INTENSITY8                               : constant Enum := 16#804B#;
   GL_INTENSITY12                              : constant Enum := 16#804C#;
   GL_INTENSITY16                              : constant Enum := 16#804D#;
   GL_R3_G3_B2                                 : constant Enum := 16#2A10#;
   GL_RGB4                                     : constant Enum := 16#804F#;
   GL_RGB5                                     : constant Enum := 16#8050#;
   GL_RGB8                                     : constant Enum := 16#8051#;
   GL_RGB10                                    : constant Enum := 16#8052#;
   GL_RGB12                                    : constant Enum := 16#8053#;
   GL_RGB16                                    : constant Enum := 16#8054#;
   GL_RGBA2                                    : constant Enum := 16#8055#;
   GL_RGBA4                                    : constant Enum := 16#8056#;
   GL_RGB5_A1                                  : constant Enum := 16#8057#;
   GL_RGBA8                                    : constant Enum := 16#8058#;
   GL_RGB10_A2                                 : constant Enum := 16#8059#;
   GL_RGBA12                                   : constant Enum := 16#805A#;
   GL_RGBA16                                   : constant Enum := 16#805B#;
   GL_CLIENT_PIXEL_STORE_BIT                   : constant Enum := 16#1#;
   GL_CLIENT_VERTEX_ARRAY_BIT                  : constant Enum := 16#2#;
   GL_ALL_CLIENT_ATTRIB_BITS                   : constant Enum := 16#FFFFFFFF#;
   GL_CLIENT_ALL_ATTRIB_BITS                   : constant Enum := 16#FFFFFFFF#;

   ---------------------------------------------------------------------------
   -- OpenGL 1.2
   GL_RESCALE_NORMAL                           : constant Enum := 16#803A#;
   GL_CLAMP_TO_EDGE                            : constant Enum := 16#812F#;
   GL_MAX_ELEMENTS_VERTICES                    : constant Enum := 16#80E8#;
   GL_MAX_ELEMENTS_INDICES                     : constant Enum := 16#80E9#;
   GL_BGR                                      : constant Enum := 16#80E0#;
   GL_BGRA                                     : constant Enum := 16#80E1#;
   GL_UNSIGNED_BYTE_3_3_2                      : constant Enum := 16#8032#;
   GL_UNSIGNED_BYTE_2_3_3_REV                  : constant Enum := 16#8362#;
   GL_UNSIGNED_SHORT_5_6_5                     : constant Enum := 16#8363#;
   GL_UNSIGNED_SHORT_5_6_5_REV                 : constant Enum := 16#8364#;
   GL_UNSIGNED_SHORT_4_4_4_4                   : constant Enum := 16#8033#;
   GL_UNSIGNED_SHORT_4_4_4_4_REV               : constant Enum := 16#8365#;
   GL_UNSIGNED_SHORT_5_5_5_1                   : constant Enum := 16#8034#;
   GL_UNSIGNED_SHORT_1_5_5_5_REV               : constant Enum := 16#8366#;
   GL_UNSIGNED_INT_8_8_8_8                     : constant Enum := 16#8035#;
   GL_UNSIGNED_INT_8_8_8_8_REV                 : constant Enum := 16#8367#;
   GL_UNSIGNED_INT_10_10_10_2                  : constant Enum := 16#8036#;
   GL_UNSIGNED_INT_2_10_10_10_REV              : constant Enum := 16#8368#;
   GL_LIGHT_MODEL_COLOR_CONTROL                : constant Enum := 16#81F8#;
   GL_SINGLE_COLOR                             : constant Enum := 16#81F9#;
   GL_SEPARATE_SPECULAR_COLOR                  : constant Enum := 16#81FA#;
   GL_TEXTURE_MIN_LOD                          : constant Enum := 16#813A#;
   GL_TEXTURE_MAX_LOD                          : constant Enum := 16#813B#;
   GL_TEXTURE_BASE_LEVEL                       : constant Enum := 16#813C#;
   GL_TEXTURE_MAX_LEVEL                        : constant Enum := 16#813D#;
   GL_SMOOTH_POINT_SIZE_RANGE                  : constant Enum := 16#B12#;
   GL_SMOOTH_POINT_SIZE_GRANULARITY            : constant Enum := 16#B13#;
   GL_SMOOTH_LINE_WIDTH_RANGE                  : constant Enum := 16#B22#;
   GL_SMOOTH_LINE_WIDTH_GRANULARITY            : constant Enum := 16#B23#;
   GL_ALIASED_POINT_SIZE_RANGE                 : constant Enum := 16#846D#;
   GL_ALIASED_LINE_WIDTH_RANGE                 : constant Enum := 16#846E#;
   GL_PACK_SKIP_IMAGES                         : constant Enum := 16#806B#;
   GL_PACK_IMAGE_HEIGHT                        : constant Enum := 16#806C#;
   GL_UNPACK_SKIP_IMAGES                       : constant Enum := 16#806D#;
   GL_UNPACK_IMAGE_HEIGHT                      : constant Enum := 16#806E#;
   GL_TEXTURE_3D                               : constant Enum := 16#806F#;
   GL_PROXY_TEXTURE_3D                         : constant Enum := 16#8070#;
   GL_TEXTURE_DEPTH                            : constant Enum := 16#8071#;
   GL_TEXTURE_WRAP_R                           : constant Enum := 16#8072#;
   GL_MAX_3D_TEXTURE_SIZE                      : constant Enum := 16#8073#;
   GL_TEXTURE_BINDING_3D                       : constant Enum := 16#806A#;

   ---------------------------------------------------------------------------
   -- ARB Imaging
   GL_CONSTANT_COLOR                           : constant Enum := 16#8001#;
   GL_ONE_MINUS_CONSTANT_COLOR                 : constant Enum := 16#8002#;
   GL_CONSTANT_ALPHA                           : constant Enum := 16#8003#;
   GL_ONE_MINUS_CONSTANT_ALPHA                 : constant Enum := 16#8004#;
   GL_COLOR_TABLE                              : constant Enum := 16#80D0#;
   GL_POST_CONVOLUTION_COLOR_TABLE             : constant Enum := 16#80D1#;
   GL_POST_COLOR_MATRIX_COLOR_TABLE            : constant Enum := 16#80D2#;
   GL_PROXY_COLOR_TABLE                        : constant Enum := 16#80D3#;
   GL_PROXY_POST_CONVOLUTION_COLOR_TABLE       : constant Enum := 16#80D4#;
   GL_PROXY_POST_COLOR_MATRIX_COLOR_TABLE      : constant Enum := 16#80D5#;
   GL_COLOR_TABLE_SCALE                        : constant Enum := 16#80D6#;
   GL_COLOR_TABLE_BIAS                         : constant Enum := 16#80D7#;
   GL_COLOR_TABLE_FORMAT                       : constant Enum := 16#80D8#;
   GL_COLOR_TABLE_WIDTH                        : constant Enum := 16#80D9#;
   GL_COLOR_TABLE_RED_SIZE                     : constant Enum := 16#80DA#;
   GL_COLOR_TABLE_GREEN_SIZE                   : constant Enum := 16#80DB#;
   GL_COLOR_TABLE_BLUE_SIZE                    : constant Enum := 16#80DC#;
   GL_COLOR_TABLE_ALPHA_SIZE                   : constant Enum := 16#80DD#;
   GL_COLOR_TABLE_LUMINANCE_SIZE               : constant Enum := 16#80DE#;
   GL_COLOR_TABLE_INTENSITY_SIZE               : constant Enum := 16#80DF#;
   GL_CONVOLUTION_1D                           : constant Enum := 16#8010#;
   GL_CONVOLUTION_2D                           : constant Enum := 16#8011#;
   GL_SEPARABLE_2D                             : constant Enum := 16#8012#;
   GL_CONVOLUTION_BORDER_MODE                  : constant Enum := 16#8013#;
   GL_CONVOLUTION_FILTER_SCALE                 : constant Enum := 16#8014#;
   GL_CONVOLUTION_FILTER_BIAS                  : constant Enum := 16#8015#;
   GL_REDUCE                                   : constant Enum := 16#8016#;
   GL_CONVOLUTION_FORMAT                       : constant Enum := 16#8017#;
   GL_CONVOLUTION_WIDTH                        : constant Enum := 16#8018#;
   GL_CONVOLUTION_HEIGHT                       : constant Enum := 16#8019#;
   GL_MAX_CONVOLUTION_WIDTH                    : constant Enum := 16#801A#;
   GL_MAX_CONVOLUTION_HEIGHT                   : constant Enum := 16#801B#;
   GL_POST_CONVOLUTION_RED_SCALE               : constant Enum := 16#801C#;
   GL_POST_CONVOLUTION_GREEN_SCALE             : constant Enum := 16#801D#;
   GL_POST_CONVOLUTION_BLUE_SCALE              : constant Enum := 16#801E#;
   GL_POST_CONVOLUTION_ALPHA_SCALE             : constant Enum := 16#801F#;
   GL_POST_CONVOLUTION_RED_BIAS                : constant Enum := 16#8020#;
   GL_POST_CONVOLUTION_GREEN_BIAS              : constant Enum := 16#8021#;
   GL_POST_CONVOLUTION_BLUE_BIAS               : constant Enum := 16#8022#;
   GL_POST_CONVOLUTION_ALPHA_BIAS              : constant Enum := 16#8023#;
   GL_CONSTANT_BORDER                          : constant Enum := 16#8151#;
   GL_REPLICATE_BORDER                         : constant Enum := 16#8153#;
   GL_CONVOLUTION_BORDER_COLOR                 : constant Enum := 16#8154#;
   GL_COLOR_MATRIX                             : constant Enum := 16#80B1#;
   GL_COLOR_MATRIX_STACK_DEPTH                 : constant Enum := 16#80B2#;
   GL_MAX_COLOR_MATRIX_STACK_DEPTH             : constant Enum := 16#80B3#;
   GL_POST_COLOR_MATRIX_RED_SCALE              : constant Enum := 16#80B4#;
   GL_POST_COLOR_MATRIX_GREEN_SCALE            : constant Enum := 16#80B5#;
   GL_POST_COLOR_MATRIX_BLUE_SCALE             : constant Enum := 16#80B6#;
   GL_POST_COLOR_MATRIX_ALPHA_SCALE            : constant Enum := 16#80B7#;
   GL_POST_COLOR_MATRIX_RED_BIAS               : constant Enum := 16#80B8#;
   GL_POST_COLOR_MATRIX_GREEN_BIAS             : constant Enum := 16#80B9#;
   GL_POST_COLOR_MATRIX_BLUE_BIAS              : constant Enum := 16#80BA#;
   GL_POST_COLOR_MATRIX_ALPHA_BIAS             : constant Enum := 16#80BB#;
   GL_HISTOGRAM                                : constant Enum := 16#8024#;
   GL_PROXY_HISTOGRAM                          : constant Enum := 16#8025#;
   GL_HISTOGRAM_WIDTH                          : constant Enum := 16#8026#;
   GL_HISTOGRAM_FORMAT                         : constant Enum := 16#8027#;
   GL_HISTOGRAM_RED_SIZE                       : constant Enum := 16#8028#;
   GL_HISTOGRAM_GREEN_SIZE                     : constant Enum := 16#8029#;
   GL_HISTOGRAM_BLUE_SIZE                      : constant Enum := 16#802A#;
   GL_HISTOGRAM_ALPHA_SIZE                     : constant Enum := 16#802B#;
   GL_HISTOGRAM_LUMINANCE_SIZE                 : constant Enum := 16#802C#;
   GL_HISTOGRAM_SINK                           : constant Enum := 16#802D#;
   GL_MINMAX                                   : constant Enum := 16#802E#;
   GL_MINMAX_FORMAT                            : constant Enum := 16#802F#;
   GL_MINMAX_SINK                              : constant Enum := 16#8030#;
   GL_TABLE_TOO_LARGE                          : constant Enum := 16#8031#;
   GL_BLEND_EQUATION                           : constant Enum := 16#8009#;
   GL_MIN                                      : constant Enum := 16#8007#;
   GL_MAX                                      : constant Enum := 16#8008#;
   GL_FUNC_ADD                                 : constant Enum := 16#8006#;
   GL_FUNC_SUBTRACT                            : constant Enum := 16#800A#;
   GL_FUNC_REVERSE_SUBTRACT                    : constant Enum := 16#800B#;
   GL_BLEND_COLOR                              : constant Enum := 16#8005#;

   ---------------------------------------------------------------------------
   -- OpenGL 1.3
   GL_TEXTURE0                                 : constant Enum := 16#84C0#;
   GL_TEXTURE1                                 : constant Enum := 16#84C1#;
   GL_TEXTURE2                                 : constant Enum := 16#84C2#;
   GL_TEXTURE3                                 : constant Enum := 16#84C3#;
   GL_TEXTURE4                                 : constant Enum := 16#84C4#;
   GL_TEXTURE5                                 : constant Enum := 16#84C5#;
   GL_TEXTURE6                                 : constant Enum := 16#84C6#;
   GL_TEXTURE7                                 : constant Enum := 16#84C7#;
   GL_TEXTURE8                                 : constant Enum := 16#84C8#;
   GL_TEXTURE9                                 : constant Enum := 16#84C9#;
   GL_TEXTURE10                                : constant Enum := 16#84CA#;
   GL_TEXTURE11                                : constant Enum := 16#84CB#;
   GL_TEXTURE12                                : constant Enum := 16#84CC#;
   GL_TEXTURE13                                : constant Enum := 16#84CD#;
   GL_TEXTURE14                                : constant Enum := 16#84CE#;
   GL_TEXTURE15                                : constant Enum := 16#84CF#;
   GL_TEXTURE16                                : constant Enum := 16#84D0#;
   GL_TEXTURE17                                : constant Enum := 16#84D1#;
   GL_TEXTURE18                                : constant Enum := 16#84D2#;
   GL_TEXTURE19                                : constant Enum := 16#84D3#;
   GL_TEXTURE20                                : constant Enum := 16#84D4#;
   GL_TEXTURE21                                : constant Enum := 16#84D5#;
   GL_TEXTURE22                                : constant Enum := 16#84D6#;
   GL_TEXTURE23                                : constant Enum := 16#84D7#;
   GL_TEXTURE24                                : constant Enum := 16#84D8#;
   GL_TEXTURE25                                : constant Enum := 16#84D9#;
   GL_TEXTURE26                                : constant Enum := 16#84DA#;
   GL_TEXTURE27                                : constant Enum := 16#84DB#;
   GL_TEXTURE28                                : constant Enum := 16#84DC#;
   GL_TEXTURE29                                : constant Enum := 16#84DD#;
   GL_TEXTURE30                                : constant Enum := 16#84DE#;
   GL_TEXTURE31                                : constant Enum := 16#84DF#;
   GL_ACTIVE_TEXTURE                           : constant Enum := 16#84E0#;
   GL_CLIENT_ACTIVE_TEXTURE                    : constant Enum := 16#84E1#;
   GL_MAX_TEXTURE_UNITS                        : constant Enum := 16#84E2#;

   -- Texture cube map
   GL_NORMAL_MAP                               : constant Enum := 16#8511#;
   GL_REFLECTION_MAP                           : constant Enum := 16#8512#;
   GL_TEXTURE_CUBE_MAP                         : constant Enum := 16#8513#;
   GL_TEXTURE_BINDING_CUBE_MAP                 : constant Enum := 16#8514#;
   GL_TEXTURE_CUBE_MAP_POSITIVE_X              : constant Enum := 16#8515#;
   GL_TEXTURE_CUBE_MAP_NEGATIVE_X              : constant Enum := 16#8516#;
   GL_TEXTURE_CUBE_MAP_POSITIVE_Y              : constant Enum := 16#8517#;
   GL_TEXTURE_CUBE_MAP_NEGATIVE_Y              : constant Enum := 16#8518#;
   GL_TEXTURE_CUBE_MAP_POSITIVE_Z              : constant Enum := 16#8519#;
   GL_TEXTURE_CUBE_MAP_NEGATIVE_Z              : constant Enum := 16#851A#;
   GL_PROXY_TEXTURE_CUBE_MAP                   : constant Enum := 16#851B#;
   GL_MAX_CUBE_MAP_TEXTURE_SIZE                : constant Enum := 16#851C#;

   -- Texture compression
   GL_COMPRESSED_ALPHA                         : constant Enum := 16#84E9#;
   GL_COMPRESSED_LUMINANCE                     : constant Enum := 16#84EA#;
   GL_COMPRESSED_LUMINANCE_ALPHA               : constant Enum := 16#84EB#;
   GL_COMPRESSED_INTENSITY                     : constant Enum := 16#84EC#;
   GL_COMPRESSED_RGB                           : constant Enum := 16#84ED#;
   GL_COMPRESSED_RGBA                          : constant Enum := 16#84EE#;
   GL_TEXTURE_COMPRESSION_HINT                 : constant Enum := 16#84EF#;
   GL_TEXTURE_COMPRESSED_IMAGE_SIZE            : constant Enum := 16#86A0#;
   GL_TEXTURE_COMPRESSED                       : constant Enum := 16#86A1#;
   GL_NUM_COMPRESSED_TEXTURE_FORMATS           : constant Enum := 16#86A2#;
   GL_COMPRESSED_TEXTURE_FORMATS               : constant Enum := 16#86A3#;

   -- Multisample
   GL_MULTISAMPLE                              : constant Enum := 16#809D#;
   GL_SAMPLE_ALPHA_TO_COVERAGE                 : constant Enum := 16#809E#;
   GL_SAMPLE_ALPHA_TO_ONE                      : constant Enum := 16#809F#;
   GL_SAMPLE_COVERAGE                          : constant Enum := 16#80A0#;
   GL_SAMPLE_BUFFERS                           : constant Enum := 16#80A8#;
   GL_SAMPLES                                  : constant Enum := 16#80A9#;
   GL_SAMPLE_COVERAGE_VALUE                    : constant Enum := 16#80AA#;
   GL_SAMPLE_COVERAGE_INVERT                   : constant Enum := 16#80AB#;
   GL_MULTISAMPLE_BIT                          : constant Enum := 16#2000_0000#;

   -- Transpose matrix
   GL_TRANSPOSE_MODELVIEW_MATRIX               : constant Enum := 16#84E3#;
   GL_TRANSPOSE_PROJECTION_MATRIX              : constant Enum := 16#84E4#;
   GL_TRANSPOSE_TEXTURE_MATRIX                 : constant Enum := 16#84E5#;
   GL_TRANSPOSE_COLOR_MATRIX                   : constant Enum := 16#84E6#;

   -- Texture env combine
   GL_COMBINE                                  : constant Enum := 16#8570#;
   GL_COMBINE_RGB                              : constant Enum := 16#8571#;
   GL_COMBINE_ALPHA                            : constant Enum := 16#8572#;
   GL_SOURCE0_RGB                              : constant Enum := 16#8580#;
   GL_SOURCE1_RGB                              : constant Enum := 16#8581#;
   GL_SOURCE2_RGB                              : constant Enum := 16#8582#;
   GL_SOURCE0_ALPHA                            : constant Enum := 16#8588#;
   GL_SOURCE1_ALPHA                            : constant Enum := 16#8589#;
   GL_SOURCE2_ALPHA                            : constant Enum := 16#858A#;
   GL_OPERAND0_RGB                             : constant Enum := 16#8590#;
   GL_OPERAND1_RGB                             : constant Enum := 16#8591#;
   GL_OPERAND2_RGB                             : constant Enum := 16#8592#;
   GL_OPERAND0_ALPHA                           : constant Enum := 16#8598#;
   GL_OPERAND1_ALPHA                           : constant Enum := 16#8599#;
   GL_OPERAND2_ALPHA                           : constant Enum := 16#859A#;
   GL_RGB_SCALE                                : constant Enum := 16#8573#;
   GL_ADD_SIGNED                               : constant Enum := 16#8574#;
   GL_INTERPOLATE                              : constant Enum := 16#8575#;
   GL_SUBTRACT                                 : constant Enum := 16#84E7#;
   GL_CONSTANT                                 : constant Enum := 16#8576#;
   GL_PRIMARY_COLOR                            : constant Enum := 16#8577#;
   GL_PREVIOUS                                 : constant Enum := 16#8578#;

   -- Texture env dot3
   GL_DOT3_RGB                                 : constant Enum := 16#86AE#;
   GL_DOT3_RGBA                                : constant Enum := 16#86AF#;

   -- Texture border clamp
   GL_CLAMP_TO_BORDER                          : constant Enum := 16#812D#;

   ---------------------------------------------------------------------------
   -- ARB extension 1 and OpenGL 1.2.1
   GL_ARB_multitexture                         : constant Enum := 1;
   GL_TEXTURE0_ARB                             : constant Enum := 16#84C0#;
   GL_TEXTURE1_ARB                             : constant Enum := 16#84C1#;
   GL_TEXTURE2_ARB                             : constant Enum := 16#84C2#;
   GL_TEXTURE3_ARB                             : constant Enum := 16#84C3#;
   GL_TEXTURE4_ARB                             : constant Enum := 16#84C4#;
   GL_TEXTURE5_ARB                             : constant Enum := 16#84C5#;
   GL_TEXTURE6_ARB                             : constant Enum := 16#84C6#;
   GL_TEXTURE7_ARB                             : constant Enum := 16#84C7#;
   GL_TEXTURE8_ARB                             : constant Enum := 16#84C8#;
   GL_TEXTURE9_ARB                             : constant Enum := 16#84C9#;
   GL_TEXTURE10_ARB                            : constant Enum := 16#84CA#;
   GL_TEXTURE11_ARB                            : constant Enum := 16#84CB#;
   GL_TEXTURE12_ARB                            : constant Enum := 16#84CC#;
   GL_TEXTURE13_ARB                            : constant Enum := 16#84CD#;
   GL_TEXTURE14_ARB                            : constant Enum := 16#84CE#;
   GL_TEXTURE15_ARB                            : constant Enum := 16#84CF#;
   GL_TEXTURE16_ARB                            : constant Enum := 16#84D0#;
   GL_TEXTURE17_ARB                            : constant Enum := 16#84D1#;
   GL_TEXTURE18_ARB                            : constant Enum := 16#84D2#;
   GL_TEXTURE19_ARB                            : constant Enum := 16#84D3#;
   GL_TEXTURE20_ARB                            : constant Enum := 16#84D4#;
   GL_TEXTURE21_ARB                            : constant Enum := 16#84D5#;
   GL_TEXTURE22_ARB                            : constant Enum := 16#84D6#;
   GL_TEXTURE23_ARB                            : constant Enum := 16#84D7#;
   GL_TEXTURE24_ARB                            : constant Enum := 16#84D8#;
   GL_TEXTURE25_ARB                            : constant Enum := 16#84D9#;
   GL_TEXTURE26_ARB                            : constant Enum := 16#84DA#;
   GL_TEXTURE27_ARB                            : constant Enum := 16#84DB#;
   GL_TEXTURE28_ARB                            : constant Enum := 16#84DC#;
   GL_TEXTURE29_ARB                            : constant Enum := 16#84DD#;
   GL_TEXTURE30_ARB                            : constant Enum := 16#84DE#;
   GL_TEXTURE31_ARB                            : constant Enum := 16#84DF#;
   GL_ACTIVE_TEXTURE_ARB                       : constant Enum := 16#84E0#;
   GL_CLIENT_ACTIVE_TEXTURE_ARB                : constant Enum := 16#84E1#;
   GL_MAX_TEXTURE_UNITS_ARB                    : constant Enum := 16#84E2#;

   ---------------------------------------------------------------------------
   -- Others...

   GL_TEXTURE_1D_ARRAY_EXT                     : constant Enum := 16#8C18#;
   GL_PROXY_TEXTURE_1D_ARRAY_EXT               : constant Enum := 16#8C19#;
   GL_TEXTURE_2D_ARRAY_EXT                     : constant Enum := 16#8C1A#;
   GL_PROXY_TEXTURE_2D_ARRAY_EXT               : constant Enum := 16#8C1B#;
   GL_TEXTURE_BINDING_1D_ARRAY_EXT             : constant Enum := 16#8C1C#;
   GL_TEXTURE_BINDING_2D_ARRAY_EXT             : constant Enum := 16#8C1D#;
   GL_POINT_SPRITE                             : constant Enum := 16#8861#;
   GL_COORD_REPLACE                            : constant Enum := 16#8862#;
   GL_MAX_ARRAY_TEXTURE_LAYERS_EXT             : constant Enum := 16#88FF#;
   GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER_EXT : constant Enum := 16#8CD4#;

   GL_FRAMEBUFFER                              : constant Enum := 16#8D40#;
   GL_READ_FRAMEBUFFER                         : constant Enum := 16#8CA8#;
   GL_WRITE_FRAMEBUFFER                        : constant Enum := 16#8CA9#;
   GL_RENDERBUFFER                             : constant Enum := 16#8D41#;

   GL_ARRAY_BUFFER                             : constant Enum := 16#8892#;
   GL_ELEMENT_ARRAY_BUFFER                     : constant Enum := 16#8893#;

   GL_STATIC_DRAW                              : constant Enum := 16#88E4#;
   GL_DYNAMIC_DRAW                             : constant Enum := 16#88E8#;

   GL_VERTEX_SHADER                            : constant Enum := 16#8B31#;
   GL_FRAGMENT_SHADER                          : constant Enum := 16#8B30#;
   GL_DELETE_STATUS                            : constant Enum := 16#8B80#;
   GL_COMPILE_STATUS                           : constant Enum := 16#8B81#;
   GL_LINK_STATUS                              : constant Enum := 16#8B82#;
   GL_VALIDATE_STATUS                          : constant Enum := 16#8B83#;
   GL_INFO_LOG_LENGTH                          : constant Enum := 16#8B84#;
   GL_SHADING_LANGUAGE_VERSION                 : constant Enum := 16#8B8C#;

   ---------------------------------------------------------------------------
   -- OpenGL 1.0 and 1.1 subprograms (in order as defined in gl.h)

   -- Miscellanous
   procedure Clear_Index (C : in Float)
     with Import => True, Convention => StdCall,
          External_Name => "glClearIndex";

   procedure Clear_Color
      (Red   : in ClampF;
       Green : in ClampF;
       Blue  : in ClampF;
       Alpha : in ClampF
      )
     with Import => True, Convention => StdCall,
          External_Name => "glClearColor";

   procedure Clear (Mask : in Bitfield)
     with Import => True, Convention => StdCall, External_Name => "glClear";

   procedure Index_Mask (Mask : in UInt)
     with Import => True, Convention => StdCall, External_Name => "glIndexMask";

   procedure Color_Mask
      (Red   : in Bool;
       Green : in Bool;
       Blue  : in Bool;
       Alpha : in Bool
      )
     with Import => True, Convention => StdCall, External_Name => "glColorMask";

   procedure Alpha_Func
      (Func : in Enum;
       Ref  : in ClampF
      )
     with Import => True, Convention => StdCall, External_Name => "glAlphaFunc";

   procedure Blend_Func
      (S_Factor : in Enum;
       D_Factor : in Enum
      )
     with Import => True, Convention => StdCall, External_Name => "glBlendFunc";

   procedure Logic_Op (Op_Code : in Enum)
     with Import => True, Convention => StdCall, External_Name => "glLogicOp";

   procedure Cull_Face (Mode : in Enum)
     with Import => True, Convention => StdCall, External_Name => "glCullFace";

   procedure Front_Face (Mode : in Enum)
     with Import => True, Convention => StdCall, External_Name => "glFrontFace";

   procedure Point_Size (Size : in Float)
     with Import => True, Convention => StdCall, External_Name => "glPointSize";

   procedure Line_Width (Width : in Float)
     with Import => True, Convention => StdCall, External_Name => "glLineWidth";

   procedure Line_Stipple
      (Factor  : in Int;
       Pattern : in UShort
      )
     with Import => True, Convention => StdCall,
          External_Name => "glLineStipple";

   procedure Polygon_Mode
      (Face : in Enum;
       Mode : in Enum
      )
     with Import => True, Convention => StdCall,
          External_Name => "glPolygonMode";

   procedure Polygon_Offset
      (Factor : in Float;
       Units  : in Float
      )
     with Import => True, Convention => StdCall,
          External_Name => "glPolygonOffset";

   procedure Polygon_Stipple (Mask : in Pointer) -- array of UByte
     with Import => True, Convention => StdCall,
          External_Name => "glPolygonStipple";

   procedure Get_Polygon_Stipple (Mask : in Pointer) -- array of UByte
     with Import => True, Convention => StdCall,
          External_Name => "glGetPolygonStipple";

   procedure Edge_Flag (Flag : in Bool)
     with Import => True, Convention => StdCall, External_Name => "glEdgeFlag";

   procedure Edge_Flag (Flag : in Pointer) -- array of Bool
     with Import => True, Convention => StdCall, External_Name => "glEdgeFlagv";

   procedure Scissor
      (X      : Int;
       Y      : Int;
       Width  : SizeI;
       Height : SizeI
      )
     with Import => True, Convention => StdCall, External_Name => "glScissor";

   procedure Clip_Plane
      (Plane    : in Enum;
       Equation : in Pointer -- array of Double
      )
     with Import => True, Convention => StdCall, External_Name => "glClipPlane";

   procedure Get_Clip_Plane
      (Plane    : in Enum;
       Equation : in Pointer -- array of Double
      )
     with Import => True, Convention => StdCall,
          External_Name => "glGetClipPlane";

   procedure Draw_Buffer (Mode : in Enum)
     with Import => True, Convention => StdCall,
          External_Name => "glDrawBuffer";

   procedure Read_Buffer (Mode : in Enum)
     with Import => True, Convention => StdCall,
          External_Name => "glReadBuffer";

   procedure Enable (Cap : in Enum)
     with Import => True, Convention => StdCall, External_Name => "glEnable";

   procedure Disable (Cap : in Enum)
     with Import => True, Convention => StdCall, External_Name => "glDisable";

   function Is_Enabled (Cap : in Enum) return Bool
     with Import => True, Convention => StdCall, External_Name => "glIsEnabled";

   procedure Get_Boolean
      (PName  : in Enum;
       Params : in Pointer -- array of Bool
      )
     with Import => True, Convention => StdCall,
          External_Name => "glGetBooleanv";

   procedure Get_Double
      (PName  : in Enum;
       Params : in Pointer -- array of Double
      )
     with Import => True, Convention => StdCall,
          External_Name => "glGetDoublev";

   procedure Get_Float
      (PName  : in Enum;
       Params : in Pointer -- array of Float
      )
     with Import => True, Convention => StdCall, External_Name => "glGetFloatv";

   procedure Get_Integer
      (PName  : in Enum;
       Params : in Pointer -- array of Integer
      )
     with Import => True, Convention => StdCall,
          External_Name => "glGetIntegerv";

   procedure Push_Attrib (Mask : in Bitfield)
     with Import => True, Convention => StdCall,
          External_Name => "glPushAttrib";

   procedure Pop_Attrib
     with Import => True, Convention => StdCall, External_Name => "glPopAttrib";

   procedure Render_Mode (Mode : in Enum)
     with Import => True, Convention => StdCall,
          External_Name => "glRenderMode";

   function Get_Error return Enum
     with Import => True, Convention => StdCall, External_Name => "glGetError";

   function Get_String (Name : Enum) return String
     with Inline => True;

   procedure Finish
     with Import => True, Convention => StdCall, External_Name => "glFinish";

   procedure Flush
     with Import => True, Convention => StdCall, External_Name => "glFlush";

   procedure Hint (Target : Enum; Hint : Enum)
     with Import => True, Convention => StdCall, External_Name => "glHint";

   procedure Sample_Coverage (Value : in ClampF;
                              Inver : in Bool)
     with Import => True, Convention => StdCall,
          External_Name => "glSampleCoverage";

   -- Depth buffer
   procedure Clear_Depth (Depth : in ClampD)
     with Import => True, Convention => StdCall,
          External_Name => "glClearDepth";

   procedure Depth_Func (Func : in Enum)
     with Import => True, Convention => StdCall, External_Name => "glDepthFunc";

   procedure Depth_Mask (Flag : in Bool)
     with Import => True, Convention => StdCall, External_Name => "glDepthMask";

   procedure Depth_Range
      (Near_Val : in ClampD;
       Far_Val  : in ClampD
      )
     with Import => True, Convention => StdCall,
          External_Name => "glDepthRange";

   -- Accumulation buffer
   procedure Clear_Accum
      (Red   : in Float;
       Green : in Float;
       Blue  : in Float;
       Alpha : in Float
      )
     with Import => True, Convention => StdCall,
          External_Name => "glClearAccum";

   procedure Accum
      (Op    : in Enum;
       Value : in Float
      )
     with Import => True, Convention => StdCall, External_Name => "glAccum";

   -- Transformation
   procedure Matrix_Mode (Mode : in Enum)
     with Import => True, Convention => StdCall,
          External_Name => "glMatrixMode";

   procedure Ortho
      (Left     : in Double;
       Right    : in Double;
       Bottom   : in Double;
       Top      : in Double;
       Near_Val : in Double;
       Far_Val  : in Double
      )
     with Import => True, Convention => StdCall, External_Name => "glOrtho";

   procedure Frustum
      (Left     : in Double;
       Right    : in Double;
       Bottom   : in Double;
       Top      : in Double;
       Near_Val : in Double;
       Far_Val  : in Double
      )
     with Import => True, Convention => StdCall, External_Name => "glFrustum";

   procedure Viewport
      (X      : in Int;
       Y      : in Int;
       Width  : in SizeI;
       Height : in SizeI
      )
     with Import => True, Convention => StdCall, External_Name => "glViewport";

   procedure Push_Matrix
     with Import => True, Convention => StdCall,
          External_Name => "glPushMatrix";

   procedure Pop_Matrix
     with Import => True, Convention => StdCall, External_Name => "glPopMatrix";

   procedure Load_Identity
     with Import => True, Convention => StdCall,
          External_Name => "glLoadIdentity";

   procedure Load_Matrix (M : in Float_Matrix)
     with Import => True, Convention => StdCall,
          External_Name => "glLoadMatrixf";

   procedure Load_Matrix (M : in Double_Matrix)
     with Import => True, Convention => StdCall,
          External_Name => "glLoadMatrixd";

   procedure Mult_Matrix (M : in Float_Matrix)
     with Import => True, Convention => StdCall,
          External_Name => "glMultMatrixf";

   procedure Mult_Matrix (M : in Double_Matrix)
     with Import => True, Convention => StdCall,
          External_Name => "glMultMatrixd";

   procedure Load_Transpose_Matrix (M : in Double_Matrix)
     with Import => True, Convention => StdCall,
          External_Name => "glLoadTransposeMatrixd";

   procedure Load_Transpose_Matrix (M : in Float_Matrix)
     with Import => True, Convention => StdCall,
          External_Name => "glLoadTransposeMatrixf";

   procedure Mult_Transpose_Matrix (M : in Double_Matrix)
     with Import => True, Convention => StdCall,
          External_Name => "glMultTransposeMatrixd";

   procedure Mult_Transpose_Matrix (M : in Float_Matrix)
     with Import => True, Convention => StdCall,
          External_Name => "glMultTransposeMatrixf";

   procedure Rotate
      (Angle : in Double;
       X     : in Double;
       Y     : in Double;
       Z     : in Double
      )
     with Import => True, Convention => StdCall, External_Name => "glRotated";

   procedure Rotate
      (Angle : in Float;
       X     : in Float;
       Y     : in Float;
       Z     : in Float
      )
     with Import => True, Convention => StdCall, External_Name => "glRotatef";

   procedure Scale
      (X : in Double;
       Y : in Double;
       Z : in Double
      )
     with Import => True, Convention => StdCall, External_Name => "glScaled";

   procedure Scale
      (X : in Float;
       Y : in Float;
       Z : in Float
      )
     with Import => True, Convention => StdCall, External_Name => "glScalef";

   procedure Translate
      (X : in Double;
       Y : in Double;
       Z : in Double
      )
     with Import => True, Convention => StdCall,
          External_Name => "glTranslated";

   procedure Translate
      (X : in Float;
       Y : in Float;
       Z : in Float
      )
     with Import => True, Convention => StdCall,
          External_Name => "glTranslatef";

   -- Display Lists
   function Is_List (List : in UInt) return Bool
     with Import => True, Convention => StdCall, External_Name => "glIsList";

   procedure Delete_Lists
      (List   : in UInt;
       SRange : in SizeI
      )
     with Import => True, Convention => StdCall,
          External_Name => "glDeleteLists";

   function Gen_Lists (SRange : in SizeI) return UInt
     with Import => True, Convention => StdCall, External_Name => "glGenLists";

   procedure New_List
      (List : in UInt;
       Mode : in Enum
      )
     with Import => True, Convention => StdCall, External_Name => "glNewList";

   procedure End_List
     with Import => True, Convention => StdCall, External_Name => "glEndList";

   procedure Call_List (List : in UInt)
     with Import => True, Convention => StdCall, External_Name => "glCallList";

   procedure Call_Lists
      (N     : in SizeI;
       SType : in Enum;
       Lists : in Pointer
      )
     with Import => True, Convention => StdCall, External_Name => "glCallLists";

   procedure List_Base (Base : in UInt)
     with Import => True, Convention => StdCall, External_Name => "glListBase";

   -- Drawing Functions
   procedure Begin_Primitive (Mode : in Enum)
     with Import => True, Convention => StdCall, External_Name => "glBegin";

   procedure End_Primitive
     with Import => True, Convention => StdCall, External_Name => "glEnd";

   procedure Vertex
      (X : in Double;
       Y : in Double
      )
     with Import => True, Convention => StdCall, External_Name => "glVertex2d";

   procedure Vertex
      (X : in Float;
       Y : in Float
      )
     with Import => True, Convention => StdCall, External_Name => "glVertex2f";

   procedure Vertex
      (X : in Int;
       Y : in Int
      )
     with Import => True, Convention => StdCall, External_Name => "glVertex2i";

   procedure Vertex
      (X : in Short;
       Y : in Short
      )
     with Import => True, Convention => StdCall, External_Name => "glVertex2s";

   procedure Vertex
      (X : in Double;
       Y : in Double;
       Z : in Double
      )
     with Import => True, Convention => StdCall, External_Name => "glVertex3d";

   procedure Vertex
      (X : in Float;
       Y : in Float;
       Z : in Float
      )
     with Import => True, Convention => StdCall, External_Name => "glVertex3f";

   procedure Vertex
      (X : in Int;
       Y : in Int;
       Z : in Int
      )
     with Import => True, Convention => StdCall, External_Name => "glVertex3i";

   procedure Vertex
      (X : in Short;
       Y : in Short;
       Z : in Short
      )
     with Import => True, Convention => StdCall, External_Name => "glVertex3s";

   procedure Vertex
      (X : in Double;
       Y : in Double;
       Z : in Double;
       W : in Double
      )
     with Import => True, Convention => StdCall, External_Name => "glVertext4d";

   procedure Vertex
      (X : in Float;
       Y : in Float;
       Z : in Float;
       W : in Float
      )
     with Import => True, Convention => StdCall, External_Name => "glVertex4f";

   procedure Vertex
      (X : in Int;
       Y : in Int;
       Z : in Int;
       W : in Int
      )
     with Import => True, Convention => StdCall, External_Name => "glVertex4i";

   procedure Vertex
      (X : in Short;
       Y : in Short;
       Z : in Short;
       W : in Short
      )
     with Import => True, Convention => StdCall, External_Name => "glVertex4s";

   procedure Vertex (V : in Doubles_2)
     with Import => True, Convention => StdCall, External_Name => "glVertex2dv";

   procedure Vertex (V : in Doubles_3)
     with Import => True, Convention => StdCall, External_Name => "glVertex3dv";

   procedure Vertex (V : in Doubles_4)
     with Import => True, Convention => StdCall, External_Name => "glVertex4dv";

   procedure Vertex (V : in Floats_2)
     with Import => True, Convention => StdCall, External_Name => "glVertex2fv";

   procedure Vertex (V : in Floats_3)
     with Import => True, Convention => StdCall, External_Name => "glVertex3fv";

   procedure Vertex (V : in Floats_4)
     with Import => True, Convention => StdCall, External_Name => "glVertex4fv";

   procedure Vertex (V : in Ints_2)
     with Import => True, Convention => StdCall, External_Name => "glVertex2iv";

   procedure Vertex (V : in Ints_3)
     with Import => True, Convention => StdCall, External_Name => "glVertex3iv";

   procedure Vertex (V : in Ints_4)
     with Import => True, Convention => StdCall, External_Name => "glVertex4iv";

   procedure Vertex (V : in Shorts_2)
     with Import => True, Convention => StdCall, External_Name => "glVertex2sv";

   procedure Vertex (V : in Shorts_3)
     with Import => True, Convention => StdCall, External_Name => "glVertex3sv";

   procedure Vertex (V : in Shorts_4)
     with Import => True, Convention => StdCall, External_Name => "glVertex4sv";

   procedure Normal
     (X : in Byte;
      Y : in Byte;
      Z : in Byte
     )
     with Import => True, Convention => StdCall, External_Name => "glNormal3b";

   procedure Normal
     (X : in Double;
      Y : in Double;
      Z : in Double
     )
     with Import => True, Convention => StdCall, External_Name => "glNormal3d";

   procedure Normal
     (X : in Float;
      Y : in Float;
      Z : in Float
     )
     with Import => True, Convention => StdCall, External_Name => "glNormal3f";

   procedure Normal
     (X : in Int;
      Y : in Int;
      Z : in Int
     )
     with Import => True, Convention => StdCall, External_Name => "glNormal3i";

   procedure Normal
     (X : in Short;
      Y : in Short;
      Z : in Short
     )
     with Import => True, Convention => StdCall, External_Name => "glNormal3s";

   procedure Normal (V : in Bytes_3)
     with Import => True, Convention => StdCall, External_Name => "glNormal3bv";

   procedure Normal (V : in Doubles_3)
     with Import => True, Convention => StdCall, External_Name => "glNormal3dv";

   procedure Normal (V : in Floats_3)
     with Import => True, Convention => StdCall, External_Name => "glNormal3fv";

   procedure Normal (V : in Ints_3)
     with Import => True, Convention => StdCall, External_Name => "glNormal3iv";

   procedure Normal (V : in Shorts_3)
     with Import => True, Convention => StdCall, External_Name => "glNormal3sv";

   procedure Index (C : in Double)
     with Import => True, Convention => StdCall, External_Name => "glIndexd";

   procedure Index (C : in Float)
     with Import => True, Convention => StdCall, External_Name => "glIndexf";

   procedure Index (C : in Int)
     with Import => True, Convention => StdCall, External_Name => "glIndexi";

   procedure Index (C : in Short)
     with Import => True, Convention => StdCall, External_Name => "glIndexs";

   procedure Index (C : in Doubles)
     with Import => True, Convention => StdCall, External_Name => "glIndexdv";

   procedure Index (C : in Floats)
     with Import => True, Convention => StdCall, External_Name => "glIndexfv";

   procedure Index (C : in Ints)
     with Import => True, Convention => StdCall, External_Name => "glIndexiv";

   procedure Index (C : in Shorts)
     with Import => True, Convention => StdCall, External_Name => "glIndexsv";

   ---------------------------------------------------------------------------
   -- Component color
   procedure Color (Red   : in Byte;
                    Green : in Byte;
                    Blue  : in Byte)
     with Import => True, Convention => StdCall, External_Name => "glColor3b";

   procedure Color (Red   : in Short;
                    Green : in Short;
                    Blue  : in Short)
     with Import => True, Convention => StdCall, External_Name => "glColor3s";

   procedure Color (Red   : in Int;
                    Green : in Int;
                    Blue  : in Int)
     with Import => True, Convention => StdCall, External_Name => "glColor3i";

   procedure Color (Red   : in Float;
                    Green : in Float;
                    Blue  : in Float)
     with Import => True, Convention => StdCall, External_Name => "glColor3f";

   procedure Color (Red   : in Double;
                    Green : in Double;
                    Blue  : in Double)
     with Import => True, Convention => StdCall, External_Name => "glColor3d";

   procedure Color (Red   : in UByte;
                    Green : in UByte;
                    Blue  : in UByte)
     with Import => True, Convention => StdCall, External_Name => "glColor3ub";

   procedure Color (Red   : in UShort;
                    Green : in UShort;
                    Blue  : in UShort)
     with Import => True, Convention => StdCall, External_Name => "glColor3us";

   procedure Color (Red   : in UInt;
                    Green : in UInt;
                    Blue  : in UInt)
     with Import => True, Convention => StdCall, External_Name => "glColor3ui";

   procedure Color (Red   : in Byte;
                    Green : in Byte;
                    Blue  : in Byte;
                    Alpha : in Byte)
     with Import => True, Convention => StdCall, External_Name => "glColor4b";

   procedure Color (Red   : in Short;
                    Green : in Short;
                    Blue  : in Short;
                    Alpha : in Short)
     with Import => True, Convention => StdCall, External_Name => "glColor4s";

   procedure Color (Red   : in Int;
                    Green : in Int;
                    Blue  : in Int;
                    Alpha : in Int)
     with Import => True, Convention => StdCall, External_Name => "glColor4i";

   procedure Color (Red   : in Float;
                    Green : in Float;
                    Blue  : in Float;
                    Alpha : in Float)
     with Import => True, Convention => StdCall, External_Name => "glColor4f";

   procedure Color (Red   : in Double;
                    Green : in Double;
                    Blue  : in Double;
                    Alpha : in Double)
     with Import => True, Convention => StdCall, External_Name => "glColor4d";

   procedure Color (Red   : in UByte;
                    Green : in UByte;
                    Blue  : in UByte;
                    Alpha : in UByte)
     with Import => True, Convention => StdCall, External_Name => "glColor4ub";

   procedure Color (Red   : in UShort;
                    Green : in UShort;
                    Blue  : in UShort;
                    Alpha : in UShort)
     with Import => True, Convention => StdCall, External_Name => "glColor4us";

   procedure Color (Red   : in UInt;
                    Green : in UInt;
                    Blue  : in UInt;
                    Alpha : in UInt)
     with Import => True, Convention => StdCall, External_Name => "glColor4ui";

   procedure Color (V : in Bytes_3)
     with Import => True, Convention => StdCall, External_Name => "glColor3bv";
   procedure Color (V : in Bytes_4)
     with Import => True, Convention => StdCall, External_Name => "glColor4bv";
   procedure Color (V : in Shorts_3)
     with Import => True, Convention => StdCall, External_Name => "glColor3sv";
   procedure Color (V : in Shorts_4)
     with Import => True, Convention => StdCall, External_Name => "glColor4sv";
   procedure Color (V : in Ints_3)
     with Import => True, Convention => StdCall, External_Name => "glColor3iv";
   procedure Color (V : in Ints_4)
     with Import => True, Convention => StdCall, External_Name => "glColor4iv";
   procedure Color (V : in Floats_3)
     with Import => True, Convention => StdCall, External_Name => "glColor3fv";
   procedure Color (V : in Floats_4)
     with Import => True, Convention => StdCall, External_Name => "glColor4fv";
   procedure Color (V : in Doubles_3)
     with Import => True, Convention => StdCall, External_Name => "glColor3dv";
   procedure Color (V : in Doubles_4)
     with Import => True, Convention => StdCall, External_Name => "glColor4dv";
   procedure Color (V : in UBytes_3)
     with Import => True, Convention => StdCall, External_Name => "glColor3ubv";
   procedure Color (V : in UBytes_4)
     with Import => True, Convention => StdCall, External_Name => "glColor4ubv";
   procedure Color (V : in UShorts_3)
     with Import => True, Convention => StdCall, External_Name => "glColor3usv";
   procedure Color (V : in UShorts_4)
     with Import => True, Convention => StdCall, External_Name => "glColor4usv";
   procedure Color (V : in UInts_3)
     with Import => True, Convention => StdCall, External_Name => "glColor3uiv";
   procedure Color (V : in UInts_4)
     with Import => True, Convention => StdCall, External_Name => "glColor4uiv";

   ---------------------------------------------------------------------------
   -- Texture coordinates
   procedure Tex_Coord (S : in Short)
     with Import => True, Convention => StdCall,
          External_Name => "glTexCoord1s";

   procedure Tex_Coord (S : in Int)
     with Import => True, Convention => StdCall,
          External_Name => "glTexCoord1i";

   procedure Tex_Coord (S : in Float)
     with Import => True, Convention => StdCall,
          External_Name => "glTexCoord1f";

   procedure Tex_Coord (S : in Double)
     with Import => True, Convention => StdCall,
          External_Name => "glTexCoord1d";

   procedure Tex_Coord (S : in Short;
                        T : in Short)
     with Import => True, Convention => StdCall,
          External_Name => "glTexCoord2s";

   procedure Tex_Coord (S : in Int;
                        T : in Int)
     with Import => True, Convention => StdCall,
          External_Name => "glTexCoord2i";

   procedure Tex_Coord (S : in Float;
                        T : in Float)
     with Import => True, Convention => StdCall,
          External_Name => "glTexCoord2f";

   procedure Tex_Coord (S : in Double;
                        T : in Double)
     with Import => True, Convention => StdCall,
          External_Name => "glTexCoord2d";

   procedure Tex_Coord (S : in Short;
                        T : in Short;
                        R : in Short)
     with Import => True, Convention => StdCall,
          External_Name => "glTexCoord3s";

   procedure Tex_Coord (S : in Int;
                        T : in Int;
                        R : in Int)
     with Import => True, Convention => StdCall,
          External_Name => "glTexCoord3i";

   procedure Tex_Coord (S : in Float;
                        T : in Float;
                        R : in Float)
     with Import => True, Convention => StdCall,
          External_Name => "glTexCoord3f";

   procedure Tex_Coord (S : in Double;
                        T : in Double;
                        R : in Double)
     with Import => True, Convention => StdCall,
          External_Name => "glTexCoord3d";

   procedure Tex_Coord (S : in Short;
                        T : in Short;
                        R : in Short;
                        Q : in Short)
     with Import => True, Convention => StdCall,
          External_Name => "glTexCoord4s";

   procedure Tex_Coord (S : in Int;
                        T : in Int;
                        R : in Int;
                        Q : in Int)
     with Import => True, Convention => StdCall,
          External_Name => "glTexCoord4i";

   procedure Tex_Coord (S : in Float;
                        T : in Float;
                        R : in Float;
                        Q : in Float)
     with Import => True, Convention => StdCall,
          External_Name => "glTexCoord4f";

   procedure Tex_Coord (S : in Double;
                        T : in Double;
                        R : in Double;
                        Q : in Double)
     with Import => True, Convention => StdCall,
          External_Name => "glTexCoord4d";

   procedure Tex_Coord (V : in Shorts_1)
     with Import => True, Convention => StdCall,
          External_Name => "glTexCoord1sv";
   procedure Tex_Coord (V : in Shorts_2)
     with Import => True, Convention => StdCall,
          External_Name => "glTexCoord2sv";
   procedure Tex_Coord (V : in Shorts_3)
     with Import => True, Convention => StdCall,
          External_Name => "glTexCoord3sv";
   procedure Tex_Coord (V : in Shorts_4)
     with Import => True, Convention => StdCall,
          External_Name => "glTexCoord4sv";
   procedure Tex_Coord (V : in Ints_1)
     with Import => True, Convention => StdCall,
          External_Name => "glTexCoord1iv";
   procedure Tex_Coord (V : in Ints_2)
     with Import => True, Convention => StdCall,
          External_Name => "glTexCoord2iv";
   procedure Tex_Coord (V : in Ints_3)
     with Import => True, Convention => StdCall,
          External_Name => "glTexCoord3iv";
   procedure Tex_Coord (V : in Ints_4)
     with Import => True, Convention => StdCall,
          External_Name => "glTexCoord4iv";
   procedure Tex_Coord (V : in Floats_1)
     with Import => True, Convention => StdCall,
          External_Name => "glTexCoord1fv";
   procedure Tex_Coord (V : in Floats_2)
     with Import => True, Convention => StdCall,
          External_Name => "glTexCoord2fv";
   procedure Tex_Coord (V : in Floats_3)
     with Import => True, Convention => StdCall,
          External_Name => "glTexCoord3fv";
   procedure Tex_Coord (V : in Floats_4)
     with Import => True, Convention => StdCall,
          External_Name => "glTexCoord4fv";
   procedure Tex_Coord (V : in Doubles_1)
     with Import => True, Convention => StdCall,
          External_Name => "glTexCoord1dv";
   procedure Tex_Coord (V : in Doubles_2)
     with Import => True, Convention => StdCall,
          External_Name => "glTexCoord2dv";
   procedure Tex_Coord (V : in Doubles_3)
     with Import => True, Convention => StdCall,
          External_Name => "glTexCoord3dv";
   procedure Tex_Coord (V : in Doubles_4)
     with Import => True, Convention => StdCall,
          External_Name => "glTexCoord4dv";

   procedure Multi_Tex_Coord (Target : in Enum;
                              S      : in Double)
     with Import => True, Convention => StdCall,
          External_Name => "glMultiTexCoord1d";

   procedure Multi_Tex_Coord (Target : in Enum;
                              V      : in Doubles)
     with Import => True, Convention => StdCall,
          External_Name => "glMultiTexCoord1dv";

   procedure Multi_Tex_Coord (Target : in Enum;
                              S      : in Float)
     with Import => True, Convention => StdCall,
          External_Name => "glMultiTexCoord1f";

   procedure Multi_Tex_Coord (Target : in Enum;
                              V      : in Floats)
     with Import => True, Convention => StdCall,
          External_Name => "glMultiTexCoord1fv";

   procedure Multi_Tex_Coord (Target : in Enum;
                              S      : in Int)
     with Import => True, Convention => StdCall,
          External_Name => "glMultiTexCoord1i";

   procedure Multi_Tex_Coord (Target : in Enum;
                              V      : in Ints)
     with Import => True, Convention => StdCall,
          External_Name => "glMultiTexCoord1iv";

   procedure Multi_Tex_Coord (Target : in Enum;
                              S      : in Short)
     with Import => True, Convention => StdCall,
          External_Name => "glMultiTexCoord1s";

   procedure Multi_Tex_Coord (Target : in Enum;
                              V      : in Shorts)
     with Import => True, Convention => StdCall,
          External_Name => "glMultiTexCoord1sv";

   procedure Multi_Tex_Coord (Target : in Enum;
                              S      : in Double;
                              T      : in Double)
     with Import => True, Convention => StdCall,
          External_Name => "glMultiTexCoord2d";

   procedure Multi_Tex_Coord_2 (Target : in Enum;
                                V      : in Double)
     with Import => True, Convention => StdCall,
          External_Name => "glMultiTexCoord2dv";

   procedure Multi_Tex_Coord (Target : in Enum;
                              S      : in Float;
                              T      : in Float)
     with Import => True, Convention => StdCall,
          External_Name => "glMultiTexCoord2f";

   procedure Multi_Tex_Coord_2 (Target : in Enum;
                                V      : in Floats)
     with Import => True, Convention => StdCall,
          External_Name => "glMultiTexCoord2fv";

   procedure Multi_Tex_Coord (Target : in Enum;
                              S      : in Int;
                              T      : in Int)
     with Import => True, Convention => StdCall,
          External_Name => "glMultiTexCoord2i";

   procedure Multi_Tex_Coord_2 (Target : in Enum;
                                S      : in Ints)
     with Import => True, Convention => StdCall,
          External_Name => "glMultiTexCoord2iv";

   procedure Multi_Tex_Coord (Target : in Enum;
                              S      : in Short;
                              T      : in Short)
     with Import => True, Convention => StdCall,
          External_Name => "glMultiTexCoord2s";

   procedure Multi_Tex_Coord_2 (Target : in Enum;
                                V      : in Shorts)
     with Import => True, Convention => StdCall,
          External_Name => "glMultiTexCoord2sv";

   procedure Multi_Tex_Coord (Target : in Enum;
                              S      : in Double;
                              T      : in Double;
                              R      : in Double)
     with Import => True, Convention => StdCall,
          External_Name => "glMultiTexCoord3d";

   procedure Multi_Tex_Coord_3 (Target : in Enum;
                                V      : in Doubles)
     with Import => True, Convention => StdCall,
          External_Name => "glMultiTexCoord3dv";

   procedure Multi_Tex_Coord (Target : in Enum;
                              S      : in Float;
                              T      : in Float;
                              R      : in Float)
     with Import => True, Convention => StdCall,
          External_Name => "glMultiTexCoord3f";

   procedure Multi_Tex_Coord_3 (Target : in Enum;
                                V      : in Floats)
     with Import => True, Convention => StdCall,
          External_Name => "glMultiTexCoord3fv";

   procedure Multi_Tex_Coord (Target : in Enum;
                              S      : in Int;
                              T      : in Int;
                              R      : in Int)
     with Import => True, Convention => StdCall,
          External_Name => "glMultiTexCoord3i";

   procedure Multi_Tex_Coord_3 (Target : in Enum;
                                V      : in Ints)
     with Import => True, Convention => StdCall,
          External_Name => "glMultiTexCoord3iv";

   procedure Multi_Tex_Coord (Target : in Enum;
                              S      : in Short;
                              T      : in Short;
                              R      : in Short)
     with Import => True, Convention => StdCall,
          External_Name => "glMultiTexCoord3s";

   procedure Multi_Tex_Coord_3 (Target : in Enum;
                                V      : in Shorts)
     with Import => True, Convention => StdCall,
          External_Name => "glMultiTexCoord3sv";

   procedure Multi_Tex_Coord (Target : in Enum;
                              S      : in Double;
                              T      : in Double;
                              R      : in Double;
                              Q      : in Double)
     with Import => True, Convention => StdCall,
          External_Name => "glMultiTexCoord4d";

   procedure Multi_Tex_Coord_4 (Target : in Enum;
                                V      : in Doubles)
     with Import => True, Convention => StdCall,
          External_Name => "glMultiTexCoord4dv";

   procedure Multi_Tex_Coord (Target : in Enum;
                              S      : in Float;
                              T      : in Float;
                              R      : in Float;
                              Q      : in Float)
     with Import => True, Convention => StdCall,
          External_Name => "glMultiTexCoord4f";

   procedure Multi_Tex_Coord_4 (Target : in Enum;
                                V      : in Floats)
     with Import => True, Convention => StdCall,
          External_Name => "glMultiTexCoord4fv";

   procedure Multi_Tex_Coord (Target : in Enum;
                              S      : in Int;
                              T      : in Int;
                              R      : in Int;
                              Q      : in Int)
     with Import => True, Convention => StdCall,
          External_Name => "glMultiTexCoord4i";

   procedure Multi_Tex_Coord_4 (Target : in Enum;
                                V      : in Ints)
     with Import => True, Convention => StdCall,
          External_Name => "glMultiTexCoord4iv";

   procedure Multi_Tex_Coord (Target : in Enum;
                              S      : in Short;
                              T      : in Short;
                              R      : in Short;
                              Q      : in Short)
     with Import => True, Convention => StdCall,
          External_Name => "glMultiTexCoord4s";

   procedure Multi_Tex_Coord_4 (Target : in Enum;
                                V      : in Shorts)
     with Import => True, Convention => StdCall,
          External_Name => "glMultiTexCoord4sv";

   ---------------------------------------------------------------------------

   procedure Raster_Pos (X : in Short;
                         Y : in Short)
     with Import => True, Convention => StdCall,
          External_Name => "glRasterPos2s";

   procedure Raster_Pos (X : in Int;
                         Y : in Int)
     with Import => True, Convention => StdCall,
          External_Name => "glRasterPos2i";

   procedure Raster_Pos (X : in Float;
                         Y : in Float)
     with Import => True, Convention => StdCall,
          External_Name => "glRasterPos2f";

   procedure Raster_Pos (X : in Double;
                         Y : in Double)
     with Import => True, Convention => StdCall,
          External_Name => "glRasterPos2d";

   procedure Raster_Pos (X : in Short;
                         Y : in Short;
                         Z : in Short)
     with Import => True, Convention => StdCall,
          External_Name => "glRasterPos3s";

   procedure Raster_Pos (X : in Int;
                         Y : in Int;
                         Z : in Int)
     with Import => True, Convention => StdCall,
          External_Name => "glRasterPos3i";

   procedure Raster_Pos (X : in Float;
                         Y : in Float;
                         Z : in Float)
     with Import => True, Convention => StdCall,
          External_Name => "glRasterPos3f";

   procedure Raster_Pos (X : in Double;
                         Y : in Double;
                         Z : in Double)
     with Import => True, Convention => StdCall,
          External_Name => "glRasterPos3d";

   procedure Raster_Pos (X : in Short;
                         Y : in Short;
                         Z : in Short;
                         W : in Short)
     with Import => True, Convention => StdCall,
          External_Name => "glRasterPos4s";

   procedure Raster_Pos (X : in Int;
                         Y : in Int;
                         Z : in Int;
                         W : in Int)
     with Import => True, Convention => StdCall,
          External_Name => "glRasterPos4i";

   procedure Raster_Pos (X : in Float;
                         Y : in Float;
                         Z : in Float;
                         W : in Float)
     with Import => True, Convention => StdCall,
          External_Name => "glRasterPos4f";

   procedure Raster_Pos (X : in Double;
                         Y : in Double;
                         Z : in Double;
                         W : in Double)
     with Import => True, Convention => StdCall,
          External_Name => "glRasterPos4d";

   procedure Raster_Pos (V : in Shorts_2)
     with Import => True, Convention => StdCall,
          External_Name => "glRasterPos2sv";
   procedure Raster_Pos (V : in Shorts_3)
     with Import => True, Convention => StdCall,
          External_Name => "glRasterPos3sv";
   procedure Raster_Pos (V : in Shorts_4)
     with Import => True, Convention => StdCall,
          External_Name => "glRasterPos4sv";
   procedure Raster_Pos (V : in Ints_2)
     with Import => True, Convention => StdCall,
          External_Name => "glRasterPos2iv";
   procedure Raster_Pos (V : in Ints_3)
     with Import => True, Convention => StdCall,
          External_Name => "glRasterPos3iv";
   procedure Raster_Pos (V : in Ints_4)
     with Import => True, Convention => StdCall,
          External_Name => "glRasterPos4fv";
   procedure Raster_Pos (V : in Floats_2)
     with Import => True, Convention => StdCall,
          External_Name => "glRasterPos2fv";
   procedure Raster_Pos (V : in Floats_3)
     with Import => True, Convention => StdCall,
          External_Name => "glRasterPos3fv";
   procedure Raster_Pos (V : in Floats_4)
     with Import => True, Convention => StdCall,
          External_Name => "glRasterPos4fv";
   procedure Raster_Pos (V : in Doubles_2)
     with Import => True, Convention => StdCall,
          External_Name => "glRasterPos2dv";
   procedure Raster_Pos (V : in Doubles_3)
     with Import => True, Convention => StdCall,
          External_Name => "glRasterPos3dv";
   procedure Raster_Pos (V : in Doubles_4)
     with Import => True, Convention => StdCall,
          External_Name => "glRasterPos4dv";

   ---------------------------------------------------------------------------

   procedure Rect (X1 : in Short;
                   Y1 : in Short;
                   X2 : in Short;
                   Y2 : in Short)
     with Import => True, Convention => StdCall, External_Name => "glRects";
   procedure Rect (X1 : in Int;
                   Y1 : in Int;
                   X2 : in Int;
                   Y2 : in Int)
     with Import => True, Convention => StdCall, External_Name => "glRecti";
   procedure Rect (X1 : in Float;
                   Y1 : in Float;
                   X2 : in Float;
                   Y2 : in Float)
     with Import => True, Convention => StdCall, External_Name => "glRectf";
   procedure Rect (X1 : in Double;
                   Y1 : in Double;
                   X2 : in Double;
                   Y2 : in Double)
     with Import => True, Convention => StdCall, External_Name => "glRectd";

   procedure Rect (V1 : in Shorts_2;
                   V2 : in Shorts_2)
     with Import => True, Convention => StdCall, External_Name => "glRectsv";
   procedure Rect (V1 : in Ints_2;
                   V2 : in Ints_2)
     with Import => True, Convention => StdCall, External_Name => "glRectiv";
   procedure Rect (V1 : in Floats_2;
                   V2 : in Floats_2)
     with Import => True, Convention => StdCall, External_Name => "glRectfv";
   procedure Rect (V1 : in Doubles_2;
                   V2 : in Doubles_2)
     with Import => True, Convention => StdCall, External_Name => "glRectdv";

   ---------------------------------------------------------------------------
   -- OpenGL 1.1 vertex subprograms

   procedure Vertex_Pointer    (Size         : in SizeI;
                                Type_Of      : in Enum;
                                Stride       : in SizeI;
                                Data_Pointer : in Pointer)
     with Import => True, Convention => StdCall,
          External_Name => "glVertexPointer";

   procedure Normal_Pointer    (Size         : in SizeI;
                                Stride       : in SizeI;
                                Data_Pointer : in Pointer)
     with Import => True, Convention => StdCall,
          External_Name => "glNormalPointer";

   procedure Color_Pointer     (Size         : in SizeI;
                                Type_Of      : in Enum;
                                Stride       : in SizeI;
                                Data_Pointer : in Pointer)
     with Import => True, Convention => StdCall,
          External_Name => "glColorPointer";

   procedure Index_Pointer     (Type_Of      : in Enum;
                                Stride       : in SizeI;
                                Data_Pointer : in Pointer)
     with Import => True, Convention => StdCall,
          External_Name => "glIndexPointer";

   procedure Tex_Coord_Pointer (Size         : in SizeI;
                                Type_Of      : in Enum;
                                Stride       : in SizeI;
                                Data_Pointer : in Pointer)
     with Import => True, Convention => StdCall,
          External_Name => "glTexCoordPointer";

   procedure Edge_Flag_Pointer (Stride       : in SizeI;
                                Data_Pointer : in Pointer)
     with Import => True, Convention => StdCall,
          External_Name => "glEdgeFlagPointer";

   procedure Get_Pointer       (PName        : in  Enum;
                                Data_Pointer : out Pointer)
     with Import => True, Convention => StdCall,
          External_Name => "glGetPointerv";

   procedure Array_Element     (I            : in Int)
     with Import => True, Convention => StdCall,
          External_Name => "glArrayElement";

   procedure Draw_Arrays       (Mode         : in Enum;
                                First        : in Int;
                                Count        : in SizeI)
     with Import => True, Convention => StdCall,
          External_Name => "glDrawArrays";

   procedure Draw_Elements     (Mode         : in Enum;
                                Count        : in SizeI;
                                Index_Type   : in Enum;
                                Indices      : in Pointer)
     with Import => True, Convention => StdCall,
          External_Name => "glDrawElements";

   procedure Draw_Range_Elements (Mode    : in Enum;
                                  Start   : in UInt;
                                  End_Of  : in UInt;
                                  Count   : in SizeI;
                                  Type_Of : in Enum;
                                  Indices : in Pointer)
     with Import => True, Convention => StdCall,
          External_Name => "glDrawRangeElements";

   procedure Interleaved_Arrays (Format      : in Enum;
                                 Stride      : in SizeI;
                                 Data_Pointer : in Pointer)
     with Import => True, Convention => StdCall,
          External_Name => "glInterleavedArrays";

   ---------------------------------------------------------------------------
   -- Lighting and materials

   procedure Light (Light : in Enum;
                    PName : in Enum;
                    Param : in Float)
     with Import => True, Convention => StdCall, External_Name => "glLightf";
   procedure Light (Light  : in Enum;
                    PName  : in Enum;
                    Params : in Floats_1)
     with Import => True, Convention => StdCall, External_Name => "glLightfv";
   procedure Light (Light  : in Enum;
                    PName  : in Enum;
                    Params : in Floats_3)
     with Import => True, Convention => StdCall, External_Name => "glLightfv";
   procedure Light (Light  : in Enum;
                    PName  : in Enum;
                    Params : in Floats_4)
     with Import => True, Convention => StdCall, External_Name => "glLightfv";
   procedure Light (Light : in Enum;
                    PName : in Enum;
                    Param : in Int)
     with Import => True, Convention => StdCall, External_Name => "glLighti";
   procedure Light (Light  : in Enum;
                    PName  : in Enum;
                    Params : in Ints_1)
     with Import => True, Convention => StdCall, External_Name => "glLightiv";
   procedure Light (Light  : in Enum;
                    PName  : in Enum;
                    Params : in Ints_3)
     with Import => True, Convention => StdCall, External_Name => "glLightiv";
   procedure Light (Light  : in Enum;
                    PName  : in Enum;
                    Params : in Ints_4)
     with Import => True, Convention => StdCall, External_Name => "glLightiv";

   procedure Get_Light (Light  : in Enum;
                        PName  : in Enum;
                        Param  : in Int)
     with Import => True, Convention => StdCall,
          External_Name => "glGetLightiv";
   procedure Get_Light (Light  : in Enum;
                        PName  : in Enum;
                        Params : in Ints_1)
     with Import => True, Convention => StdCall,
          External_Name => "glGetLightiv";
   procedure Get_Light (Light  : in Enum;
                        PName  : in Enum;
                        Params : in Ints_3)
     with Import => True, Convention => StdCall,
          External_Name => "glGetLightiv";
   procedure Get_Light (Light  : in Enum;
                        PName  : in Enum;
                        Params : in Ints_4)
     with Import => True, Convention => StdCall,
          External_Name => "glGetLightiv";
   procedure Get_Light (Light  : in Enum;
                        PName  : in Enum;
                        Param  : in Float)
     with Import => True, Convention => StdCall,
          External_Name => "glGetLightfv";
   procedure Get_Light (Light  : in Enum;
                        PName  : in Enum;
                        Params : in Floats_1)
     with Import => True, Convention => StdCall,
          External_Name => "glGetLightfv";
   procedure Get_Light (Light  : in Enum;
                        PName  : in Enum;
                        Params : in Floats_3)
     with Import => True, Convention => StdCall,
          External_Name => "glGetLightfv";
   procedure Get_Light (Light  : in Enum;
                        PName  : in Enum;
                        Params : in Floats_4)
     with Import => True, Convention => StdCall,
          External_Name => "glGetLightfv";

   procedure Light_Model (PName  : in Enum;
                          Param  : in Int)
     with Import => True, Convention => StdCall,
          External_Name => "glLightModeli";
   procedure Light_Model (PName  : in Enum;
                          Params : in Ints_1)
     with Import => True, Convention => StdCall,
          External_Name => "glLightModeliv";
   procedure Light_Model (PName  : in Enum;
                          Params : in Ints_4)
     with Import => True, Convention => StdCall,
          External_Name => "glLightModeliv";
   procedure Light_Model (PName  : in Enum;
                          Param  : in Float)
     with Import => True, Convention => StdCall,
          External_Name => "glLightModelf";
   procedure Light_Model (PName  : in Enum;
                          Params : in Floats_1)
     with Import => True, Convention => StdCall,
          External_Name => "glLightModelfv";
   procedure Light_Model (PName  : in Enum;
                          Params : in Floats_4)
     with Import => True, Convention => StdCall,
          External_Name => "glLightModelfv";

   procedure Material (Face   : in Enum;
                       PName  : in Enum;
                       Param  : in Int)
     with Import => True, Convention => StdCall, External_Name => "glMateriali";
   procedure Material (Face   : in Enum;
                       PName  : in Enum;
                       Params : in Ints_1)
     with Import => True, Convention => StdCall,
          External_Name => "glMaterialiv";
   procedure Material (Face   : in Enum;
                       PName  : in Enum;
                       Params : in Ints_3)
     with Import => True, Convention => StdCall,
          External_Name => "glMaterialiv";
   procedure Material (Face   : in Enum;
                       PName  : in Enum;
                       Params : in Ints_4)
     with Import => True, Convention => StdCall,
          External_Name => "glMaterialiv";
   procedure Material (Face   : in Enum;
                       PName  : in Enum;
                       Param  : in Float)
     with Import => True, Convention => StdCall, External_Name => "glMaterialf";
   procedure Material (Face   : in Enum;
                       PName  : in Enum;
                       Params : in Floats_1)
     with Import => True, Convention => StdCall,
          External_Name => "glMaterialfv";
   procedure Material (Face   : in Enum;
                       PName  : in Enum;
                       Params : in Floats_3)
     with Import => True, Convention => StdCall,
          External_Name => "glMaterialfv";
   procedure Material (Face   : in Enum;
                       PName  : in Enum;
                       Params : in Floats_4)
     with Import => True, Convention => StdCall,
          External_Name => "glMaterialfv";

   procedure Get_Material (Face   : in Enum;
                           PName  : in Enum;
                           Param  : in Int)
     with Import => True, Convention => StdCall,
          External_Name => "glGetMaterialiv";
   procedure Get_Material (Face   : in Enum;
                           PName  : in Enum;
                           Params : in Ints_1)
     with Import => True, Convention => StdCall,
          External_Name => "glGetMaterialiv";
   procedure Get_Material (Face   : in Enum;
                           PName  : in Enum;
                           Params : in Ints_3)
     with Import => True, Convention => StdCall,
          External_Name => "glGetMaterialiv";
   procedure Get_Material (Face   : in Enum;
                           PName  : in Enum;
                           Params : in Ints_4)
     with Import => True, Convention => StdCall,
          External_Name => "glGetMaterialiv";
   procedure Get_Material (Face   : in Enum;
                           PName  : in Enum;
                           Param  : in Float)
     with Import => True, Convention => StdCall,
          External_Name => "glGetMaterialfv";
   procedure Get_Material (Face   : in Enum;
                           PName  : in Enum;
                           Params : in Floats_1)
     with Import => True, Convention => StdCall,
          External_Name => "glGetMaterialfv";
   procedure Get_Material (Face   : in Enum;
                           PName  : in Enum;
                           Params : in Floats_3)
     with Import => True, Convention => StdCall,
          External_Name => "glGetMaterialfv";
   procedure Get_Material (Face   : in Enum;
                           PName  : in Enum;
                           Params : in Floats_4)
     with Import => True, Convention => StdCall,
          External_Name => "glGetMaterialfv";

   procedure Color_Material (Face : in Enum;
                             Mode : in Enum)
     with Import => True, Convention => StdCall,
          External_Name => "glColorMaterial";

   ---------------------------------------------------------------------------
   -- Raster functions

   procedure Pixel_Zoom (X_Factor : in Float;
                         Y_Factor : in Float)
     with Import => True, Convention => StdCall, External_Name => "glPixelZoom";

   procedure Pixel_Store (PName : in Enum;
                          Param : in Int)
     with Import => True, Convention => StdCall,
          External_Name => "glPixelStorei";
   procedure Pixel_Store (PName : in Enum;
                          Param : in Float)
     with Import => True, Convention => StdCall,
          External_Name => "glPixelStoref";

   procedure Pixel_Transfer (PName : in Enum;
                             Param : in Int)
     with Import => True, Convention => StdCall,
          External_Name => "glPixelTransferi";
   procedure Pixel_Transfer (PName : in Enum;
                             Param : in Float)
     with Import => True, Convention => StdCall,
          External_Name => "glPixelTransferf";

   procedure Pixel_Map (Map    : in Enum;
                        Values : in UShorts)
     with Import => True, Convention => StdCall,
          External_Name => "glPixelMapusv";
   procedure Pixel_Map (Map    : in Enum;
                        Values : in UInts)
     with Import => True, Convention => StdCall,
          External_Name => "glPixelMapuiv";
   procedure Pixel_Map (Map    : in Enum;
                        Values : in Floats)
     with Import => True, Convention => StdCall,
          External_Name => "glPixelMapfv";

   procedure Get_Pixel_Map (Map    : in Enum;
                            Values : in UShorts)
     with Import => True, Convention => StdCall,
          External_Name => "glGetPixelMapusv";
   procedure Get_Pixel_Map (Map    : in Enum;
                            Values : in UInts)
     with Import => True, Convention => StdCall,
          External_Name => "glGetPixelMapuiv";
   procedure Get_Pixel_Map (Map    : in Enum;
                            Values : in Floats)
     with Import => True, Convention => StdCall,
          External_Name => "glGetPixelMapfv";

   procedure Bit_Map (Width  : in SizeI;
                      Height : in SizeI;
                      X_Orig : in Float;
                      Y_Orig : in Float;
                      X_Move : in Float;
                      Y_Move : in Float;
                      Bitmap : in UBytes)
     with Import => True, Convention => StdCall, External_Name => "glBitMap";

   procedure Read_Pixels (X      : in Int;
                          Y      : in Int;
                          Width  : in SizeI;
                          Height : in SizeI;
                          Format : in Enum;
                          C_Type : in Enum;
                          Pixels : in Pointer)
     with Import => True, Convention => StdCall,
          External_Name => "glReadPixels";

   procedure Draw_Pixels (Width   : in SizeI;
                          Height  : in SizeI;
                          Format  : in Enum;
                          Type_Of : in Enum;
                          Pixels  : in Pointer)
     with Import => True, Convention => StdCall,
          External_Name => "glDrawPixels";

   procedure Copy_Pixels (X       : in Int;
                          Y       : in Int;
                          Width   : in SizeI;
                          Height  : in SizeI;
                          Type_Of : in Enum)
     with Import => True, Convention => StdCall,
          External_Name => "glCopyPixels";

   ---------------------------------------------------------------------------
   -- Stenciling
   procedure Stencil_Func (Func : in Enum;
                           Ref  : in Int;
                           Mask : in UInt)
     with Import => True, Convention => StdCall,
          External_Name => "glStencilFunc";

   procedure Stencil_Mask (Mask : in UInt)
     with Import => True, Convention => StdCall,
          External_Name => "glStencilMask";

   procedure Stencil_Op (Fail   : in Enum;
                         Z_Fail : in Enum;
                         Z_Pass : in Enum)
     with Import => True, Convention => StdCall, External_Name => "glStencilOp";

   procedure Clear_Stencil (S : in Int)
     with Import => True, Convention => StdCall,
          External_Name => "glClearStencil";

   ---------------------------------------------------------------------------

   function Get_String (Name  : Enum;
                        Index : Int) return String;

   -- Blending
   procedure Blend_Color (Red   : in ClampF;
                          Green : in ClampF;
                          Blue  : in ClampF;
                          Alpha : in ClampF)
     with Import => True, Convention => StdCall,
          External_Name => "glBlendColor";

   procedure Blend_Equation (Mode : in Enum)
     with Import => True, Convention => StdCall,
          External_Name => "glBlendEquation";

   procedure Shade_Model (Mode : in Enum)
     with Import => True, Convention => StdCall,
          External_Name => "glShadeModel";

   -- Texturing
   procedure Active_Texture (Texture : in Enum) -- v1.3
     with Import => True, Convention => StdCall,
          External_Name => "glActiveTexture";

   procedure Client_Active_Texture (Texture : in Enum)
     with Import => True, Convention => StdCall,
          External_Name => "glClientActiveTexture";

   procedure Bind_Texture (Target  : in Enum;
                           Texture : in UInt)
     with Import => True, Convention => StdCall,
          External_Name => "glBindTexture";

   procedure Gen_Textures (N        : in SizeI;
                           Textures : in Pointer)
     with Import => True, Convention => StdCall,
          External_Name => "glGenTextures";

   procedure Delete_Textures (N        : in SizeI;
                              Textures : in Pointer)
     with Import => True, Convention => StdCall,
          External_Name => "glDeleteTextures";

   procedure Tex_Gen (Coord : in Enum;
                      PName : in Enum;
                      Param : in Int)
     with Import => True, Convention => StdCall, External_Name => "glTexGeni";

   procedure Tex_Gen (Coord : in Enum;
                      PName : in Enum;
                      Param : in Float)
     with Import => True, Convention => StdCall, External_Name => "glTexGenf";

   procedure Tex_Gen (Coord : in Enum;
                      PName : in Enum;
                      Param : in Double)
     with Import => True, Convention => StdCall, External_Name => "glTexGend";

   procedure Tex_Gen (Coord  : in Enum;
                      PName  : in Enum;
                      Params : in Ints_1)
     with Import => True, Convention => StdCall, External_Name => "glTexGeniv";

   procedure Tex_Gen (Coord  : in Enum;
                      PName  : in Enum;
                      Params : in Ints_4)
     with Import => True, Convention => StdCall, External_Name => "glTexGeniv";

   procedure Tex_Gen (Coord  : in Enum;
                      PName  : in Enum;
                      Params : in Floats_1)
     with Import => True, Convention => StdCall, External_Name => "glTexGenfv";

   procedure Tex_Gen (Coord  : in Enum;
                      PName  : in Enum;
                      Params : in Floats_4)
     with Import => True, Convention => StdCall, External_Name => "glTexGenfv";

   procedure Tex_Gen (Coord  : in Enum;
                      PName  : in Enum;
                      Params : in Doubles_1)
     with Import => True, Convention => StdCall, External_Name => "glTexGendv";

   procedure Tex_Gen (Coord  : in Enum;
                      PName  : in Enum;
                      Params : in Doubles_4)
     with Import => True, Convention => StdCall, External_Name => "glTexGendv";

   procedure Get_Tex_Gen (Coord  : in Enum;
                          PName  : in Enum;
                          Params : in Ints_1)
     with Import => True, Convention => StdCall,
          External_Name => "glGetTexGeniv";

   procedure Get_Tex_Gen (Coord  : in Enum;
                          PName  : in Enum;
                          Params : in Ints_4)
     with Import => True, Convention => StdCall,
          External_Name => "glGetTexGeniv";

   procedure Get_Tex_Gen (Coord  : in Enum;
                          PName  : in Enum;
                          Params : in Floats_1)
     with Import => True, Convention => StdCall,
          External_Name => "glGetTexGenfv";

   procedure Get_Tex_Gen (Coord  : in Enum;
                          PName  : in Enum;
                          Params : in Floats_4)
     with Import => True, Convention => StdCall,
          External_Name => "glGetTexGenfv";

   procedure Get_Tex_Gen (Coord  : in Enum;
                          PName  : in Enum;
                          Params : in Doubles_1)
     with Import => True, Convention => StdCall,
          External_Name => "glGetTexGendv";

   procedure Get_Tex_Gen (Coord  : in Enum;
                          PName  : in Enum;
                          Params : in Doubles_4)
     with Import => True, Convention => StdCall,
          External_Name => "glGetTexGen";

   procedure Tex_Env (Target : in Enum;
                      PName  : in Enum;
                      Param  : in Int)
     with Import => True, Convention => StdCall, External_Name => "glTexEnvi";

   procedure Tex_Env (Target : in Enum;
                      PName  : in Enum;
                      Param  : in Float)
     with Import => True, Convention => StdCall, External_Name => "glTexEnvf";

   procedure Tex_Env (Target : in Enum;
                      PName  : in Enum;
                      Params : in Ints_1)
     with Import => True, Convention => StdCall, External_Name => "glTexEnviv";

   procedure Tex_Env (Target : in Enum;
                      PName  : in Enum;
                      Params : in Ints_4)
     with Import => True, Convention => StdCall, External_Name => "glTexEnviv";

   procedure Tex_Env (Target : in Enum;
                      PName  : in Enum;
                      Params : in Floats_1)
     with Import => True, Convention => StdCall, External_Name => "glTexEnvif";

   procedure Tex_Env (Target : in Enum;
                      PName  : in Enum;
                      Params : in Floats_4)
     with Import => True, Convention => StdCall, External_Name => "glTexEnvif";

   procedure Get_Tex_Env (Target : in     Enum;
                          PName  : in     Enum;
                          Params :    out Float)
     with Import => True, Convention => StdCall,
          External_Name => "glGetTexEnvfv";

   procedure Get_Tex_Env (Target : in     Enum;
                          PName  : in     Enum;
                          Params :    out Floats_1)
     with Import => True, Convention => StdCall,
          External_Name => "glGetTexEnvfv";

   procedure Get_Tex_Env (Target : in     Enum;
                          PName  : in     Enum;
                          Params :    out Floats_4)
     with Import => True, Convention => StdCall,
          External_Name => "glGetTexEnvfv";

   procedure Get_Tex_Env (Target : in     Enum;
                          PName  : in     Enum;
                          Params :    out Int)
     with Import => True, Convention => StdCall,
          External_Name => "glGetTexEnviv";

   procedure Get_Tex_Env (Target : in     Enum;
                          PName  : in     Enum;
                          Params :    out Ints_1)
     with Import => True, Convention => StdCall,
          External_Name => "glGetTexEnviv";

   procedure Get_Tex_Env (Target : in     Enum;
                          PName  : in     Enum;
                          Params :    out Ints_4)
     with Import => True, Convention => StdCall,
          External_Name => "glGetTexEnviv";

   procedure Tex_Parameter (Target : in Enum;
                            PName  : in Enum;
                            Param  : in Int)
     with Import => True, Convention => StdCall,
          External_Name => "glTexParameteri";

   procedure Tex_Parameter (Target : in Enum;
                            PName  : in Enum;
                            Param  : in Float)
     with Import => True, Convention => StdCall,
          External_Name => "glTexParameterf";

   procedure Tex_Parameter (Target : in Enum;
                            PName  : in Enum;
                            Param  : in Floats)
     with Import => True, Convention => StdCall,
          External_Name => "glTexParameterfv";

   procedure Tex_Parameter (Target : in Enum;
                            PName  : in Enum;
                            Param  : in Ints)
     with Import => True, Convention => StdCall,
          External_Name => "glTexParameteriv";

   procedure Get_Tex_Parameter (Target : in     Enum;
                                PName  : in     Enum;
                                Params :    out Float)
     with Import => True, Convention => StdCall,
          External_Name => "glGetTexParameterfv";

   procedure Get_Tex_Parameter (Target : in     Enum;
                                PName  : in     Enum;
                                Params :    out Floats_1)
     with Import => True, Convention => StdCall,
          External_Name => "glGetTexParameterfv";

   procedure Get_Tex_Parameter (Target : in     Enum;
                                PName  : in     Enum;
                                Params :    out Floats_4)
     with Import => True, Convention => StdCall,
          External_Name => "glGetTexParameterfv";

   procedure Get_Tex_Parameter (Target : in     Enum;
                                PName  : in     Enum;
                                Params :    out Int)
     with Import => True, Convention => StdCall,
          External_Name => "glGetTexParameteriv";

   procedure Get_Tex_Parameter (Target : in     Enum;
                                PName  : in     Enum;
                                Params :    out Ints_1)
     with Import => True, Convention => StdCall,
          External_Name => "glGetTexParameteriv";

   procedure Get_Tex_Parameter (Target : in     Enum;
                                PName  : in     Enum;
                                Params :    out Ints_4)
     with Import => True, Convention => StdCall,
          External_Name => "glGetTexParameteriv";

   procedure Get_Tex_Level_Parameter (Target : in     Enum;
                                      PName  : in     Enum;
                                      Params :    out Floats)
     with Import => True, Convention => StdCall,
          External_Name => "glGetTexLevelParameterfv";

   procedure Get_Tex_Level_Parameter (Target : in     Enum;
                                      PName  : in     Enum;
                                      Params :    out Ints)
     with Import => True, Convention => StdCall,
          External_Name => "glGetTexLevelParameteriv";

   -- Texture images
   procedure Tex_Image (Target          : in Enum;
                        Level           : in Int;
                        Internal_Format : in Enum;
                        Width           : in SizeI;
                        Border          : in Int;
                        Format          : in Enum;
                        Pixel_Type      : in Enum;
                        Pixels          : in Pointer)
     with Import => True, Convention => StdCall,
          External_Name => "glTexImage1D";

   procedure Tex_Image (Target          : in Enum;
                        Level           : in Int;
                        Internal_Format : in Enum;
                        Width           : in SizeI;
                        Height          : in SizeI;
                        Border          : in Int;
                        Format          : in Enum;
                        Pixel_Type      : in Enum;
                        Pixels          : in Pointer)
     with Import => True, Convention => StdCall,
          External_Name => "glTexImage2D";

   procedure Get_Tex_Image (Target  : in Enum;
                            Level   : in Int;
                            Format  : in Enum;
                            Type_Of : in Enum;
                            Pixels  : in Pointer)
     with Import => True, Convention => StdCall,
          External_Name => "glGetTexImage";

   procedure Tex_Image (Target          : in Enum;
                        Level           : in Int;
                        Internal_Format : in Int;
                        Width           : in SizeI;
                        Height          : in SizeI;
                        Depth           : in SizeI;
                        Border          : in Int;
                        Format          : in Enum;
                        Pixel_Type      : in Enum;
                        Pixels          : in Pointer)
     with Import => True, Convention => StdCall,
          External_Name => "glTexImage3D";

   procedure Prioritize_Textures (N          : in SizeI;
                                  Textures   : in UInts;
                                  Priorities : in ClampFs)
     with Import => True, Convention => StdCall,
          External_Name => "glPrioritizeTextures";

   procedure Are_Textures_Resident (N          : in     SizeI;
                                    Textures   : in     UInts;
                                    Residences :    out Bools)
     with Import => True, Convention => StdCall,
          External_Name => "glAreTexturesResident";

   function Is_Texture (Texture : in UInt) return Bool
     with Import => True, Convention => StdCall, External_Name => "glIsTexture";

   procedure Tex_Sub_Image (Target     : in Enum;
                            Level      : in Int;
                            X_Offset   : in Int;
                            Width      : in SizeI;
                            Format     : in Enum;
                            Pixel_Type : in Enum;
                            Pixels     : in Pointer)
     with Import => True, Convention => StdCall,
          External_Name => "glTexSubImage1D";

   procedure Tex_Sub_Image (Target     : in Enum;
                            Level      : in Int;
                            X_Offset   : in Int;
                            Y_Offset   : in Int;
                            Width      : in SizeI;
                            Height     : in SizeI;
                            Format     : in Enum;
                            Pixel_Type : in Enum;
                            Pixels     : in Pointer)
     with Import => True, Convention => StdCall,
          External_Name => "glTexSubImage2D";

   procedure Tex_Sub_Image (Target     : in Enum;
                            Level      : in Int;
                            X_Offset   : in Int;
                            Y_Offset   : in Int;
                            Z_Offset   : in Int;
                            Width      : in SizeI;
                            Height     : in SizeI;
                            Depth      : in SizeI;
                            Format     : in Enum;
                            Pixel_Type : in Enum;
                            Pixels     : in Pointer)
     with Import => True, Convention => StdCall,
          External_Name => "glTexSubImage3D";

   procedure Copy_Tex_Image (Target          : in Enum;
                             Level           : in Int;
                             Internal_Format : in Enum;
                             X               : in Int;
                             Y               : in Int;
                             Width           : in SizeI;
                             Border          : in Int)
     with Import => True, Convention => StdCall,
          External_Name => "glCopyTexImage1D";

   procedure Copy_Tex_Image (Target          : in Enum;
                             Level           : in Int;
                             Internal_Format : in Enum;
                             X               : in Int;
                             Y               : in Int;
                             Width           : in SizeI;
                             Height          : in SizeI;
                             Border          : in Int)
     with Import => True, Convention => StdCall,
          External_Name => "glCopyTexImage2D";

   procedure Copy_Tex_Sub_Image (Target   : in Enum;
                                 Level    : in Int;
                                 X_Offset : in Int;
                                 X        : in Int;
                                 Y        : in Int;
                                 Width    : in SizeI)
     with Import => True, Convention => StdCall,
          External_Name => "glCopySubTexImage1D";

   procedure Copy_Tex_Sub_Image (Target   : in Enum;
                                 Level    : in Int;
                                 X_Offset : in SizeI;
                                 Y_Offset : in SizeI;
                                 X        : in Int;
                                 Y        : in Int;
                                 Width    : in SizeI;
                                 Height   : in SizeI)
     with Import => True, Convention => StdCall,
          External_Name => "glCopySubTexImage2D";

   procedure Copy_Tex_Sub_Image (Target   : in Enum;
                                 Level    : in Int;
                                 X_Offset : in Int;
                                 Y_Offset : in Int;
                                 Z_Offset : in Int;
                                 X        : in Int;
                                 Y        : in Int;
                                 Width    : in SizeI;
                                 Height   : in SizeI)
     with Import => True, Convention => StdCall,
          External_Name => "glCopyTexSubImage3D";

   procedure Compressed_Tex_Image (Target          : in Enum;
                                   Level           : in Int;
                                   Internal_Format : in Enum;
                                   Width           : in SizeI;
                                   Border          : in Int;
                                   Image_Size      : in SizeI;
                                   Data            : in Pointer)
     with Import => True, Convention => StdCall,
          External_Name => "glCompressedTexImage1D";

   procedure Compressed_Tex_Image (Target          : in Enum;
                                   Level           : in Int;
                                   Internal_Format : in Enum;
                                   Width           : in SizeI;
                                   Height          : in SizeI;
                                   Border          : in Int;
                                   Image_Size      : in SizeI;
                                   Data            : in Pointer)
     with Import => True, Convention => StdCall,
          External_Name => "glCompressedTexImage2D";

   procedure Compressed_Tex_Image (Target          : in Enum;
                                   Level           : in Int;
                                   Internal_Format : in Enum;
                                   Width           : in SizeI;
                                   Height          : in SizeI;
                                   Depth           : in SizeI;
                                   Border          : in Int;
                                   Image_Size      : in SizeI;
                                   Data            : in Pointer)
     with Import => True, Convention => StdCall,
          External_Name => "glCompressedTexImage3D";

   procedure Compressed_Tex_Sub_Image (Target     : in Enum;
                                       Level      : in Int;
                                       X_Offset   : in Int;
                                       Width      : in SizeI;
                                       Format     : in Enum;
                                       Image_Size : in SizeI;
                                       Data       : in Pointer)
     with Import => True, Convention => StdCall,
          External_Name => "glCompressedTexSubImage1D";

   procedure Compressed_Tex_Sub_Image (Target     : in Enum;
                                       Level      : in Int;
                                       X_Offset   : in Int;
                                       Y_Offset   : in Int;
                                       Width      : in SizeI;
                                       Height     : in SizeI;
                                       Format     : in Enum;
                                       Image_Size : in SizeI;
                                       Data       : in Pointer)
     with Import => True, Convention => StdCall,
          External_Name => "glCompressedTexSubImage2D";

   procedure Compressed_Tex_Sub_Image (Target     : in Enum;
                                       Level      : in Int;
                                       X_Offset   : in Int;
                                       Y_Offset   : in Int;
                                       Z_Offset   : in Int;
                                       Width      : in SizeI;
                                       Height     : in SizeI;
                                       Depth      : in SizeI;
                                       Format     : in Enum;
                                       Image_Size : in SizeI;
                                       Data       : in Pointer)
     with Import => True, Convention => StdCall,
          External_Name => "glCompressedTexSubImage3D";

   procedure Get_Compressed_Tex_Image (Target : in Enum;
                                       LOD    : in Int;
                                       Pixels : in Pointer)
     with Import => True, Convention => StdCall,
          External_Name => "glGetCompressedTexImage";

   procedure Tex_Coord_Pointer (Size    : in SizeI;
                                Type_Of : in Enum;
                                Stride  : in SizeI;
                                Offset  : in SizeI)
     with Import => True, Convention => StdCall,
          External_Name => "glTexCoordPointer";

   -- Evaluators
   procedure Map (Target : in Enum;
                  U1     : in Float;
                  U2     : in Float;
                  Stride : in Int;
                  Order  : in Int;
                  Points : in Pointer)
     with Import => True, Convention => StdCall, External_Name => "glMap1f";
   procedure Map (Target : in Enum;
                  U1     : in Double;
                  U2     : in Double;
                  Stride : in Int;
                  Order  : in Int;
                  Points : in Pointer)
     with Import => True, Convention => StdCall, External_Name => "glMap1d";

   procedure Map (Target  : in Enum;
                  U1      : in Float;
                  U2      : in Float;
                  UStride : in Int;
                  UOrder  : in Int;
                  V1      : in Float;
                  V2      : in Float;
                  VStride : in Int;
                  VOrder  : in Int;
                  Points  : in Pointer)
     with Import => True, Convention => StdCall, External_Name => "glMap2f";
   procedure Map (Target  : in Enum;
                  U1      : in Double;
                  U2      : in Double;
                  UStride : in Int;
                  UOrder  : in Int;
                  V1      : in Double;
                  V2      : in Double;
                  VStride : in Int;
                  VOrder  : in Int;
                  Points  : in Pointer)
     with Import => True, Convention => StdCall, External_Name => "glMap2d";

   procedure Get_Map (Target : in     Enum;
                      Query  : in     Enum;
                      V      :    out Doubles)
     with Import => True, Convention => StdCall, External_Name => "glGetMapdv";

   procedure Get_Map (Target : in     Enum;
                      Query  : in     Enum;
                      V      :    out Floats)
     with Import => True, Convention => StdCall, External_Name => "glGetMapfv";

   procedure Get_Map (Target : in     Enum;
                      Query  : in     Enum;
                      V      :    out Ints)
     with Import => True, Convention => StdCall, External_Name => "glGetMapiv";

   procedure Eval_Coord (U : in Double)
     with Import => True, Convention => StdCall,
          External_Name => "glEvalCoord1d";

   procedure Eval_Coord (U : in Float)
     with Import => True, Convention => StdCall,
          External_Name => "glEvalCoord1f";

   procedure Eval_Coord (U : in Doubles)
     with Import => True, Convention => StdCall,
          External_Name => "glEvalCoord1dv";

   procedure Eval_Coord (U : in Floats)
     with Import => True, Convention => StdCall,
          External_Name => "glEvalCoord1fv";

   procedure Eval_Coord (U : in Double;
                         V : in Double)
     with Import => True, Convention => StdCall,
          External_Name => "glEvalCoord2d";

   procedure Eval_Coord (U : in Float;
                         V : in Float)
     with Import => True, Convention => StdCall,
          External_Name => "glEvalCoord2f";

   procedure Eval_Coord_2 (U : in Doubles)
     with Import => True, Convention => StdCall,
          External_Name => "glEvalCoord2dv";

   procedure Eval_Coord_2 (U : in Floats)
     with Import => True, Convention => StdCall,
          External_Name => "glEvalCoord2fv";

   procedure Map_Grid (Un : in Int;
                       U1 : in Float;
                       U2 : in Float)
     with Import => True, Convention => StdCall, External_Name => "glMapGrid1f";

   procedure Map_Grid (Un : in Int;
                       U1 : in Double;
                       U2 : in Double)
     with Import => True, Convention => StdCall, External_Name => "glMapGrid1d";

   procedure Map_Grid (Un : in Int;
                       U1 : in Float;
                       U2 : in Float;
                       Vn : in Int;
                       V1 : in Float;
                       V2 : in Float)
     with Import => True, Convention => StdCall, External_Name => "glMapGrid2f";

   procedure Map_Grid (Un : in Int;
                       U1 : in Double;
                       U2 : in Double;
                       Vn : in Int;
                       V1 : in Double;
                       V2 : in Double)
     with Import => True, Convention => StdCall, External_Name => "glMapGrid2d";

   procedure Eval_Point (I : in Int)
     with Import => True, Convention => StdCall,
          External_Name => "glEvalPoint1";
   procedure Eval_Point (I : in Int;
                         J : in Int)
     with Import => True, Convention => StdCall,
          External_Name => "glEvalPoint2";

   procedure Eval_Mesh (Mode : in Enum;
                        I1   : in Int;
                        I2   : in Int)
     with Import => True, Convention => StdCall, External_Name => "glEvalMesh1";
   procedure Eval_Mesh (Mode : in Enum;
                        I1   : in Int;
                        I2   : in Int;
                        J1   : in Int;
                        J2   : in Int)
     with Import => True, Convention => StdCall, External_Name => "glEvalMesh2";

   -- Fog
   procedure Fog (PName : in Enum;
                  Param : in Float)
     with Import => True, Convention => StdCall, External_Name => "glFogf";

   procedure Fog (Pname : in Enum;
                  Param : in Int)
     with Import => True, Convention => StdCall, External_Name => "glFogi";

   procedure Fog (PName  : in Enum;
                  Params : in Floats)
     with Import => True, Convention => StdCall, External_Name => "glFogfv";

   procedure Fog (PName  : in Enum;
                  Params : in Ints)
     with Import => True, Convention => StdCall, External_Name => "glFogiv";

   -- Selection and Feedback
   procedure Feedback_Buffer (Size    : in     SizeI;
                              Type_Of : in     Enum;
                              Buffer  :    out Floats)
     with Import => True, Convention => StdCall,
          External_Name => "glFeedbackBuffer";

   procedure Pass_Through (Token : in Float)
     with Import => True, Convention => StdCall,
          External_Name => "glPassThrough";

   procedure Select_Buffer (Size   : in     SizeI;
                            Buffer :    out UInts)
     with Import => True, Convention => StdCall,
          External_Name => "glSelectBuffer";

   procedure Init_Name
     with Import => True, Convention => StdCall, External_Name => "glInitNames";

   procedure Load_Name (Name : in UInt)
     with Import => True, Convention => StdCall, External_Name => "glLoadName";

   procedure Push_Name (Name : in UInt)
     with Import => True, Convention => StdCall, External_Name => "glPushName";

   procedure Pop_Name
     with Import => True, Convention => StdCall, External_Name => "glPopName";

   -- Buffer objects v2.1???
   procedure Gen_Framebuffers (N    : in SizeI;
                               FBOs : in Pointer)
     with Import => True, Convention => StdCall,
          External_Name => "glGenFramebuffers";

   procedure Bind_Framebuffer (Target : in Enum;
                               FBO    : in UInt)
     with Import => True, Convention => StdCall,
          External_Name => "glBindFramebuffer";

   -- Vertex buffer stuff:
   procedure Gen_Buffers (N   : in SizeI;
                          VBO : in Pointer)
     with Import => True, Convention => StdCall,
          External_Name => "glGenBuffers";

   procedure Delete_Buffers (N        : in SizeI;
                             Buffers  : in Pointer)
     with Import => True, Convention => StdCall,
          External_Name => "glDeleteBuffers";

   procedure Bind_Buffer (Target : in Enum;
                          VBO    : in UInt)
     with Import => True, Convention => StdCall,
          External_Name => "glBindBuffer";

   procedure Buffer_Data (Target : in Enum;
                          Size   : in SizeI;
                          Data   : in Pointer;
                          Usage  : in Enum)
     with Import => True, Convention => StdCall,
          External_Name => "glBufferData";

   procedure Buffer_Sub_Data (Target: in Enum;
                              Offset: in SizeI;
                              Size  : in SizeI;
                              Data  : in Pointer)
     with Import => True, Convention => StdCall,
          External_Name => "glBufferSubData";

   procedure Enable_Client_State (Target : in Enum)
     with Import => True, Convention => StdCall,
          External_Name => "glEnableClientState";

   procedure Disable_Client_State (Target : in Enum)
     with Import => True, Convention => StdCall,
          External_Name => "glDisableClientState";

   procedure Enable_Vertex_Attrib_Array (Index : in UInt)
     with Import => True, Convention => StdCall,
          External_Name => "glEnableVertexAttribArray";

   procedure Disable_Vertex_Attrib_Array (Index : in UInt)
     with Import => True, Convention => StdCall,
          External_Name => "glDisableVertexAttribArray";

   procedure Vertex_Attrib_Pointer (Index        : in UInt;
                                    Size         : in Int;
                                    Attr_Type    : in Enum;
                                    Normalized   : in Bool;
                                    Stride       : in SizeI;
                                    Data_Pointer : in Pointer)
     with Import => True, Convention => StdCall,
          External_Name => "glVertexAttribPointer";

   -- Vertex array objects
   procedure Gen_Vertex_Arrays (N    : in SizeI;
                                VAOs : in Pointer)
     with Import => True, Convention => StdCall,
          External_Name => "glGenVertexArrays";

   procedure Bind_Vertex_Array (VAO : in UInt)
     with Import => True, Convention => StdCall,
          External_Name => "glBindVertexArray";

   -- Shaders
   function Create_Shader (Shader_Type : in Enum) return UInt
     with Import => True, Convention => StdCall,
          External_Name => "glCreateShader";

   procedure Delete_Shader (Shader_ID : in UInt)
     with Import => True, Convention => StdCall,
          External_Name => "glDeleteShader";

   procedure Shader_Source (Shader        : in UInt;
                            Count         : in SizeI;
                            Source_String : in Pointer;
                            Length        : in Pointer)
     with Import => True, Convention => StdCall,
          External_Name => "glShaderSource";

   procedure Compile_Shader (Shader : in UInt)
     with Import => True, Convention => StdCall,
          External_Name => "glCompileShader";

   procedure Attach_Shader (Program : in UInt;
                            Shader  : in UInt)
     with Import => True, Convention => StdCall,
          External_Name => "glAttachShader";

   procedure Link_Program (Program : in UInt)
     with Import => True, Convention => StdCall,
          External_Name => "glLinkProgram";

   procedure Use_Program (Program : in UInt)
     with Import => True, Convention => StdCall,
          External_Name => "glUseProgram";

   function Create_Program return UInt
     with Import => True, Convention => StdCall,
          External_Name => "glCreateProgram";

   procedure Get_Shader (Shader : in UInt;
                         PName  : in Enum;
                         Params : in Pointer)
     with Import => True, Convention => StdCall,
          External_Name => "glGetShaderiv";

   procedure Get_Shader_Info_Log (Shader     : in UInt;
                                  MaxLength  : in SizeI;
                                  Length     : in Pointer;
                                  InfoLog    : in Pointer)
     with Import => True, Convention => StdCall,
          External_Name => "glGetShaderInfoLog";

   procedure Get_Program (Program : in UInt;
                          PName   : in Enum;
                          Params  : in Pointer)
     with Import => True, Convention => StdCall,
          External_Name => "glGetProgramiv";

   procedure Get_Program_Info_Log (Progarm   : in UInt;
                                   MaxLength : in SizeI;
                                   Length    : in Pointer;
                                   InfoLog   : in Pointer)
     with Import => True, Convention => StdCall,
          External_Name => "glGetProgramInfoLog";

   procedure Validate_Program (Program : in GL.UInt)
     with Import => True, Convention => StdCall,
          External_Name => "glValidateProgram";

   function Get_Uniform_Location (Program : in UInt;
                                  Name    : in String) return Int;

   procedure Uniform (Location : in Int;
                      V0       : in Float)
     with Import => True, Convention => StdCall, External_Name => "glUniform1f";
   procedure Uniform (Location : in Int;
                      V0       : in Float;
                      V1       : in Float)
     with Import => True, Convention => StdCall, External_Name => "glUniform2f";
   procedure Uniform (Location : in Int;
                      V0       : in Float;
                      V1       : in Float;
                      V2       : in Float)
     with Import => True, Convention => StdCall, External_Name => "glUniform3f";
   procedure Uniform (Location : in Int;
                      V0       : in Float;
                      V1       : in Float;
                      V2       : in Float;
                      V3       : in Float)
     with Import => True, Convention => StdCall, External_Name => "glUniform4f";

   procedure Uniform (Location : in Int;
                      V0       : in Int)
     with Import => True, Convention => StdCall, External_Name => "glUniform1i";
   procedure Uniform (Location : in Int;
                      V0       : in Int;
                      V1       : in Int)
     with Import => True, Convention => StdCall, External_Name => "glUniform2i";
   procedure Uniform (Location : in Int;
                      V0       : in Int;
                      V1       : in Int;
                      V2       : in Int)
     with Import => True, Convention => StdCall, External_Name => "glUniform3i";
   procedure Uniform (Location : in Int;
                      V0       : in Int;
                      V1       : in Int;
                      V2       : in Int;
                      V3       : in Int)
     with Import => True, Convention => StdCall, External_Name => "glUniform4i";

   procedure Uniform (Location : in Int;
                      V0       : in UInt)
     with Import => True, Convention => StdCall,
          External_Name => "glUniform1ui";
   procedure Uniform (Location : in Int;
                      V0       : in UInt;
                      V1       : in UInt)
     with Import => True, Convention => StdCall,
          External_Name => "glUniform2ui";
   procedure Uniform (Location : in Int;
                      V0       : in UInt;
                      V1       : in UInt;
                      V2       : in UInt)
     with Import => True, Convention => StdCall,
          External_Name => "glUniform3ui";
   procedure Uniform (Location : in Int;
                      V0       : in UInt;
                      V1       : in UInt;
                      V2       : in UInt;
                      V3       : in UInt)
     with Import => True, Convention => StdCall,
          External_Name => "glUniform4ui";

   procedure Uniform (Location  : in Int;
                      Count     : in SizeI;
                      Transpose : in Bool;
                      Value     : in Float_Matrix)
     with Import => True, Convention => StdCall,
          External_Name => "glUniformMatrix4fv";

   function Get_Attribute_Location (Program : in UInt;
                                    Name    : in String)
                                   return Int;

   procedure Vertex_Attrib (Index : in UInt;
                            X     : in Float)
     with Import => True, Convention => StdCall,
          External_Name => "glVertexAttrib1f";
   procedure Vertex_Attrib (Index : in UInt;
                            X     : in Float;
                            Y     : in Float)
     with Import => True, Convention => StdCall,
          External_Name => "glVertexAttrib2f";
   procedure Vertex_Attrib (Index : in UInt;
                            X     : in Float;
                            Y     : in Float;
                            Z     : in Float)
     with Import => True, Convention => StdCall,
          External_Name => "glVertexAttrib3f";
   procedure Vertex_Attrib (Index : in UInt;
                            X     : in Float;
                            Y     : in Float;
                            Z     : in Float;
                            W     : in Float)
     with Import => True, Convention => StdCall,
          External_Name => "glVertexAttrib4f";

   procedure Get_Double (Pname  : in Enum;
                         Params : out Double_Matrix)
     with Import => True, Convention => StdCall,
          External_Name => "glGetDoublev";

   ---------------------------------------------------------------------------

end Lumen.GL;
