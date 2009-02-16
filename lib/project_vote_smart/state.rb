module ProjectVoteSmart
  
  class State < Common
    
    attr_accessor :id, :name, :largest_city
    
    set_attribute_map "stateId" => :id, "name" => :name, "largestCity" => :largest_city
    
    def self.all
      response_child(get_state_ids, "stateList", "list", "state").collect {|attributes| State.new(attributes)}
    end
    
    def self.find_by_id state_id
      response = response_child(get_state(state_id), "state", "details")
      State.new(response) unless response.empty?
    end
    
    # Returns a list of states and their 2 digit IDs
    def self.get_state_ids
      request("State.getStateIDs")
    end
    
    # Returns detailed state information
    def self.get_state state_id
      request("State.getState", "stateId" => state_id)
    end
    
  end
end
