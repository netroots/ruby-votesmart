module VoteSmart
  
  class District < Common
    
    attr_accessor :id, :name, :office_id, :state_id
    
    attr_accessor :office
    
    set_attribute_map "districtId" => :id, "name" => :name, "officeId" => :office_id, "stateId" => :state_id
    
    def number
      return unless name
      
      scan = name.scan(/District (\d[0-9]*)/) || []
      scan = scan.first || []
      num = scan.first
      num ? num.to_i : nil
    end
    
    def official
      @official ||= Official.find_by_district(self)
    end
    
    def self.find_all_by_office_and_state office, state
      find_all_by_office_id_and_state_id(office.id, state.id)
    end
    
    def self.find_all_by_office_id_and_state_id office_id, state_id
      response_child(get_by_office_state(office_id, state_id), "districtList", "district").collect {|attributes| District.new(attributes)}
    end
    
    # Returns districts service the office and state provided
    def self.get_by_office_state office_id, state_id = 'NA', district_name = ''
      request("District.getByOfficeState", "officeId" => office_id, "stateId" => state_id, "districtName" => district_name)
    end

    # Returns districts in the provided zip code, with optional zip+4
    def self.get_by_zip zip5, zip4=nil
      request("District.getByZip", "zip5" => zip5, "zip4" => zip4)
    end
  end
end
