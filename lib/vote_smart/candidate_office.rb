module VoteSmart
  
  class CandidateOffice < Common
    
    attr_accessor :address, :phone, :notes
    
    def initialize attributes
      self.address = Address.new(attributes["address"])
      self.phone = Phone.new(attributes["phone"])
      self.notes = Notes.new(attributes["notes"])
    end
    
  end
  
end