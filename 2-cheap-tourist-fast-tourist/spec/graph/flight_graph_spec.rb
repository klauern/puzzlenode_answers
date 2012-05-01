
require_relative '../spec_helper'
require_relative '../../lib/graph/db'
require_relative '../../lib/graph/db_utils'
require_relative '../../lib/graph/airport'
require_relative '../../lib/graph/flight_graph'
require_relative '../../lib/file_parser'

describe "creating a graph from a file" do

  before do
    Neo4jDbUtils.new_temp_db
  end

  after do
    Neo4j.shutdown
    Neo4jDbUtils.rm_db_storage
  end

  it "should create an airport and flight for an input line" do

    graph = FlightGraph.new

    input = "B Z 11:30 13:30 100.00"
    graph.read_flight(input)
    b = graph.airport("B")
    rels = b.rels(:outgoing, :flies_to).to_other(Airport.find('name: Z').first)
    flight = rels.to_a[0]
    flight[:takeoff].must_be(:==, "11:30")
    flight[:landing].must_be(:==, "13:30")
    flight[:cost].must_be(:==, 100)
    flight[:flight_time].must_be(:==, 2)
  end


  it "should NOT create multiple airports given multiple input lines" do
    graph = FlightGraph.new

    ["A C 17:00 18:07 161.80", "C D 14:00 14:42 656.71", "D Z 21:00 22:07 312.80",
             "C D 01:00 01:42 90.71"].each { |flight|
      graph.read_flight(flight)
    }
    %w{ A C D Z }.each { |a|
      Airport.find("name: #{a}").size.must_be(:==, 1)
    }
  end

  it "should create a graph for a set of inputs" do
    graph = FlightGraph.new
    flights = FileParser.load_input_file
    graph.create_flights_from_array_hash(flights[0])
    require 'pry'
    binding.pry
    # TODO: get count of airports, and flights
    # TODO: should get flight graph for a couple somehow
    fail "not implemented properly yet"
  end


  describe "path finding" do

    it "should find paths from A to Z" do
      fail "not implemented"
    end

    it "shouldn't find a connecting flight takeoff BEFORE previous landing" do
      fail "not implemented"
    end

    it "should find the cheapest flight" do
      fail "not implemented"
    end

    it "should find the quickest flights" do
      fail "not implemented"
    end
  end
end
