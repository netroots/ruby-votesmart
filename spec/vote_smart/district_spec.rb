require 'spec_helper'

module VoteSmart
  describe District do
  
    describe "find_all_by_office_and_state" do
    
      def do_find
        District.find_all_by_office_id_and_state_id("9", "GA")
      end
    
      it_should_find :count => 56, :first => {:name => "District 1", :id => "21945"},
                                   :last => {:name => "District 56", :id => "22000"}
    
    end
    
    describe "number" do
      
      it "should parse out the number" do
        @district = District.new "name" => "District 64"
        @district.number.should == 64
      end
      
      it "should be nil if it cannot parse out the number" do
        @district = District.new "name" => "District hah"
        @district.number.should == nil
      end
      
      it "should be nil if there is no name" do
        @district = District.new
        @district.number.should == nil
      end
    end
  
  end
end