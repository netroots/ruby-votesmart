require File.dirname(__FILE__) + '/../spec_helper'

module VoteSmart
  describe Official do
    
    describe "find_by_district_id" do
      
      def do_find
        Official.find_by_district_id("20451")
      end
      
      it_should_find :item => {:last_name => "Isakson", :id => "1721", :district_id => "20451"}
    end
    
    describe "multiple offices" do
      
      def do_find
        @official = Official.find_by_district_id("20451")
        @official.offices
      end
      
      it_should_find :count => 5, :first => {:address => {:type => "District"}},
                                  :last  => {:address => {:type => "Washington, D.C."}}
    end
    
    describe "one office" do
      
      def do_find
        @official = Official.find_by_district_id("21397")
        @official.offices
      end
      
      it_should_find :count => 1, :first => {:address => {:type => "Capitol"}}
    end
    
    describe "find_by_office_id_and_state_id" do
      
      def do_find
        Official.find_by_office_id_and_state_id("12", "CO")
      end
      
      it_should_find :item => {:last_name => "Suthers", :id => "29799", :office_id => "12", :state_id => "CO"}
      
    end
    
    describe "find by address" do
      
      before :each do
        mcll4r = {"response" => {"state_lower" => {"district" => "1"}, "state_upper" => {"district" => "2"}}}
        Geocoding.should_receive(:get).once.and_return([mock("placemark", :latitude => 2, :longitude => 10)])
        Mcll4r.should_receive(:new).once.and_return(mock("mcll4r", :district_lookup => mcll4r))
      end
      
      def do_find
        Official.find_all_by_address "123 fake st", "atlanta", "GA", "30303"
      end
      
      it_should_find :count => 5, :first => {:last_name => "Handel", :title => "Secretary"},
                                  :last  => {:last_name => "Jackson", :title => "Senator"}
      
    end
  end

end