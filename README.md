
# Zint 

This is a Ruby FFI wrapper for the Zint barcode generation library (http://www.zint.org.uk). 

## Installing Zint

For OS X leverage the [Homebrew](https://brew.sh)

```sh 
brew install zint
```

Other platforms require building [from source](https://sourceforge.net/projects/zint/files/). Follow the [Zint installation instructions](http://www.zint.org.uk/Manual.aspx?type=p&page=2).

**NOTE:** We assume that you are using Zint version [2.6.3_rc2](https://sourceforge.net/projects/zint/files/zint/2.6.3/) but future releases should work well enough. 

## Installation

As mentioned, <b> you must install zint</b> to be able to use this gem. Once that dependency is satisfied, then you can just do the usual gem install.

```bash 
gem install zint
```

## Usage


```ruby
require 'zint'
# Create a code-128 barcode
bc = Zint::Barcode.new("test")
bc.print! # file is now on relative path "out.png"
bc.path = "my_bc.png"
bc.print! # file is now on relative path "my_bc.png"
bc.path = "my_bc.svg"
bc.print!
bc.print! # file is now on relative path "my_bc.svg"

# create a qrcode
qrcode = Zint::Barcode.new("test", Zint::BARCODE_QRCODE)
qrcode.path = "qrcode.png"
qrcode.print! # file is now on relative path "qrcode.png"
qrcode_string = qrcode.buffer!
puts qrcode_string

#QRCode with more options, specifically set a high error correction capacity
qrcode = Zint::QRCode.new("test", Zint::QRCode::ECC_H)
qrcode.path = "qrcode.ecc_h.png"
qrcode.print! # file is now on relative path "qrcode.ecc_h.png"
# encode barcode as text
qrcode.path = "qrcode.ecc_h.txt"
puts qrcode.buffer!
```
