require 'spec_helper'

describe ApplicationHelper do
  context "#format_time" do
    it "formats a DateTime object properly" do
      time   = Time.parse("2013-07-20 18:32:51 UTC")
      result = format_time(time)

      expect(result).to eq "July 20, 2013 - 12:32 PM"
    end
  end
end