require 'spec_helper'

describe "CSV Parser" do
  
  before(:each) do
    @csv = CsvTransactionParser.new('files/SAMPLE_TRANS.csv')
  end

  it "should have a mapping of all the stores" do
    @csv.retrieve_stores("Yonkers").size.should == 2
    @csv.retrieve_stores("Nashua").size.should == 1
    @csv.retrieve_stores("Scranton").size.should == 1
    @csv.retrieve_stores("Camden").size.should == 1
    @csv.retrieve_stores("BadStore").size.should == 0
  end

  it "should get all sku's from the CSV" do
    @csv.retrieve_skus("DM1182").size.should == 3
    @csv.retrieve_skus("DM1210").size.should == 2
    @csv.retrieve_skus("DM1302").size.should == 0
  end

  it "should have a list of all transactions for a store" do
    yon = @csv.retrieve_trans("Yonkers")
    yon.size.should == 2
    yon[0].should == "70.00 USD"
    @csv.retrieve_trans("Nashua").size.should == 1
    @csv.retrieve_trans("Scranton").size.should == 1
    @csv.retrieve_trans("Camden").size.should == 1
    @csv.retrieve_trans("MadeUp").size.should == 0
  end
end

describe "Banker" do
  
  describe "and rounding" do
    before(:each) do
      @rate_f = "files/SAMPLE_RATES.xml"
      @trans_f = "files/SAMPLE_TRANS.csv"
      @bank = Banker.new(@rate_f, @trans_f)
    end
    
    it "should round various decimals to proper bankers rounding format" do
      @bank.round_banker_style("1.45453626").should == 1.45
      @bank.round_banker_style("1.46456622").should == 1.46
      @bank.round_banker_style("1.44653426").should == 1.45
      @bank.round_banker_style(1.4562722).should == 1.46
      @bank.round_banker_style("101.69711").should == 101.7
      @bank.round_banker_style("70.00").should == 70.0
    end

    describe "with conversions" do

      it "should not calculate the value of anything passed in as USD" do
        @bank.convert("70.00", "USD").should == 70.0
      end

      it "should calculate foreign currencies to USD" do
        @bank.convert("70.00", "CAD").should == 70.63
        @bank.convert("100.00", "AUD").should == 101.7
      end

    end

  end

  it "should result in a single total number for a given sku"

  it "should know how to convert from one currency to USD"

  it "should know how to convert the reverse of a conversion"

  it "should find a conversion that isn't directly mapped"

end
