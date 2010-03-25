require File.dirname(__FILE__) + '/../spec_helper'

describe VoteSmart::Rating do
  describe ".get_sig" do
    it "should properly handle UTF characters" do
      VoteSmart::Rating.get_sig('1863')['sig']['description'].unpack("U*").should_not include(148)
    end
  end
end
