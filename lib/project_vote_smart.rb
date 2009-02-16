require 'rubygems'
require 'ym4r/google_maps/geocoding'
require 'active_support'
include Ym4r::GoogleMaps

module ProjectVoteSmart
  VERSION = '0.0.1'
  
  API_URL = "http://api.votesmart.org/"
  API_FORMAT = "JSON"
  
  mattr_accessor :api_key
  
  class RequestFailed < Exception; end
end

ProjectVoteSmart.api_key = "key"

require "#{File.dirname(__FILE__)}/mcll4r/mcll4r.rb"
require "#{File.dirname(__FILE__)}/project_vote_smart/common.rb"

Dir["#{File.dirname(__FILE__)}/project_vote_smart/*.rb"].each do |source_file| 
  require source_file unless source_file == "#{File.dirname(__FILE__)}/project_vote_smart/common.rb"
end
