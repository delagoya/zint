module Zint
  class DataMatrix < Barcode
    def initialize(value)
      super(value, Zint::BARCODE_DATAMATRIX)
      @zint_symbol[:option_2] = Zint::DM_SQUARE
    end
  end
end