$: << File.expand_path(File.dirname(__FILE__) + "lib")

require 'rspec'
require 'rates'

describe "Parsing Rates.XML" do

  it "should store all conversions"

  it "should know how to convert the reverse of a conversion"

  it "should find a conversion that isn't directly mapped"

end

describe "parsing trans.csv" do
  
  before(:each) do
    @csv = CsvTransactionParser.new('files/SAMPLE_TRANS.csv')
  end

  it "should have a mapping of all the stores" do
    @csv.retrieve_stores("Yonkers").size.should == 2
    @csv.retrieve_stores("Nahua").size.should == 1
    @csv.retrieve_stores("Scranton").size.should == 1
    @csv.retrieve_stores("Camden").size.should == 1
    @csv.retrieve_stores("BadStore").size.should == 0
  end

  it "should get all sku's from the CSV" do
    @csv.retrieve_skus("DM1182").size.should == 3
    @csv.retrieve_skus("DM1210").size.should == 2
    @csv.retrieve_skus("DM1302").size.should == 0
  end

end

describe "converting prices to USD" do
  before(:each) do
    @banker = Banker.new
  end

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
