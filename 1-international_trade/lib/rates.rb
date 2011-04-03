unless RUBY_PLATFORM != "java"
  gem "nokogiri", "=1.5.0.beta.4" # earlier version threw Java hardcore errors
end
require 'nokogiri'

if RUBY_VERSION =~ /1.8/
  require 'fastercsv'
  CSV = FasterCSV # Ruby 1.9 uses FasterCSV as the CSV parser, so we just alias it for 1.8 to make things easier.
else
  require 'csv'
end
require 'bigdecimal'

class CsvTransactionParser

  def initialize(filename)
    @arrs = parse(filename)
  end

  def parse(filename)
    CSV.read(filename)
  end

  def retrieve_skus(sku)
    @arrs.select { |ary| ary[1] == sku }
  end

  def retrieve_stores(store)
    @arrs.select { |ary| ary[0] == store }
  end

  def retrieve_trans(store_name)
    ars = retrieve_stores(store_name)
    ars.map { |a| a[2] }
  end

end

class XmlRatesParser


  # not sure how to style the data for this:
  # could do something like this:
  # Data = {}
  # Data[from] = {to, value}
  # then to retrieve a conversion to reverse something, I would start
  # by looking for a Data[from] and if that doesn't find something,
  # reverse it by looking for a data[to] and dividing it by the value
  # to data[from]
  def initialize(filepath)
    @doc = create_doc(filepath)
    create_rates
  end

  def create_rates
    xml = get_rates_from_xml(@doc)
    @rates = map_rates(xml)
  end

  def create_doc(filepath)
    Nokogiri::XML(File.open('files/SAMPLE_RATES.xml'))
  end

  def get_rates_from_xml(doc)
    doc.css('rate')
  end

  def map_rate(element, hash={})
    hash[element.css('from').text] = { 'to' => element.css( 'to' ).text,
                                       'conversion' => element.css( 'conversion' ).text }
    hash
  end

  def map_rates(xml)
    rates = {}
    xml.each { |r|
      map_rate(r, rates)
    }
    rates
  end

end

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
      conversion = find_conversion_amt(currency, "USD")
    else
      conversion = 1 
    end
    round_banker_style(amt * conversion)
  end

  def find_conversion_amt(from, to)
  end

end
