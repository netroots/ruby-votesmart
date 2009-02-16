require File.dirname(__FILE__) + '/../spec_helper'

module VoteSmart
  describe State do
  
    describe "all" do
    
      def do_find
        State.all
      end
    
      it_should_find :count => 56, :first => {:name => "National", :id => "NA"},
                                   :last => {:name => "Louisiana", :id => "LA"}
    
    end
  
    describe "find_by_id" do
    
      def do_find
        State.find_by_id("GA")
      end
      
      it_should_find :item => {:name => "Georgia", :id => "GA", :largest_city => "Atlanta"}
    
    end
  
  end
end