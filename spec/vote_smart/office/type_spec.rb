require 'spec_helper'

module VoteSmart
  describe Office::Type do
    
    describe "all" do

      def do_find
        Office::Type.all
      end
      
      it_should_find :count => 10, :first => {:name => "Presidential and Cabinet", :id => "P"},
                                   :last => {:name => "Local Executive", :id => "M"}
      
    end
    
    describe "find_by_name" do
      
      def do_find
        Office::Type.find_by_name("State Legislature")
      end
      
      it_should_find :item => {:name => "State Legislature", :id => "L"}
      
    end

    describe "offices" do
      
      def do_find
        Office::Type.find_by_name("Presidential and Cabinet").offices
      end
      
      it_should_find :count => 17, :first => {:name => "President", :id => "1"},
                                   :last => {:name => "Vice President", :id => "2"}
      
    end
    
    describe "offices_by_name" do
      
      def do_find
        Office::Type.find_by_name("Presidential and Cabinet").offices_by_name(["President", "Vice President"])
      end
      
      it_should_find :count => 2, :first => {:name => "President", :id => "1"},
                                  :last => {:name => "Vice President", :id => "2"}
      
    end
  end
end
