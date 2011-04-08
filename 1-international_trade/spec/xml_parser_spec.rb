require 'spec_helper'

describe "XML Parser" do
  
  before(:each) do
    @xml_parser = XmlRatesParser.new('files/SAMPLE_RATES.xml')
    @doc = Nokogiri::XML(File.open('files/SAMPLE_RATES.xml'))
  end

  it "should get rates XML from a document" do
    rates = @xml_parser.get_rates_from_xml(@doc)
    rates.size.should == 3
    rates.class.should == Nokogiri::XML::NodeSet
  end


  describe "creating Hashes from rates" do

    before(:each) do
      @h_xml = XmlRatesParser.new('files/SAMPLE_RATES.xml')
    end

    it "should create a conversion for simple XML elements" do
      xml = Nokogiri::XML("<rate><from>USD</from><to>CAD</to><conversion>1.0799</conversion></rate>")
      hashes = @h_xml.get_hashes(xml)
      hashes['USD']['CAD'].should == BigDecimal('1.0799')
      hashes['CAD']['USD'].should == BigDecimal('1') / BigDecimal('1.0799')
    end

  end

  describe "with path traversal" do

    it "should find a direct path from AUD to CAD" do
      path = @xml_parser.find_conversion_path("AUD", "CAD")
      path.should == [ "AUD", "CAD" ]
    end

    it "should find a direct reverse path from CAD to AUD" do
      path = @xml_parser.find_conversion_path("CAD", "AUD")
      path.should == [ "CAD", "AUD" ]
    end
    
    it "should map a simple reverse mapping that's already there in CAD -> USD" do
      path = @xml_parser.find_conversion_path("CAD", "USD")
      path.should == [ "CAD", "USD" ]
    end

    it "should find an indirect path from AUD to USD" do
      path = @xml_parser.find_conversion_path("AUD", "USD")
      path.should == [ "AUD", "CAD", "USD" ]
    end

  end

end


