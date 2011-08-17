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


