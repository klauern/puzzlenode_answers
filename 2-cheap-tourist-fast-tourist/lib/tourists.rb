$LOAD_PATH.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'graph/db'
require 'file_parser'
require 'military_time'
require 'graph/db_utils'
require 'graph/flight_graph'
require 'graph/path_evaluator'

def process(input_file="files/sample-input.txt")
  $file = FileParser.load_input_file(input_file)

  $output_file = File.new("output_file", "w")

  $file.each { |f|
    Neo4jDbUtils.new_temp_db
    graph = FlightGraph.new()
    graph.create_flights_from_array_hash(f)
    paths = graph.evaluate_all_paths_in_graph()
    cheap = PathEvaluator.cheapest_path(paths)
    $output_file.puts output_flight_info(cheap)
    quick = PathEvaluator.quickest_path(paths)
    $output_file.puts output_flight_info(quick)
    $output_file.puts ""
    Neo4j.shutdown
    Neo4jDbUtils.rm_db_storage
  }
end
  

# The output lines for either Steve or Jennifer's flights will be
# Flight Time Departure Arrival Cost
#
# So we could expect that given a path for the flight, we'd be able to output
# the path like
#
# 09:00 13:30 200.00
#
def output_flight_info(path)
  takeoff = PathEvaluator.start_time_of_path(path)
  landing = PathEvaluator.end_time_of_path(path)
  cost = PathEvaluator.cost_of_path(path)

  "#{takeoff} #{landing} #{cost}"
end

process("files/input.txt")
