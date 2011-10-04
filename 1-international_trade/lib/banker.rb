require_relative 'csv_parser'
require_relative 'xml_parser'
require 'pp'
require 'bigdecimal'
require 'bigdecimal/util'

class Banker

  attr_accessor :rates, :transactions, :xml_parser, :csv_parser

  def initialize(rate_file, transaction_file)
    @xml_parser = XmlRatesParser.new rate_file
    @csv_parser = CsvTransactionParser.new transaction_file
  end

  # Rounds a BigDecimal to ROUND_HALF_DOWN which is equivalent to 
  # Banker Style
  def round_banker_style(value)
    unless value.class == BigDecimal
      return BigDecimal(value.to_s).round(2, BigDecimal::ROUND_HALF_EVEN)
    else
      return value.round(2, BigDecimal::ROUND_HALF_EVEN)
    end
  end

  # Convert an `amt` from the given `currency` to USD
  def to_usd(amt, currency)
    unless currency == "USD"
      path = @xml_parser.find_conversion_path(currency, "USD")
      amount = @xml_parser.get_rates_from_xml(path[0])
      #pp path # print the path array (for debug if you need it)

      #conversion = find_conversion_amt(currency, "USD")
    else
      conversion = BigDecimal.new('1') 
    end
    amt = BigDecimal(amt)
    amount = amt * conversion
    #puts "amount is #{amount}"
    round_banker_style(amount)
  end

  def find_conversion_rate(from, to)
    path = @xml_parser.find_conversion_path(from, to)
    rates = @xml_parser.rates
    v = BigDecimal('1')
    from_rate = path[0]
    path.shift
    path.each { |to_rate|
      v *= rates[from_rate][to_rate]
      #puts "v is #{v} and is the class #{v.class}"
      #v = round_banker_style(v)
      from_rate = to_rate
    }
    return v
  end

  # Sums the transactions in USD
  def sum_totals(sku)
    skus = @csv_parser.retrieve_skus(sku)
    trans_in_usd = []
    skus.each { |ary|
      trans, cur = ary[2].split
      trans_in_usd << to_usd(trans, cur)
    }
    answer = trans_in_usd.reduce(:+)
    puts "Answer is #{answer} and class is #{answer.class}"
    answer
  end
end
