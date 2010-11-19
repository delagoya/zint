module Zint
  # A base class to represent the barcode being encoded
  class Barcode
    # The encoded value of the barcode
    attr_accessor :value
    # The type of barcode generated (e.g. UPC, QRCode, Data Matrix)
    attr_accessor :bctype
    # The output format. One of [png, eps, svg or txt] (default = png)
    attr_accessor :format
    # The output file path
    attr_accessor :path
    # Access for the underlying FFI ManagedStruct of the Zint C struct 
    attr_reader :zint_symbol
    
    def initialize(value=nil, bctype=Zint::BARCODE_CODE128, &options)
      options ||={}
      @zint_symbol = Zint::Wrapper.create(bctype)
      @bctype = bctype
      @value = value
      if options[:path] 
        @path = options[:path]
        @format  = 
        @zint_symbol[:outfile]= @path
      else
        @format = "png"
        @path = File.join(Dir.pwd,  "out.png")
        @zint_symbol[:outfile]= @path
      end
    end
    
    def encode!
      err = Zint::Wrapper.zint_encode(@zint_symbol, @value, 0)
      if Zint::ERR[:err]
        raise Zint::Exception.new(@zint_symbol[:errtxt])
      end
    end
    
    def print!
      encode!
      err = Zint::Wrapper.zint_print(@zint_symbol, 0)
      if Zint::ERR[:err]
        raise Zint::Exception.new(@zint_symbol[:errtxt])
      end        
    end
    
    def buffer!
      tmp = File.join(Dir.tmpdir, "out.#{@format}")
      @zint_symbol[:outfile] = tmp
      print!
      tmp = File.read(tmp)
      File.unlink(tmp)
      return tmp
    end
  end
end