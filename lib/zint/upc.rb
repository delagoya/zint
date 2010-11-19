module Zint
  class Upc < Barcode
    def initialize(value)
      super(value, Zint::BARCODE_UPCA)
    end
  end
end