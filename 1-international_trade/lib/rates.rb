=begin
some thoughts on this exercise:

Rates.xml file is pretty simple, and I could probably
use a hashmap to map all currencies to USD.  For currencies that are not 1-1 from something-USD, I can def that out

def to_usd(currency)
  # find direct mapping
  # if none exist, find any mapping
  # tree downwards
end

? what is the storeid there for?  Is that a hint to try using that store mapping to simplify things?  I think it might be, otherwise it's just superfluous.

=end
gem "nokogiri", "=1.5.0.beta.4" # earlier version threw Java hardcore errors
require 'nokogiri'

require 'fastercsv'
require 'bigdecimal'

class CsvTransactionParser

  def initialize(filename)
    @arrs = parse(filename)
  end

  def parse(filename)
    FasterCSV.read(filename)
  end

  def retrieve_skus(sku)
    @arrs.select { |ary| ary[1] == sku }
  end

  def retrieve_stores(store)
    @arrs.select { |ary| ary[0] == store }
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
    @rates_xml = get_rates_from_xml(@doc)
  end

  def create_doc(filepath)
    Nokogiri::XML(File.open('files/SAMPLE_RATES.xml'))
  end

  def get_rates_from_xml(doc)
    doc.xpath('//rate')
  end

  def map_rate(xml_element, hash={})
    puts "In XmlRatesParser; calling map_rate. #{xml_element.class}"
    hash[xml_element['from']] = { 'to' => xml_element['to'],
                                  'conversion' => xml_element['conversion'] }
  end


end

class Banker


  
  def round_banker_style(value)
    BigDecimal(value.to_s).round(2, BigDecimal::ROUND_HALF_EVEN).to_f
  end

end
