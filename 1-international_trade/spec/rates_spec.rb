$: << File.expand_path(File.dirname(__FILE__) + "lib")

require 'rspec'
require 'rates'

describe "Parsing Rates.XML" do

  it "should store all conversions"

  it "should know how to convert the reverse of a conversion"

  it "should find a conversion that isn't directly mapped"

end

describe "parsing trans.csv" do

  it "should find the currency for every row" 

  it "should have a mapping of all the stores"

  it "should have a mapping of all of the expenses"

  it "should maintain a running total in USD for all stores"
end


describe "output.txt file" do
  
  describe "and bankers rounding" do
    
    it "should round various decimals to proper bankers rounding format" do
      bank = Banker.new
      bank.round_banker_style("1.45453626").should == 1.45
      bank.round_banker_style("1.46456622").should == 1.46
      bank.round_banker_style("1.44653426").should == 1.45
      bank.round_banker_style(1.4562722).should == 1.46
    end

  end

  it "should use bankers rounding for each result"

  it "should avoid floating point arithmetic errors"

end
