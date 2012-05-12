
require 'pry'
require_relative '../spec_helper'
require_relative '../../lib/graph/db'
require_relative '../../lib/graph/db_utils'
require_relative '../../lib/graph/airport'
require_relative '../../lib/graph/flight_graph'
require_relative '../../lib/file_parser'
require_relative '../../lib/graph/path_evaluator'

describe "graph paths with default input file" do

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

    before do
      @traverser = @a.outgoing(:flies_to).depth(:all).unique(:node_path).filter { |path|
        path.end_node[:name] == "Z" }.eval_paths { |path|
        PathEvaluator.evaluate_path(path)
      }
      @paths = @traverser.paths.to_a
    end


    it "should reject paths that don't connect to the end airport" do
      @paths.each { |p|
        p.start_node[:name].must_equal("A")
        p.end_node[:name].must_equal("Z")
      }
    end

  end
end

describe "graph paths with provided input file" do
  
  before do
    @graph = FlightGraph.new
  end

  after do
    Neo4j.shutdown
    Neo4jDbUtils.rm_db_storage
  end

  it "shouldn't find a connecting flight takeoff BEFORE previous landing" do
    @flights = FileParser.load_input_file("files/overlapping-flights.txt")
    @graph.create_flights_from_array_hash(@flights[0])
    @a = Airport.find('name: A').first
    @traverser = @a.outgoing(:flies_to).depth(:all).unique(:node_path).filter { |path|
      path.end_node[:name] == "Z" }.eval_paths { |path|
        PathEvaluator.evaluate_path(path)
    }
    @paths = @traverser.paths.to_a
    @paths.size.must_equal(1)
  end

  describe "quick or cheap flights" do

    before do
      @flights = FileParser.load_input_file("files/cheapest-quickest-flight.txt")
      @graph.create_flights_from_array_hash(@flights[0])
      @a = Airport.find_start_node
      @traverser = @a.outgoing(:flies_to).depth(:all).unique(:node_path).filter { |path|
        path.end_node[:name] == "Z" }.eval_paths { |path|
          PathEvaluator.evaluate_path(path)
        }
        @paths = @traverser.paths.to_a
    end

    it "should find the cheapest flight" do
      cheapest = PathEvaluator.cheapest_path(@paths)
      PathEvaluator.cost_of_path(cheapest).must_equal(200.00)
    end

    it "should find the quickest flights" do
      quickest = PathEvaluator.quickest_path(@paths)
      PathEvaluator.duration_of_flights(quickest).must_equal(2.0)
    end

  end

  # TODO: don't have this figured out, but I want to play in here a bit
  # I'm going to use this to figure out what I need to test for multiple
  # paths for best flight, best cost/time.
  it "should let me find the best flights" do
    @graph = FlightGraph.new
    @flights = FileParser.load_input_file("files/input.txt")
    @graph.create_flights_from_array_hash(@flights[0])
    @a = Airport.find_start_node
    @traverser = @a.outgoing(:flies_to).depth(:all).unique(:node_path).filter { |path|
      path.end_node[:name] == "Z" }.eval_paths { |path|
        PathEvaluator.evaluate_path(path)
      }
    @paths = @traverser.paths.to_a

    quickest = PathEvaluator.quickest_path(@paths)
    # TODO: As in the finding the cheapest flight, create two flights
    # where one is shorter in overall time than the other, and verify
    # that it is picked.

    require 'pry'
    binding.pry
    fail "so I can find the spec"
  end

end
