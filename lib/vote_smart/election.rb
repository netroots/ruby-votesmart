module VoteSmart
  
  class Election < Common
    
    # Returns detailed election information
    def self.get_election election_id
      request("Election.getElection", "electionId" => election_id)
    end
    
    # returns a list of elections based on the criteria
    def self.get_election_by_year_state year, state_id
      request("Election.getElectionByYearState", "year" => year, "stateId" => state_id)
    end
    
    # Returns a list of candidates in the election and election stage provided
    def self.get_stage_candidates election_id, stage_id, party = ""
      request("Election.getStageCandidates", "electionId" => election_id, "stageId" => stage_id, "party" => party)
    end
    
  end
end
