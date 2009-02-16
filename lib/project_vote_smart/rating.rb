module ProjectVoteSmart
  
  class Rating < Common
    
    # Returns categories with ratings according to state_id(NA = fed)
    def self.get_categories state_id = nil
      request("Rating.getCategories", "stateId" => state_id)
    end
    
    # Returns a list of SIGs with ratings in category and state
    def self.get_sig_list category_id, state_id = 'NA'
      request("Rating.getSigList", "category_id" => category_id, "stateId" => state_id)
    end
    
    # Returns detailed SIG information
    def self.get_sig sig_id
      request("Rating.getSig", "sigId" => sig_id)
    end
    
    # Returns an SIG's rating on a specific candidate
    def self.get_candidate_rating candidate_id, sig_id
      request("Rating.getCandidateRating", "candidateId" => candidate_id, "sigId" => sig_id)
    end
    
  end
end
