require 'csv_parser'
require 'xml_parser'

class Banker

  attr_accessor :rates, :transactions, :xml_parser, :csv_parser

  def initialize(rate_file, transaction_file)
    @xml_parser = XmlRatesParser.new rate_file
    @csv_parser = CsvTransactionParser.new transaction_file
  end

  def round_banker_style(value)
    BigDecimal(value.to_s).round(2, BigDecimal::ROUND_HALF_EVEN).to_f
  end

  def convert(amt, currency)
    unless currency == "USD"
      path = @xml_parser.find_conversion_path(currency, "USD")
      #conversion = find_conversion_amt(currency, "USD")
    else
      conversion = 1 
    end
    round_banker_style(amt * conversion)
  end


end
