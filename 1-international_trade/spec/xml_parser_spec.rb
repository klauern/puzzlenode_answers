require_relative 'spec_helper'

class XmlParserSpec < MiniTest::Spec

  describe "XML Parser" do

    before do
      @xml_parser = XmlRatesParser.new('files/SAMPLE_RATES.xml')
      @doc = Nokogiri::XML(File.open('files/SAMPLE_RATES.xml'))
    end

    it "should get rates XML from a document" do
      rates = @xml_parser.get_rates_from_xml(@doc)
      rates.size.must_equal 3
      rates.class.must_equal Nokogiri::XML::NodeSet
    end

    describe "creating Hashes from rates" do

      before do
        @h_xml = XmlRatesParser.new('files/SAMPLE_RATES.xml')
      end

      it "should create a conversion for simple XML elements" do
        xml = Nokogiri::XML("<rate><from>USD</from><to>CAD</to><conversion>1.0799</conversion></rate>")
        hashes = @h_xml.get_hashes(xml)
        hashes['USD']['CAD'].must_equal BigDecimal('1.0799')
        hashes['CAD']['USD'].must_equal BigDecimal('1') / BigDecimal('1.0799')
      end

    end

    describe "with path traversal" do

      it "should find a direct path from AUD to CAD" do
        path = @xml_parser.find_conversion_path("AUD", "CAD")
        path.must_equal [ "AUD", "CAD" ]
      end

      it "should find a direct reverse path from CAD to AUD" do
        path = @xml_parser.find_conversion_path("CAD", "AUD")
        path.must_equal [ "CAD", "AUD" ]
      end

      it "should map a simple reverse mapping that's already there in CAD -> USD" do
        path = @xml_parser.find_conversion_path("CAD", "USD")
        path.must_equal [ "CAD", "USD" ]
      end

      it "should find an indirect path from AUD to USD" do
        path = @xml_parser.find_conversion_path("AUD", "USD")
        path.must_equal [ "AUD", "CAD", "USD" ]
      end

      describe "using RATES.xml" do
        before do
          @rates_xml_prod = XmlRatesParser.new('files/RATES.xml')
        end

        it "should handle a large array of elements" do
          @rates_xml_prod.rates.keys.each { |key|
            puts "Find #{key} -> USD"
            unless key == "USD"
              @rates_xml_prod.find_conversion_path(key, "USD") 
            end
          }
          @rates_xml_prod.rates.size.must_equal 4 # 4 currencies
        end

        it "should find all EUR and AUD conversions" do
          aud = @rates_xml_prod.find_conversion_path("AUD", "USD")
          aud.must_equal [ "AUD", "CAD", "USD" ]
          eur = @rates_xml_prod.find_conversion_path("EUR", "USD")
          eur.must_equal [ "EUR", "AUD", "CAD", "USD" ]
        end
      end   
    end
  end
end
