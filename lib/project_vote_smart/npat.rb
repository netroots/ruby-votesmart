module ProjectVoteSmart
  
  class Npat < Common
    
    # Returns the most recent NPAT filled out by a candidate
    def self.get_npat can_id
      request("Npat.getNpat", "candidateId" => can_id)
    end
    
  end
end
