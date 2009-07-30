module VoteSmart
  
  class Official < Common
    
    attr_accessor :id, :first_name, :nick_name, :middle_name, :last_name, :suffix, :title,
                  :election_parties, :office_parties, :district_id, :district_name, :state_id
    
    attr_accessor :district, :office, :office_id
    
    set_attribute_map "candidateId" => :id, "firstName" => :first_name, "nickName" => :nick_name,
                      "middleName" => :middle_name, "lastName" => :last_name, "suffix" => :suffix,
                      "title" => :title, "electionParties" => :election_parties, "officeDistrictId" => :district_id,
                      "officeDistrictName" => :district_name, "officeParties" => :officeParties, "officeStateId" => :state_id
    
    def offices
      Official.response_child_array(Address.get_office(self.id), "address", "office").collect {|office| CandidateOffice.new(office) }
    end
    
    def inspect
      "Official: " + [title, first_name, last_name].compact.join(' ')
    end
    
    def office_id
      @office_id || (office.id if office)
    end
    
    def self.find_by_district district
      official = find_by_district_id district.id
      official.district = district if official
      official.office = district.office if official
      official
    end
    
    def self.find_by_district_id district_id
      response = response_child(get_by_district(district_id), "candidateList", "candidate")
      Official.new(response) unless response.empty?
    end
    
    def self.find_by_office_id_and_state_id office_id, state_id
      response = response_child(get_by_office_state(office_id, state_id), "candidateList", "candidate")
      official = Official.new(response) unless response.empty?
      official.office_id = office_id if official
      official.state_id ||= state_id if official
      official
    end
    
    
    
    def self.find_all_by_address address, city, state, zip
      placemark = Geocoding.get("#{address} #{city}, #{state} #{zip}").first
      
      return [] unless placemark
      
      state ||= placemark.administrative_area
      
      placemark ? find_all_by_state_and_latitude_and_longitude(state, placemark.latitude, placemark.longitude) : []
    end

    def self.find_all_by_state_and_latitude_and_longitude state, latitude, longitude
      response = Mcll4r.new.district_lookup(latitude, longitude)
      response = response["response"] if response

      state_upper = (response["state_upper"] || {})["district"]
      state_lower = (response["state_lower"] || {})["district"]

      find_all_state_wide_officials(state) + find_state_legislators(state, state_upper, state_lower, state_lower)
    end

    def self.find_all_state_wide_officials state_id
      state_wide_office_names = ["Secretary of State", "Secretary of the Commonwealth", "Attorney General", "Secretary of Education",
                                 "Education Secretary", "Treasurer", "Auditor"]

      state_wide_type = Office::Type.find_by_name("State Wide")

      state_wide_offices = state_wide_type ? state_wide_type.offices_by_name(state_wide_office_names) : []

      state_wide_offices.collect { |office| office.official_by_state_id(state_id) }.compact
    end

    def self.find_state_legislators state_id, senate_district, house_district, assembly_district
      officials = []

      state_leg_type = Office::Type.find_by_name("State Legislature")

      {"State Senate" => senate_district,
       "State House" => house_district,
       "State Assembly" => assembly_district}.each do |office_name, district_number|

         office = state_leg_type.office_by_name(office_name) if state_leg_type

         district = office.district_by_state_id_and_number(state_id, district_number) if office

         official = district.official if district

         officials.push official if official
      end

      officials
    end
    
    
    # Returns a list of incumbents that fit the criteria
    def self.get_by_office_state office_id, state_id = 'NA'
      request("Officials.getByOfficeState", "officeId" => office_id, "stateId" => state_id)
    end
    
    # Searches for incumbents with exact lastname matches
    def self.get_by_lastname lastname
      request("Officials.getByLastname", "lastName" => lastname)
    end
    
    # Searches for incumbents with fuzzy lastname match
    def self.get_by_levenstein lastname
      request("Officials.getByLevenstein", "lastName" => lastname)
    end
    
    # Returns incumbents in the provided election_id
    def self.get_by_election election_id
      request("Officials.getByElection", "electionId" => election_id)
    end
    
    # Returns incumbents in the provided district_id
    def self.get_by_district district_id
      request("Officials.getByDistrict", "districtId" => district_id)
    end
    
  end
end
