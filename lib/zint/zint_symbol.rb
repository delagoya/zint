module Zint
  # An FFI wrapper for the Zint C library zint_symbol struct.
  # You should not use this directly, use the Zint::Barcode or
  # its decendents instead.
  class ZintSymbol < FFI::ManagedStruct
    layout :symbology, :int32, 
           :height, :int32,
           :whitespace_width , :int32,
           :border_width     , :int32,
           :output_options   , :int32,
           :fgcolour, [:char, 10],
           :bgcolour, [:char, 10],
           :outfile, [:char, 256],
           :scale, :float, 
           :option_1, :int32,
           :option_2, :int32,
           :option_3, :int32,
           :show_hrt, :int32,
           :input_mode, :int32,
           :text, [:uchar, 128],
           :rows, :int32,
           :width, :int32,
           :primary, [:char, 128],  	
           :encoded_data , [:uchar, 178*143],
           :row_height, [:int32, 178],
           :errtxt, [:char, 100],
           :bitmap, :pointer,
           :bitmap_width, :int32,
           :bitmap_height, :int32
  	
  	# release method required for FFI managed structs
  	def self.release ptr
  	  Zint.zint_delete(ptr)
	  end
  end 
end