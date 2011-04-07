unless RUBY_PLATFORM != "java"
  gem "nokogiri", "=1.5.0.beta.4" # earlier version threw Java hardcore errors
end
require 'nokogiri'
require 'bigdecimal'

class XmlRatesParser

  def initialize(filepath)
    @doc = create_doc(filepath)
    create_rates_hash
  end

  def create_rates_hash
    xml = get_rates_from_xml(@doc)
    @rates = map_rates(xml)
  end

  def create_doc(filepath)
    Nokogiri::XML(File.open('files/SAMPLE_RATES.xml'))
  end

  def get_rates_from_xml(doc)
    doc.css('rate')
  end


  def map_rates(xml)
    rates = {}
    xml.each { |r|
      map_rate(r, rates)
    }
    rates
  end

  # Map both the to -> from conversion, but also
  # the from -> to conversion, too
  def map_rate(element, hash={})
    from = element.css('from').text
    to = element.css('to').text

    h = get_hashes(element)
    if hash[from].nil?
      hash[from] = h[from]
    else
      hash[from].merge h[from]
    end
    if hash[to].nil?
      hash[to] = h[to]
    else
      hash[to].merge h[to]
    end
    hash
  end
  

  def get_hashes(element)
    h = {}
    h[element.css('from').text] = { element.css('to').text => BigDecimal(element.css('conversion').text) }
    h[element.css('to').text] = { element.css('from').text => inverse_conversion(element.css('conversion').text) }
    h
  end

  def inverse_conversion(string_conversion)
    BigDecimal.new("1") / BigDecimal.new(string_conversion)
  end


  def find_conversion(from, to)
    conversion_path = [ from ]
    @rates[from].each { |k,v|
      if k == to
        return conversion_path << to
      else
        find_path(to, @rates, @rates[from].keys)
      end
    }
  end


  # to = what we're looking for
  # possibles = what we have yet to prune out
  # tried = what we know doesn't have a direct mapping to the 'to' element
  def find_path(to, hash, possibles, tried=[])
    whats_left = possibles - tried
    whats_left.each { |e|
      hash[e].each { |k,v|
        if k == to
          tried << k
          return tried
        else
          tried << k
          find_path(to, hash, hash[k].keys, tried)
        end
      }
    }
  end




end


