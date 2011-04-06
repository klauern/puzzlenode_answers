require 'csv_parser'
require 'xml_parser'


class RateConverter

  def initialize(hash)
    @from = create_direct_mapping(hash)
    @to = reverse_mapping(hash)
    @from.merge!(@to)
  end

end
