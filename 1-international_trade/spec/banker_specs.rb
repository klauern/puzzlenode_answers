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
