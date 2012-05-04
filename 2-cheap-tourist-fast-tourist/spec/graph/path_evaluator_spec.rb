
require 'pry'
require_relative '../spec_helper'
require_relative '../../lib/graph/db'
require_relative '../../lib/graph/db_utils'
require_relative '../../lib/graph/airport'
require_relative '../../lib/graph/flight_graph'
require_relative '../../lib/file_parser'
require_relative '../../lib/graph/path_evaluator'

describe "graph paths" do

  before do
    Neo4jDbUtils.new_temp_db
    @graph = FlightGraph.new
    @flights = FileParser.load_input_file
    @graph.create_flights_from_array_hash(@flights[1])
    @a = Airport.find('name: A').first
  end

  after do
    puts "shutting Neo4j down; end of test"
    Neo4j.shutdown
    Neo4jDbUtils.rm_db_storage
  end


  describe "evaluating a path" do

    it "should reject short paths that don't connect to the end airport" do
      paths = @a.outgoing(:flies_to).depth(:all).unique(:node_path).eval_paths { |path|
        PathEvaluator.evaluate_path(path)
      }
      binding.pry
      fail "not implemented properly yet"
    end

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

