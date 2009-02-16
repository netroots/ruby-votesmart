module ProjectVoteSmart
  
  class Local < Common
    
    # Returns a list of cities in a given state
    def get_cities state_id
      request("Local.getCities", "stateId" => state_id)
    end
    
    # Returns a list of counties in a given state.
    def get_counties state_id
      request("Local.getCounties", "stateId" => state_id)
    end
    
    # 
    def get_officials local_id
      request("Local.getOfficials", "localId" => local_id)
    end
    
  end
end
