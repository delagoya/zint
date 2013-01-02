module Zint
  class QRCode < Barcode
    ECC_L = 1
    ECC_M = 2
    ECC_Q = 3
    ECC_H = 4
    
    def initialize(value, ecc=ECC_L, *options)
      super(value, Zint::BARCODE_QRCODE, options[0])
      @zint_symbol[:option_1] = ecc
      return self
    end
  end
end