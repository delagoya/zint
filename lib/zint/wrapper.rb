module Zint  

  # This is the FFI wrapper on the Zint C library. You should not use 
  # this directly. Instead refer to Zint::Barcode and its decendents  
  module Wrapper
    extend FFI::Library
    ffi_lib "libzint"

    #error codes
    enum, :err [:warn_invalid_option, 2,
      :error_too_long, 5,
      :error_invalid_data, 6,
      :error_invalid_check, 7,
      :error_invalid_option, 8,
      :error_encoding_problem, 9,
      :error_file_access, 10,
      :error_memory, 11 ]

    # some typedef aliases, for better method signatures
    typedef :pointer, :zint_symbol
    typedef :int32, :string_max_length
    typedef :int32, :rotate_angle
    typedef :string, :input
    
    attach_function(:zint_create, :ZBarcode_Create, [], :zint_symbol)
    attach_function(:zint_clear, :ZBarcode_Clear, [:zint_symbol], :void)
    attach_function(:zint_delete, :ZBarcode_Delete, [:zint_symbol], :void)
    attach_function(:zint_encode, :ZBarcode_Encode, [:zint_symbol, :input, :string_max_length], :err)
    attach_function(:zint_print, :ZBarcode_Print, [:zint_symbol, :rotate_angle], :err)
    attach_function(:zint_encode_and_print, :ZBarcode_Encode_and_Print, [:zint_symbol, :input, :string_max_length, :rotate_angle], :err)
    
    def self.create(bctype=nil)
      bc = Zint::ZintSymbol.new(Zint.zint_create())
      bc[:symbology] = bctype if bctype
      return bc
    end
      
  end
end