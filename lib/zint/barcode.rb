module Zint
  # Symbologies
  BARCODE_CODE11          = 1
  BARCODE_C25MATRIX       = 2
  BARCODE_C25INTER        = 3
  BARCODE_C25IATA         = 4
  BARCODE_C25LOGIC        = 6
  BARCODE_C25IND          = 7
  BARCODE_CODE39          = 8
  BARCODE_EXCODE39        = 9
  BARCODE_EANX            = 13
  BARCODE_EAN128          = 16
  BARCODE_CODABAR         = 18
  BARCODE_CODE128         = 20
  BARCODE_DPLEIT          = 21
  BARCODE_DPIDENT         = 22
  BARCODE_CODE16K         = 23
  BARCODE_CODE49          = 24
  BARCODE_CODE93          = 25
  BARCODE_FLAT            = 28
  BARCODE_RSS14           = 29
  BARCODE_RSS_LTD         = 30
  BARCODE_RSS_EXP         = 31
  BARCODE_TELEPEN         = 32
  BARCODE_UPCA            = 34
  BARCODE_UPCE            = 37
  BARCODE_POSTNET         = 40
  BARCODE_MSI_PLESSEY     = 47
  BARCODE_FIM             = 49
  BARCODE_LOGMARS         = 50
  BARCODE_PHARMA          = 51
  BARCODE_PZN             = 52
  BARCODE_PHARMA_TWO      = 53
  BARCODE_PDF417          = 55
  BARCODE_PDF417TRUNC     = 56
  BARCODE_MAXICODE        = 57
  BARCODE_QRCODE          = 58
  BARCODE_CODE128B        = 60
  BARCODE_AUSPOST         = 63
  BARCODE_AUSREPLY        = 66
  BARCODE_AUSROUTE        = 67
  BARCODE_AUSREDIRECT     = 68
  BARCODE_ISBNX           = 69
  BARCODE_RM4SCC          = 70
  BARCODE_DATAMATRIX      = 71
  BARCODE_EAN14           = 72
  BARCODE_CODABLOCKF      = 74
  BARCODE_NVE18           = 75
  BARCODE_JAPANPOST       = 76
  BARCODE_KOREAPOST       = 77
  BARCODE_RSS14STACK      = 79
  BARCODE_RSS14STACK_OMNI = 80
  BARCODE_RSS_EXPSTACK    = 81
  BARCODE_PLANET          = 82
  BARCODE_MICROPDF417     = 84
  BARCODE_ONECODE         = 85
  BARCODE_PLESSEY         = 86
  BARCODE_TELEPEN_NUM     = 87
  BARCODE_ITF14           = 89
  BARCODE_KIX             = 90
  BARCODE_AZTEC           = 92
  BARCODE_DAFT            = 93
  BARCODE_MICROQR         = 97
  BARCODE_HIBC_128        = 98
  BARCODE_HIBC_39         = 99
  BARCODE_HIBC_DM         = 102
  BARCODE_HIBC_QR         = 104
  BARCODE_HIBC_PDF        = 106
  BARCODE_HIBC_MICPDF     = 108
  BARCODE_HIBC_BLOCKF     = 110
  BARCODE_HIBC_AZTEC      = 112
  BARCODE_AZRUNE          = 128
  BARCODE_CODE32          = 129
  BARCODE_EANX_CC         = 130
  BARCODE_EAN128_CC       = 131
  BARCODE_RSS14_CC        = 132
  BARCODE_RSS_LTD_CC      = 133
  BARCODE_RSS_EXP_CC      = 134
  BARCODE_UPCA_CC         = 135
  BARCODE_UPCE_CC         = 136
  BARCODE_RSS14STACK_CC   = 137
  BARCODE_RSS14_OMNI_CC   = 138
  BARCODE_RSS_EXPSTACK_CC = 139
  BARCODE_CHANNEL         = 140
  BARCODE_CODEONE         = 141
  BARCODE_GRIDMATRIX      = 142
    
  # barcode output options
  BARCODE_NO_ASCII    = 1
  BARCODE_BIND        = 2
  BARCODE_BOX         = 4
  
  # Even thought this an option, it foobar's 
  # Ruby's $stdout handle. Don't use it. 
  # BARCODE_STDOUT      = 8
  BARCODE_READER_INIT = 16

  # input options
  DATA_MODE    = 0
  UNICODE_MODE = 1
  GS1_MODE     = 2
  KANJI_MODE   = 3
  SJIS_MODE    = 4
  DM_SQUARE    = 100


  # error codes
  WARN_INVALID_OPTION    = 2
  ERROR_TOO_LONG         = 5
  ERROR_INVALID_DATA     = 6
  ERROR_INVALID_CHECK    = 7
  ERROR_INVALID_OPTION   = 8
  ERROR_ENCODING_PROBLEM = 9
  ERROR_FILE_ACCESS      = 10
  ERROR_MEMORY           = 11

  # A base class to represent the barcode being encoded
  class Barcode
    # The encoded value of the barcode
    attr_accessor :value
    # The symbol width, in pixels
    attr_accessor :symbol_width
    # The overall barcode height
    attr_accessor :height
    # The barcode's symbology (e.g. code-128, upc, qrcode)
    attr_accessor :symbology

    def initialize(value, *options)
      @symbol = Zint.zint_create()
      @
      
    end
  end
end