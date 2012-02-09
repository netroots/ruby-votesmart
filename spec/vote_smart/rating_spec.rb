require 'spec_helper'

describe VoteSmart::Rating do
  describe ".get_sig" do
    it "should properly handle UTF characters" do
      VoteSmart::Rating.get_sig('1863')['sig']['description'].unpack("U*").should_not include(148)
    end

    it "shouldn't have a quoted description" do
      description = VoteSmart::Rating.get_sig('1863')['sig']['description']
      description[0].should_not == '"'
      description[-1].should_not == '"'
    end
  end
end
