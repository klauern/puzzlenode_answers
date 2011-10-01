require_relative 'spec_helper'

class RatesTest < MiniTest::Unit::TestCase
  describe "CSV Parser" do

    before do
      @csv = CsvTransactionParser.new('files/SAMPLE_TRANS.csv')
    end

    it "should have a mapping of all the stores" do
      @csv.retrieve_stores("Yonkers").size.must_equal 2
      @csv.retrieve_stores("Nashua").size.must_equal 1
      @csv.retrieve_stores("Scranton").size.must_equal 1
      @csv.retrieve_stores("Camden").size.must_equal 1
      @csv.retrieve_stores("BadStore").size.must_equal 0
    end

    it "should get all sku's from the CSV" do
      @csv.retrieve_skus("DM1182").size.must_equal 3
      @csv.retrieve_skus("DM1210").size.must_equal 2
      @csv.retrieve_skus("DM1302").size.must_equal 0
    end

    it "should have a list of all transactions for a store" do
      yon = @csv.retrieve_trans("Yonkers")
      yon.size.must_equal 2
      yon[0].must_equal "70.00 USD"
      @csv.retrieve_trans("Nashua").size.must_equal 1
      @csv.retrieve_trans("Scranton").size.must_equal 1
      @csv.retrieve_trans("Camden").size.must_equal 1
      @csv.retrieve_trans("MadeUp").size.must_equal 0
    end
  end
end
