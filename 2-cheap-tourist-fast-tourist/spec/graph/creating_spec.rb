
require_relative "../spec_helper"
require_relative '../../lib/graph/db'
require_relative '../../lib/graph/db_utils'
require_relative '../../lib/graph/airport'

describe "creating a graph from a file" do

  before do
    Neo4jDbUtils.new_temp_db
  end

  after do
    Neo4jDbUtils.rm_db_storage
  end

  it "should create an airport and flight for an input line" do
    fail

    graph = FlightGraph.new

    input = "B Z 11:30 13:30 100.00"
    graph.read_flight(input)
    b = graph.airport("B")
    rels = b.rels(:outgoing, :flies_to).to_other(Airport.find('name: Z').first)
    require 'pry'
    binding.pry
    flight = rels.to_a[0]
    flight[:start_time].must_be(:==, "11:30")
    flight[:end_time].must_be(:==, "13:30")
    flight[:cost].must_be(:==, 100)
    flight[:flight_time].must_be(:==, 2)
  end
