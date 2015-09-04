module VoteSmart
  API_URL = "http://api.votesmart.org/"
  API_FORMAT = "JSON"

  class << self
    attr_accessor :api_key
  end

  class RequestFailed < StandardError; end
end

VoteSmart.api_key = "key"

require "#{File.dirname(__FILE__)}/vote_smart/common"

Dir["#{File.dirname(__FILE__)}/vote_smart/*.rb"].each do |source_file| 
  require source_file unless source_file == "#{File.dirname(__FILE__)}/vote_smart/common.rb"
end
