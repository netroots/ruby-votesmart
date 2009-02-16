module VoteSmart
  
  class Address < Common
    
    attr_accessor :type, :street, :city, :state, :zip
    
    set_attribute_map "type" => :type, "street" => :street, "city" => :city, "state" => :state, "zip" => :zip
    
    
    # Returns a campaign office's contact information
    def self.get_campaign can_id
      request("Address.getCampaign", "candidateId" => can_id)
    end
    
    # Returns a campaign office's contact information
    def self.get_campaign_web_address can_id
      request("Address.getCampaignWebAddress", "candidateId" => can_id)
    end
    
    # Returns a campaign office's contact information
    def self.get_campaign_by_election election_id
      request("Address.getCampaignByElection", "electionId" => election_id)
    end
    
    # Returns an incumbent office's contact information
    def self.get_office candidate_id
      request("Address.getOffice", "candidateId" => candidate_id)
    end
    
    # Returns an incumbent office's contact information
    def self.get_office_web_address can_id
      request("Address.getOfficeWebAddress", "candidateId" => can_id)
    end
    
    # Returns a (sometimes)list of offices that fit office_id and state_id
    def self.get_office_by_office_state office_id, state_id = 'NA'
      request("Address.getOfficeByOfficeState", "officeId" => office_id, "stateId" => state_id)
    end
    
  end
  
end
