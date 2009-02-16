module VoteSmart
  
  class CandidateBio < Common
    
    # Returns basic bio details on a candidate
    def self.get_bio can_id
      request("CandidateBio.getBio", "candidateId" => can_id)
    end
    
    # 
    def self.get_addl_bio can_id
      request("CandidateBio.getAddlBio", "candidateId" => can_id)
    end
    
  end
end
