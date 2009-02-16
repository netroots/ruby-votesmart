module VoteSmart
  
  class Leadership < Common
    
    # Returns a list of leadership positions
    def self.get_positions state_id = "NA", office_id = nil
      request("Leadership.getPositions", "stateId" => state_id, "officeId" => office_id)
    end
    
    # Returns a list of candidates in specific leadership positions
    def self.get_officials leadership_id, state_id = "NA"
      request("Leadership.getOfficials", "leadershipId" => leadership_id, "stateId" => state_id)
    end
    
  end
end
