require_relative 'spec_helper'

class BankerSpec < MiniTest::Spec

  describe "Banker" do
    before do
      @rate_f = "files/SAMPLE_RATES.xml"
      @trans_f = "files/SAMPLE_TRANS.csv"
      @bank = Banker.new(@rate_f, @trans_f)
    end

    describe "and rounding" do

      it "should round various decimals to proper bankers rounding format" do
        @bank.round_banker_style("1.45453626").must_equal 1.45
        @bank.round_banker_style("1.46456622").must_equal 1.46
        @bank.round_banker_style("1.44653426").must_equal 1.45
        @bank.round_banker_style(1.4562722).must_equal 1.46
        @bank.round_banker_style("101.69711").must_equal 101.7
        @bank.round_banker_style("70.00").must_equal 70.0
      end

      describe "with conversions" do

        it "should not calculate the value of anything passed in as USD" do
          @bank.to_usd("70.00", "USD").must_equal BigDecimal.new("70.0")
        end

        it "should calculate foreign currencies to USD" do
          @bank.to_usd("70.00", "CAD").must_equal BigDecimal("70.63")
          @bank.to_usd("100.00", "AUD").must_equal BigDecimal("101.7")
        end

      end

    end

    it "should return a single total amount in USD for a given sku" do
      @bank.sum_totals("DM1182").must_equal BigDecimal("134.22")
    end

  end
end
