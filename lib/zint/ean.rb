module Zint
  class Ean < Barcode
    def initialize(value)
      super(value, Zint::BARCODE_EANX)
    end
  end
end