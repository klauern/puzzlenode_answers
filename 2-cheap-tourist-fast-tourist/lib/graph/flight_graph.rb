require_relative '../military_time'
require_relative 'flight'
require_relative 'airport'

class FlightGraph

  # Read a single flight
  def read_flight(input_line)
    pieces = input_line.split
    from = get_or_create_airport(pieces[0])
    to = get_or_create_airport(pieces[1])
    create_flight(from, to, pieces[2..4])
  end

  # get an airport from the graph, or create if it doesn't exist
  def get_or_create_airport(name)
    airport = Airport.find("name: #{name}").first
    if airport.nil? 
      Neo4j::Transaction.run {
        airport = Airport.new(:name => name)
      }
    end
    airport
  end

  # Add a flight to the graph
  def create_flight(from, to, time_and_cost)
    start = time_and_cost[0]
    stop = time_and_cost[1]
    cost = time_and_cost[2]
    Neo4j::Transaction.run {
      Flight.new(:flies_to, from, to, :takeoff => start,
                 :landing => stop,
                 :flight_time => military_difference(start, stop),
                 :cost => cost.to_f)
    }
  end

  def create_flight_from_hash(flight)
    from = get_or_create_airport(flight[:from])
    to = get_or_create_airport(flight[:to])
    Neo4j::Transaction.run do
      Flight.new(:flies_to, from, to,
                 :takeoff => flight[:takeoff],
                 :landing => flight[:landing],
                 :flight_time => military_difference(flight[:takeoff],
                                                     flight[:landing]),
                                                     :cost => flight[:cost].to_f)
    end
  end

  def create_flights_from_array_hash(flights)
    flights.each { |flight|
      puts "reading #{flight}"
      create_flight_from_hash(flight)
    }
  end

  def airport(name)
    get_or_create_airport(name)
  end

end

