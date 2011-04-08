unless RUBY_PLATFORM != "java"
  gem "nokogiri", "=1.5.0.beta.4" # earlier version threw Java hardcore errors
end
require 'nokogiri'
require 'bigdecimal'

class XmlRatesParser
  attr_accessor :doc, :rates

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
      hash[from].merge! h[from]
    end
    if hash[to].nil?
      hash[to] = h[to]
    else
      hash[to].merge! h[to]
    end
    hash
  end
  

  def get_hashes(element)
    h = {}
    from = 
    #puts "mapping from -> to: #{element.css('from').text} => #{element.css('to').text} = #{BigDecimal(element.css('conversion').text)}"
    h[element.css('from').text] = { element.css('to').text => BigDecimal(element.css('conversion').text) }
    #puts "mapping to -> from:#{element.css('to').text} => #{element.css('from').text} = #{inverse_conversion(element.css('conversion').text)}" 
    h[element.css('to').text] = { element.css('from').text => inverse_conversion(element.css('conversion').text) }
    h
  end

  def inverse_conversion(string_conversion)
    BigDecimal.new("1") / BigDecimal.new(string_conversion)
  end


  # Brute force method, depth search tops out at 3, meaning
  # you only get [FROM, INTERMEDIATE, TO] for your maximum depth of
  # answers.
  # TODO: Increase depth of search
  # TODO: Refactor like crazy
  # TODO: Handle bad conversions? ("US" isn't mapped, should throw exception?)
  def find_conversion_path(from, to)
    path = [ from ]
    next_step = @rates[from].keys
    if next_step.include? to
      path << to
      return path
    else
      path = next_step.each { |d|
        if @rates[d].keys.include? to
          path << d
          path << to
          return path
        end
      }
      unless path.size == 1 # we didn't find anything in 2nd tier, going 3rd
        paths = [] # container for array of possible paths, all starting with [from]
        next_step.each { |d|
          p = Array.new(path)
          p << d
          paths << p
        }
        paths.each { |pa|
          if @rates[pa[-1]].keys.include? to
            path << pa[-1]
            path << to
            return path
          end
        } # no 3rd-tier find of the 'to' element, things are getting messy
      end
    end
  end
end