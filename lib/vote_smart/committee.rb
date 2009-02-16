module VoteSmart
  
  class Committee < Common
    
    # Returns committee types for use in other methods
    def self.get_types
      request("Committee.getTypes")
    end
    
    def self.get_committees_by_type_state type_id = nil, state_id = 'NA'
      request("Committee.getCommitteesByTypeState", "typeId" => type_id, "stateId" => state_id)
    end
    
    def self.get_committee committee_id
      request("Committee.getCommittee", "committeeId" => committee_id)
    end
    
    def self.get_committee_members committee_id
      request("Committee.getCommitteeMembers", "committeeId" => committee_id)
    end
    
  end
end
