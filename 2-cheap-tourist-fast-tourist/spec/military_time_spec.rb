require_relative 'spec_helper'
require_relative '../lib/military_time'

describe "parsing military time differences" do

  it "should parse 15:45 to 16:45 as an hour" do
    military_difference("15:45", "16:45").must_equal 1.0
  end

  it "should parse 09:00 to 13:00 as 4.0" do
    military_difference("09:00", "13:00").must_equal 4.0
  end
end
