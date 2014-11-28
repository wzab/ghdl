--  GHDL Run Time (GRT) - 'value subprograms.
--  Copyright (C) 2002 - 2014 Tristan Gingold
--
--  GHDL is free software; you can redistribute it and/or modify it under
--  the terms of the GNU General Public License as published by the Free
--  Software Foundation; either version 2, or (at your option) any later
--  version.
--
--  GHDL is distributed in the hope that it will be useful, but WITHOUT ANY
--  WARRANTY; without even the implied warranty of MERCHANTABILITY or
--  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
--  for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with GCC; see the file COPYING.  If not, write to the Free
--  Software Foundation, 59 Temple Place - Suite 330, Boston, MA
--  02111-1307, USA.
--
--  As a special exception, if other files instantiate generics from this
--  unit, or you link this unit with other files to produce an executable,
--  this unit does not by itself cause the resulting executable to be
--  covered by the GNU General Public License. This exception does not
--  however invalidate any other reasons why the executable file might be
--  covered by the GNU Public License.
with Grt.Types; use Grt.Types;
with Grt.Rtis; use Grt.Rtis;

package Grt.Values is
   --  Return True IFF C is a whitespace character (as defined in LRM93 14.3)
   function Is_Whitespace (C : in Character) return Boolean;

   --  Convert C to lowercase.
   function To_LC (C : in Character) return Character;

   --  Extract position of numeric literal and unit in string STR.
   --  Set IS_REAL if the unit is a real number (presence of '.').
   --  Set UNIT_POS to the position of the first character of the unit name.
   --  Set LIT_POS to the position of the first character of the numeric
   --  literal (after whitespaces are skipped).
   --  Set LIT_END to the position of the next character of the numeric lit.
   procedure Ghdl_Value_Physical_Split (Str : Std_String_Ptr;
                                        Is_Real : out Boolean;
                                        Lit_Pos : out Ghdl_Index_Type;
                                        Lit_End : out Ghdl_Index_Type;
                                        Unit_Pos : out Ghdl_Index_Type);

   function Ghdl_Value_B1 (Str : Std_String_Ptr; Rti : Ghdl_Rti_Access)
      return Ghdl_B1;
   function Ghdl_Value_E8 (Str : Std_String_Ptr; Rti : Ghdl_Rti_Access)
      return Ghdl_E8;
   function Ghdl_Value_E32 (Str : Std_String_Ptr; Rti : Ghdl_Rti_Access)
      return Ghdl_E32;
   function Ghdl_Value_I32 (Str : Std_String_Ptr) return Ghdl_I32;
   function Ghdl_Value_I64 (Str : Std_String_Ptr) return Ghdl_I64;
   function Ghdl_Value_F64 (Str : Std_String_Ptr) return Ghdl_F64;
   function Ghdl_Value_P64 (Str : Std_String_Ptr; Rti : Ghdl_Rti_Access)
      return Ghdl_I64;
   function Ghdl_Value_P32 (Str : Std_String_Ptr; Rti : Ghdl_Rti_Access)
      return Ghdl_I32;
private
   pragma Export (Ada, Ghdl_Value_B1, "__ghdl_value_b1");
   pragma Export (C, Ghdl_Value_E8, "__ghdl_value_e8");
   pragma Export (C, Ghdl_Value_E32, "__ghdl_value_e32");
   pragma Export (C, Ghdl_Value_I32, "__ghdl_value_i32");
   pragma Export (C, Ghdl_Value_I64, "__ghdl_value_i64");
   pragma Export (C, Ghdl_Value_F64, "__ghdl_value_f64");
   pragma Export (C, Ghdl_Value_P64, "__ghdl_value_p64");
   pragma Export (C, Ghdl_Value_P32, "__ghdl_value_p32");
end Grt.Values;