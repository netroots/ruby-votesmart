module ProjectVoteSmart
  
  class Candidate < Common
    
    # Returns a list of candidates/incumbents that fit the criteria
    def self.get_by_office_state office_id, state_id = "NA", election_year = nil
      request("Candidates.getByOfficeState", "officeId" => office_id, "stateId" => state_id, "electionYear" => election_year)
    end
    
    #Searches for candidates with exact lastname matches
    def self.get_by_lastname last_name, election_year = nil
      request("Candidates.getByLastname", "lastName" => last_name, "electionYear" => election_year)
    end
    
    # Searches for candidates with fuzzy lastname match
    def self.get_by_levenstein last_name, election_year = nil
      request("Candidates.getByLevenstein", "lastName" => last_name, "electionYear" => election_year)
    end
    
    # Returns candidates in the provided election_id
    def self.get_by_election election_id
      request("Candidates.getByElection", "electionId" => election_id)
    end
    
    # Returns candidates in the provided district_id
    def self.get_by_district district_id, election_year = nil
      request("Candidates.getByDistrict", "districtId" => district_id, "electionYear" => election_year)
    end
    
  end
  
end
