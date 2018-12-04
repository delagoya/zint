module Zint
  # An FFI wrapper for the Zint C library zint_symbol struct.
  # You should not use this directly, use the Zint::Barcode or
  # its decendents instead.
  #
  # For Zint v2.6.3
  #
  class ZintSymbol < FFI::ManagedStruct
    layout :symbology, :int, 
           :height, :int,
           :whitespace_width , :int,
           :border_width     , :int,
           :output_options   , :int,
           :fgcolour, [:char, 10],
           :bgcolour, [:char, 10],
           :outfile, [:char, 256],
           :scale, :float, 
           :option_1, :int,
           :option_2, :int,
           :option_3, :int,
           :show_hrt, :int,
           :fontsize, :int,
           :input_mode, :int,
           :eci, :int,
           :text, [:uchar, 128],
           :rows, :int,
           :width, :int,
           :primary, [:char, 128],  	
           :encoded_data , [:uchar, 200*143],
           :row_height, [:int, 200],
           :errtxt, [:char, 100],
           :bitmap, :pointer,
           :bitmap_width, :int,
           :bitmap_height, :int,
           :bitmap_byte_length, :uchar,
           :dot_size, :float,
           :zint_render, :pointer,
           :debug, :int
  	
  	# release method required for FFI managed structs
  	def self.release ptr
  	  Zint.zint_delete(ptr)
	  end
  end 
end