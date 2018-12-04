require File.join(File.dirname(__FILE__) , 'test_helper')
require 'digest/md5'

class QRCodeTest < Test::Unit::TestCase
  context "Canary" do 
    # canary test.
    should "survive the canary test" do
      assert true
    end
  end

  context "QRCodeTest" do 
    setup do 
      @bc = Zint::QRCode.new("http://rubygems.org/gems/zint")
    end
    
    should "create an object" do 
      assert @bc
    end
    
    should "set the proper symbology" do 
      assert_equal(Zint::BARCODE_QRCODE, @bc.bctype)
    end
    
    # Actually the Zint library itself does not do this. Its a bug 
    # on their side.
    # should "encode the proper value into the C zint_symbol struct" do 
    #   @bc.encode!
    #   assert_equal(@bc.value, @bc.zint_symbol[:text].to_s)
    # end
    
    should "create a PNG file" do 
      @bc.print!
      assert File.exists?(@bc.path)
    end
    
    should "create a PNG file that is the same as the test fixture" do 
      @bc.print!
      test_fixture = File.join(File.dirname(__FILE__) , 'fixtures', "qrcode.png")
      assert_equal(Digest::MD5.file(test_fixture) , Digest::MD5.file(@bc.path))
    end      
  end

  ## TO-DO: Figure out why this does not work. 
  context "QRCode High ECC" do 
    setup do 
      @bc = Zint::QRCode.new("http://rubygems.org/gems/zint", Zint::QRCode::ECC_H, :path => 'qrh.png')
      @bc.print!
    end
    
    should "create an object" do 
      assert @bc
    end    

    should "create a PNG file that is the same as the test fixture" do 
      test_fixture = File.join(File.dirname(__FILE__) , 'fixtures', "qrcode.ecc_h.png")
      assert_equal(Digest::MD5.file(test_fixture) , Digest::MD5.file(@bc.path))    
    end

  end
end