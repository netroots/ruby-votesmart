module VoteSmart
  
  class Office < Common
    
    attr_accessor :id, :type_id, :level_id, :branch_id, :name, :title, :short_title
    
    set_attribute_map "officeId" => :id, "officeTypeId" => :type_id, "officeLevelId" => :level_id,
                      "officeBranchId" => :branch_id, "name" => :name, "title" => :title, "shortTitle" => :short_title
    
    def districts_by_state_id state_id
      @districts_by_state ||= {}
      @districts_by_state[state_id] ||= District.find_all_by_office_id_and_state_id(self.id, state_id)
    end
    
    def district_by_state_id_and_number state_id, number
      number = number.to_i
      districts = districts_by_state_id(state_id)
      districts.find {|district| district.number == number}
    end
    
    def official_by_state_id state_id
      @official_by_state ||= {}
      @official_by_state[state_id] ||= Official.find_by_office_id_and_state_id(self.id, state_id)
    end
    
    def self.all
      Type.all.collect { |type| find_all_by_type(type) }.uniq.flatten
    end
    
    def self.find_all_by_type type
      find_all_by_type_id(type.id)
    end
    
    def self.find_all_by_type_id type_id
      response_child(get_offices_by_type(type_id), "offices", "office").collect {|attributes| Office.new(attributes)}
    end
    
    def self.find_by_name name
      Office.all.collect {|office| office if office.name == name }.compact.first
    end
    
    def self.find_all_by_name names
      offices = Office.all
      names.collect {|name| offices.find {|office| office.name == name }}
    end
    
    # Gets a list of office types
    def self.get_types
      request("Office.getTypes")
    end
    
    # Returns branches of government and their respective IDs
    def self.get_branches
      request("Office.getBranches")
    end
    
    # Returns levels of government and their respective IDs
    def self.get_levels
      request("Office.getLevels")
    end
    
    # Returns a list of offices by office type
    def self.get_offices_by_type type_id
      request("Office.getOfficesByType", "typeId" => type_id)
    end
    
    # Returns a list of offices by level of government
    def self.get_offices_by_level level_id
      request("Office.getOfficesByLevel", "levelId" => level_id)
    end
    
    # Returns a list of offices by office type and level of government
    def self.get_offices_by_type_level type_id, level_id
      request("Office.getOfficesByType", "levelId" => level_id, "typeId" => type_id)
    end
    
    # Returns a list of offices by branch and level of government
    def self.get_offices_by_branch_level branch_id, level_id
      request("Office.getOfficesByBranchLevel", "branchId" => branch_id, "levelId" => level_id)
    end
    
    class Type < Common
      
      
      attr_accessor :id, :level_id, :branch_id, :name

      set_attribute_map "officeTypeId" => :id, "officeLevelId" => :level_id,
                        "officeBranchId" => :branch_id, "name" => :name
      
      def self.all
        @types ||= response_child(Office.get_types, "officeTypes", "type").collect {|attributes| Type.new(attributes)}
      end
      
      def self.find_by_name name
        Type.all.collect {|type| type if type.name == name }.compact.first
      end
      
      def offices
        @offices ||= Office.find_all_by_type(self)
      end
      
      def offices_by_name names
        names.collect {|name| offices.find {|office| office.name == name }}
      end
      
      def office_by_name name
        offices_by_name([name]).first
      end
      
    end
    
  end
end
