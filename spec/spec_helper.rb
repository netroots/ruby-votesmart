require 'rubygems'
require 'stringio'
require 'spec'
require "#{File.dirname(__FILE__)}/../lib/project_vote_smart.rb"

class Spec::Example::ExampleGroup
  
  def stub_request_method klazz, request_method, args
    clazz_name = klazz.name.split("::").last
    params = [request_method].concat(args).join('.')
    
    body = File.open("#{File.dirname(__FILE__)}/responses/#{clazz_name}.#{params}.js") {|f| f.read }
    JSON.parse(body)
  end
  
  before :each do
    
    ProjectVoteSmart::Common.stub!(:request).and_throw("request not stubbed!")
    
    [ProjectVoteSmart::Address,
     ProjectVoteSmart::Candidate,
     ProjectVoteSmart::CandidateBio,
     ProjectVoteSmart::Committee,
     ProjectVoteSmart::District,
     ProjectVoteSmart::Election,
     ProjectVoteSmart::Leadership,
     ProjectVoteSmart::Local,
     ProjectVoteSmart::Measure,
     ProjectVoteSmart::Npat,
     ProjectVoteSmart::Office,
     ProjectVoteSmart::Official,
     ProjectVoteSmart::Rating,
     ProjectVoteSmart::State,
     ProjectVoteSmart::Vote].each do |klazz|
      
      request_methods = klazz.methods.collect { |method| method if method.starts_with?("get_") }.compact
      
      request_methods.each do |request_method|
        
        klazz.stub!(request_method).and_return do |*args|
          stub_request_method(klazz, request_method, args)
        end
      end
      
    end
    
  end
  
  def self.it_should_find options = {}
    
    count = options[:count]
    
    if count
      it "should get the right number" do
        do_find.length.should == count
      end
    end
    
    it_should_find_helper :item, options
    it_should_find_helper :first, options
    it_should_find_helper :last, options
  end
  
  def perform_find_do method
    method == :item ? do_find : do_find.send(method)
  end
  
  def self.it_should_find_helper method, options
    last = options[method]
    
    if last
      describe "method" do
        last.each do |key, value|
          
          if value.kind_of?(Hash)
            
            it "should have the #{key}" do
              perform_find_do(method).send(key).should_not be_nil
            end
            
            value.each do |k, v|
              it "should set the #{key}.#{k}" do
                perform_find_do(method).send(key).send(k).should == v
              end
            end
            
          else
            
            it "should set the #{key}" do
              perform_find_do(method).send(key).should == value
            end
          end
        end
      end
    end
  end
  
end