require 'json'
require 'cgi'
require 'net/http'
require 'ym4r/google_maps/geocoding'

module ProjectVoteSmart
  
  class Common
    
    class << self
      attr_reader :attribute_map
    end
    
    def initialize attributes = {}
      update_attributes attributes
    end
    
    def self.set_attribute_map map
      @attribute_map = map
    end
    
    def update_attributes attributes
      map = self.class.attribute_map
      raise "map not set over-ride needed" unless map
      
      attributes.each do |key, value|
        if key.kind_of?(Symbol)
          send("#{key}=", value)
        else
          map_to = map[key]
          send("#{map_to}=", value) if map_to
        end
      end
    end
    
    def self.response_child response, *children
      for child in children
        response = response[child] if response
      end
      
      response || {}
    end
    
    def self.request(api_method, params = {})
      url = construct_url api_method, params
      
      json = get_json_data(url)
      
      if json['error'] and json['error']['errorMessage'] == 'Authorization failed'
        raise RequestFailed.new(json['error']['errorMessage'])
      end
      
      json
    end
    
    # Constructs a ProjectVoteSmart API-friendly URL
    def self.construct_url(api_method, params = {})
      "#{API_URL}#{api_method}?key=#{ProjectVoteSmart.api_key}&o=#{API_FORMAT}#{hash2get(params)}"
    end
    
    # Converts a hash to a GET string
    def self.hash2get(h)
      
      get_string = ""
      
      h.each_pair do |key, value|
        get_string += "&#{key.to_s}=#{CGI::escape(value.to_s)}" unless value.nil?
      end
      
      get_string
      
    end # def hash2get
    
    
    # Use the Net::HTTP and JSON libraries to make the API call
    #
    # Usage:
    #   District.get_json_data("http://someurl.com")    # returns Hash of data or nil
    def self.get_json_data(url)
      response = Net::HTTP.get_response(URI.parse(url))
      if response.class == Net::HTTPOK
        result = JSON.parse(response.body)
      else
        raise RequestFailed.new("Request was not OK: #{response.class}: #{response.body}")
      end
      
    end # self.get_json_data
    
  end
  
end
