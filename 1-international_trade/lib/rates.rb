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

require 'nokogiri'
require 'fastercsv'
require 'bigdecimal'

class CsvTransactionParser

  def initialize(filename)
  end

  def parse(filename)
    FasterCSV.foreach(filename) do |row|
      
  end


end

class XmlRatesParser
  doc = Nokogiri::XML(File.open('files/SAMPLE_RATES.xml'))

  rates_xml = doc.xpath('//rate')
end
class Banker

  def round_banker_style(value)
    BigDecimal(value.to_s).round(2, BigDecimal::ROUND_HALF_EVEN).to_f
  end

end
