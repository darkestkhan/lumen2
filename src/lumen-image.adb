
-- Lumen.Image -- Load and save image data
--
-- Chip Richards, NiEstu, Phoenix AZ, Spring 2010

-- Lumen would not be possible without the support and contributions of a cast
-- of thousands, including and primarily Rod Kay.

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
with Lumen.Binary;
with Lumen.Byte_IO;
with Lumen.Image.PPM;


package body Lumen.Image is

   ---------------------------------------------------------------------------

   -- Read image data from a file
   function From_File (Pathname : String) return Descriptor is

      use Lumen.Binary;

      -- Length in bytes of longest signature that we recognize
      Max_Signature : constant := 8;

      -- Data used to recognize various image formats by their signatures
      BMP_Signature  : constant Byte_String := (16#42#, 16#4D#);
      FITS_Signature : constant Byte_String := (16#53#, 16#49#, 16#4D#, 16#50#, 16#4C#, 16#45#);
      JFIF_Signature : constant Byte_String := (16#FF#, 16#D8#);
      PNG_Signature  : constant Byte_String := (16#89#, 16#50#, 16#4E#, 16#47#, 16#0D#, 16#0A#, 16#1A#, 16#0A#);
      Whitespace     : constant Byte_String := (16#09#, 16#0A#, 16#0D#, 16#20#);

      File    : Byte_IO.File_Type;
      Sig     : Byte_String (1 .. Max_Signature) := (others => 16#00#);
      Len     : Natural := 0;
      Result  : Descriptor;
      PPM_Sub : Character;

      ------------------------------------------------------------------------

      -- Byte is one of a set of values
      function Is_In (B : in Byte;  A : in Byte_String) return Boolean is
      begin  -- Is_In
         for I in A'Range loop
            if B = A (I) then
               return True;
            end if;
         end loop;

         return False;
      end Is_In;

      ------------------------------------------------------------------------

   begin  -- From_File

      -- Grab enough data to get any signature
      Byte_IO.Open (File, Pathname);
      Byte_IO.Read (File, Sig, Len);

      -- Classify the format based on the signature data
      if    Sig (Sig'First .. Sig'First + PNG_Signature'Length - 1)  = PNG_Signature then
         Byte_IO.Close (File);
         raise Unknown_Format;  -- until we start to support PNG
      elsif Sig (Sig'First .. Sig'First + JFIF_Signature'Length - 1) = JFIF_Signature then
         Byte_IO.Close (File);
         raise Unknown_Format;  -- until we start to support JPEG/JFIF
      elsif Sig (Sig'First .. Sig'First + FITS_Signature'Length - 1) = FITS_Signature then
         Byte_IO.Close (File);
         raise Unknown_Format;  -- until we start to support FITS
      elsif Sig (Sig'First .. Sig'First + BMP_Signature'Length - 1)  = BMP_Signature then
         Byte_IO.Close (File);
         raise Unknown_Format;  -- until we start to support BMP
      elsif Sig (Sig'First) = 16#50# and Is_In (Sig (Sig'First + 2), Whitespace) then  -- "P"
         PPM_Sub := Character'Val (Sig (Sig'First + 1));
         if PPM_Sub in '4' .. '6' then
            Result := PPM.From_File (File, PPM_Sub);
            Byte_IO.Close (File);
            return Result;
         else
            Byte_IO.Close (File);
            raise Unknown_Format;  -- something else that starts with "P"
         end if;
      else
         Byte_IO.Close (File);
         raise Unknown_Format;  -- some format we don't recognize
      end if;

   end From_File;

   ---------------------------------------------------------------------------

end Lumen.Image;

