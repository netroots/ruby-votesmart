require 'mcll4r'
require 'test/unit'
 
class Mcll4rTest < Test::Unit::TestCase
  
  def setup
    @mcll4r = Mcll4r.new
  end
  
  def test_assert_we_get_back_correct_district_data
    expected = {
      "response"      => {                                                                   
        "state_upper" => { "district" => "029", "display_name" => "TX 29th", "state" => "TX" },
        "federal"     => { "district" => "16",  "display_name" => "TX 16th", "state" => "TX" },
        "state_lower" => { "district" => "077", "display_name" => "TX 77th", "state" => "TX" },
        "lng"         => "-106.490969",                                                      
        "lat"         => "31.76321"                                                          
      }                                                                                      
    }
    assert_equal expected, @mcll4r.district_lookup(31.76321, -106.490969)
  end

  def test_assert_raise_on_error
    assert_raise DistrictNotFound do
      @mcll4r.district_lookup(nil,nil)
    end
  end

  def test_assert_raise_on_district_not_found
    assert_raise DistrictNotFound do
      @mcll4r.district_lookup( 1.0, 1.0 )
    end
  end

end
