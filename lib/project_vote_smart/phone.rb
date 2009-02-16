module ProjectVoteSmart
  
  class Phone < Common
    
    attr_accessor :phone1, :phone2, :fax1, :fax2, :toll_free, :ttyd
    
    set_attribute_map "phone1" => :phone1, "phone2" => :phone2, "fax1" => :fax1, "fax2" => :fax2,
                      "tollFree" => :toll_free, "ttyd" => :ttyd
    
  end
  
end
