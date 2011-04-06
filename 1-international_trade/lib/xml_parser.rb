unless RUBY_PLATFORM != "java"
  gem "nokogiri", "=1.5.0.beta.4" # earlier version threw Java hardcore errors
end
require 'nokogiri'
require 'bigdecimal'

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


=begin
 This was getting messy before I slept on it

 The structure should be a hash of hashes, NOT a hash of arrays of hashes. There's no benefit in storing the second hash in an array because you can simply use it directly like so:

 h = {}
 h['USD'] = { 'CAD' => 1.0779, 'AUD' => 1.0779 }, etc., etc.

 where before we were messing about with a pretty awful mapping that inevitably doubled up entries where they would have just been overwritten in this case.

 Also, there should be some effort in making a simple trie structure to hold the paths possible to get from one conversion to another.  I don't know what the effort entails, but it seems straightforward to me

=end

  # Map both the to -> from conversion, but also
  # the from -> to conversion, too
  def map_rate(element, hash={})
    from = element.css('from').text
    to = element.css('to').text

    h = get_hashes(element)
    if hash[from].nil?
      hash[from] = [] << h[from]
    else
      hash[from] << h[from]
    end
    if hash[to].nil?
      hash[to] = [] << h[to]
    else
      hash[to] << h[to]
    end
    hash
  end

  def get_hashes(element)
    h = { element.css('from').text => { :to => element.css('to').text,
                                        :conversion => element.css('conversion').text },
          element.css('to').text   => { :to => element.css('from').text,
                                        :conversion => inverse_conversion(element.css('conversion').text) }
        }
    h
  end

  def inverse_conversion(string_conversion)
    BigDecimal.new("1") / BigDecimal.new(string_conversion)
  end


  def map_rates(xml)
    rates = {}
    xml.each { |r|
      map_rate(r, rates)
    }
    rates
  end

  def find_conversion(from, to)
    @rates[from].each_index { |hash_index|
      @rates[from][hash_index].each { |k,v|
        if k == :to && v == to
          # puts "Found it: #{@rates[from][hash_index][:conversion]}"
          return @rates[from][hash_index][:conversion]
        else
          find_deeper(to, @rates[from].keys)
        end

      }
    }
  end


  # to = what we're looking for
  # possibles = what we have yet to prune out
  # tried = what we know doesn't have a direct mapping to the 'to' element
  def find_path(to, hash, possibles, tried=[])
    whats_left = possibles - tried                  # 1 get a list of things we haven't done yet
    whats_left.each { |e|                           # 2 try them all out
      hash[e].each_index { |hash_index|
        hash[e][hash_index].each { |k,v|          # 3 pull from the authority @rates hash
          tried << k                                # tried has our ordered list of conversions to apply
          if k == to && v == to                     # 4 if @rates[this_index] has a to and hte value is to
            return tried
          else
            find_path(to, hash, hash[k].keys, tried)
          end
        }
      }
    }
  end




end


