require_relative "../spec_helper"
require_relative '../../lib/graph/db'
require_relative '../../lib/graph/db_utils'
require_relative '../../lib/graph/airport'
require_relative '../../lib/graph/flight_graph'


describe "creating airport nodes" do

  before do
    Neo4jDbUtils.new_temp_db
  end

  after do
    Neo4j.shutdown
    Neo4jDbUtils.rm_db_storage
  end

  it "should create a new airport with name" do
    Airport.find('name: "MSP"').first.must_be_nil
    graph = FlightGraph.new
    graph.get_or_create_airport("MSP").wont_be_nil
  end
end
