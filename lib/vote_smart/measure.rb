module VoteSmart
  
  class Measure < Common
    
    # Returns a ballot measure's details
    def self.get_measure measure_id
      request("Measure.getMeasure", "measureId" => measure_id)
    end
    
    # Returns a list of ballot measures that fit the criteria
    def self.get_measures_by_year_state year, state_id
      request("Measure.getMeasuresByYearState", "year" => year, "stateId" => state_id)
    end
    
  end
end
