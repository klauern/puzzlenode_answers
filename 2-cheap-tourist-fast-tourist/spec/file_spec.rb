require_relative 'spec_helper'

require 'file_parser'

describe "parsing input files" do
  before do
    @cases = FileParser.load_input_file("files/sample-input.txt")
  end

  describe "parsing test cases" do
    it "should load all test cases" do
      @cases.size.must_equal 2
    end

    it "should load all flights for a test case" do
      @cases[0].size.must_equal 3
      @cases[1].size.must_equal 7
    end
  end

  describe "mapping flights" do
    it "should map all parts of a flight" do
      flight = @cases[0][1]
      flight[:from].must_equal "B"
      flight[:to].must_equal "Z"
      flight[:takeoff].must_equal "11:30"
      flight[:landing].must_equal "13:30"
      flight[:cost].must_equal 100.0
    end

    it "should map all parts of second test case" do
      flight = @cases[1][5]
      flight[:from].must_equal "C"
      flight[:to].must_equal "B"
      flight[:takeoff].must_equal "15:45"
      flight[:landing].must_equal "16:45"
      flight[:cost].must_equal 50.0
    end
  end
end
