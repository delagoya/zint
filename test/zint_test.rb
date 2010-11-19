require File.join(File.dirname(__FILE__) , 'test_helper')

class ZintTest < Test::Unit::TestCase
  context "Canary" do 
    # canary test.
    should "survive the canary test" do
      assert true
    end
  end

  context "ZintTest" do 
    setup do 
      @bc = Zint::Barcode.new("http://rubygems.org/gems/zint")
    end

    should "create a barcode object" do 
      assert @bc
    end

    should "assign the barcode's value on create" do 
      assert_equal("http://rubygems.org/gems/zint", @bc.value)
    end
    
    should "encode the proper value into the C zint_symbol struct" do 
      @bc.encode!
      assert_equal(@bc.value, @bc.zint_symbol[:text].to_s, "ERRRR #{@bc.zint_symbol[:text]}")
    end

    # should probably define a new context for encoding tests against the fixtures
    should "encode a barcode as PNG to filesystem" do 
      test_case = File.read(File.join(File.dirname(__FILE__), "fixtures", "code128.png"))
      @bc.print!
      assert_equal(test_case, File.read(@bc.path))
    end

    should "encode a barcode as PNG to raw byte string PNG" do 
      test_case = File.read(File.join(File.dirname(__FILE__), "fixtures", "code128.png"))
      query_case = @bc.buffer!
      assert_equal(test_case, query_case)
    end

  end
end