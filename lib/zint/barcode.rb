module Zint
  # A base class to represent the barcode being encoded
  class Barcode
    # The encoded value of the barcode
    attr_accessor :value
    # The type of barcode generated (e.g. UPC, QRCode, Data Matrix)
    attr_accessor :bctype
    # The output file path
    attr_reader :path
    # Access for the underlying FFI ManagedStruct of the Zint C struct 
    attr_reader :zint_symbol
    
    def initialize(value, bctype=Zint::BARCODE_CODE128, *options)
      if options.kind_of? Array
        options = options.shift
      end
      options ||= {}
      @zint_symbol = Zint::Wrapper.create(bctype)
      @bctype = bctype
      @value = value
      @encoded = false
      if options[:path]
        @path = options[:path]
        @zint_symbol[:outfile]= @path
      else
        @path = File.join(Dir.pwd,  "out.png")
        @zint_symbol[:outfile]= @path
      end
    end
    
    def path=(fspath)
      @path = fspath
      @zint_symbol[:outfile] = @path
      @encoded = false
      return @path
    end
    
    def encode!
      return if @encoded
      err = Zint::Wrapper.zint_encode(@zint_symbol, @value, 0)
      if Zint::ERR[:err]
        raise Zint::Exception.new(@zint_symbol[:errtxt])
      end
      @encoded = true
    end
    
    def print!
      encode!
      err = Zint::Wrapper.zint_print(@zint_symbol, 0)
      if Zint::ERR[:err]
        raise Zint::Exception.new(@zint_symbol[:errtxt])
      end        
    end
    
    def buffer!
      tmp = File.join(Dir.tmpdir, File.basename(@path))
      @zint_symbol[:outfile] = tmp
      print!
      @zint_symbol[:outfile] = @path
      buffer = File.read(tmp)
      File.unlink(tmp)
      return buffer
    end
  end
end