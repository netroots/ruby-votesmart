module VoteSmart
  
  class Notes < Common
    
    attr_accessor :contact_name, :contact_title, :note
    
    set_attribute_map "contactName" => :contact_name, "contactTitle" => :contact_title, "note" => :note
    
  end
  
end
