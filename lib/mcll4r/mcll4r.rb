require 'rubygems'
require 'httparty'

class Mcll4r
  include HTTParty
  base_uri "http://congress.mcommons.com"    
  format :xml
  
  def district_lookup(lat, lng)
    filter_for_errors self.class.get("/districts/lookup.xml", :query=>{:lat=>lat, :lng=>lng})
  end

private

  def filter_for_errors(hash)
    if hash['response']['error']
      raise DistrictNotFound.new(hash['response']['error'])
    end
    hash
  end

end

class DistrictNotFound < Exception; end