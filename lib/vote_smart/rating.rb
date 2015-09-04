module VoteSmart
  
  class Rating < Common
    
    # Returns categories with ratings according to state_id(NA = fed)
    def self.get_categories state_id = nil
      request("Rating.getCategories", "stateId" => state_id)
    end
    
    # Returns a list of SIGs with ratings in category and state
    def self.get_sig_list category_id, state_id = 'NA'
      request("Rating.getSigList", "categoryId" => category_id, "stateId" => state_id)
    end
    
    # Returns detailed SIG information
    def self.get_sig sig_id
      result = request("Rating.getSig", "sigId" => sig_id)
      # PVS return utf control codes for punction in descriptions
      if result['sig']['description'].first == '"'
        result['sig']['description'] = result['sig']['description'][1..-2]
      end
      result['sig']['description'] = result['sig']['description'].unpack("U*").map do |char|
        case char
        when 146 # 0092
          39
        when 148, 147 # 0093,4
          34
        when 150, 151 # 0096,7
          45
        else
          char
        end
      end.pack("U*")
      result
    end
    
    # Returns an SIG's rating on a specific candidate
    def self.get_candidate_rating candidate_id, sig_id, &block
      request("Rating.getCandidateRating", {"candidateId" => candidate_id, "sigId" => sig_id}, &block)
    end
    
  end
end
