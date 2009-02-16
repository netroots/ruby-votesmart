module VoteSmart
  
  class Vote < Common
    
    # Returns a list of categories with votes assigned for the year and state provided
    def self.get_categories year, state_id = 'NA'
      request("Votes.getCategories", "stateId" => state_id)
    end
    
    # Returns detailed bill information
    def self.get_bill bill_id
      request("Votes.getBill", "billId" => bill_id)
    end
    
    # Returns a bill's action/stage(signed by prez, passed senate) detailed information
    def self.get_bill_action act_id
      request("Votes.getBillAction", "actionId" => act_id)
    end
    
    # Get's a bill's action's votes
    def self.get_bill_action_votes act_id
      request("Votes.getBillActionVotes", "actionId" => act_id)
    end
    
    # Gets a single candidate's vote on a bill
    def self.get_bill_action_votes_by_official act_id, can_id
      request("Votes.getBillActionVoteByOfficial", "actionId" => act_id, "candidateId" => can_id)
    end
    
    # Gets a list of bills that fit the criteria
    def self.get_bills_by_category_year_state category_id, year, state = 'NA'
      request("Votes.getBillsByCategoryYearState", "categoryId" => category_id, "year" => year, "stateId" => state)
    end
    
    # Gets a list of bills that fit the criteria
    def self.get_bills_by_year_state year, state_id = 'NA'
      request("Votes.getBillsByYearState", "year" => year, "stateId" => state_id)
    end
    
    # Gets a list of bills that fit the criteria
    def self.get_bills_by_official_year can_id, year
      request("Votes.getBillsByOfficialYear", "candidateId" => can_id, "year" => year)
    end
    
    # Gets a list of bills that fit the criteria
    def self.get_bills_by_official_category can_id, category_id
      request("Votes.getBillsByOfficialCategory", "candidateId" => can_id, "categoryId" => category_id)
    end
    
    # Gets a list of bills that fit the criteria
    def self.get_bills_by_sponsor_year can_id, year
      request("Votes.getBillsBySponsorYear", "candidateId" => can_id, "year" => year)
    end
    
    # Gets a list of bills that fit the criteria
    def self.get_bills_by_sponsor_category can_id, category_id
      request("Votes.getBillsBySponsorCategory", "candiateId" => can_id, "categoryId" => category_id)
    end
    
    # Gets a list of bills that fit the criteria
    def self.get_bills_by_state_recent ammount, state_id = 'NA'
      request("Votes.getBillsByStateRecent", "stateId" => state_id, "ammount" => ammount)
    end
    
    # Gets a list of vetoes for the provided candidate
    def self.get_vetoes can_id
      request("Votes.getVetoes", "candidateId" => can_id)
    end
  end
end
