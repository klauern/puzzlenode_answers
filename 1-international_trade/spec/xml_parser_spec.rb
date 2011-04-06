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

    it "should create a conversion for simple XML elements" do
      xml = "<rate><from>USD</from><to>CAD</to><conversion>1.0799</conversion></rate>"
      hashes = @xml_parser.get_hashes(xml)
      hashes['USD']['CAD']:
    end
  end


end


