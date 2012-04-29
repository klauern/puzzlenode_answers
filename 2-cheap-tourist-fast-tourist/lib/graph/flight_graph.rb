require_relative '../military_time'
require_relative 'flight'
require_relative 'airport'

class FlightGraph

  def read_flight(input_line)
    pieces = input_line.split
    Neo4j::Transaction.run do
      from = get_or_create_airport(pieces[0])
      to = get_or_create_airport(pieces[1])
      create_flight(from, to, pieces[2..4])
    end
  end

  def get_or_create_airport(name)
    airport = Airport.find("name: #{name}").first
    if airport.nil? 
      Neo4j::Transaction.run {
        airport = Airport.new(:name => name)
      }
    end
    airport
  end

  def create_flight(from, to, time_and_cost)
    start = time_and_cost[0]
    stop = time_and_cost[1]
    cost = time_and_cost[2]
    Flight.new(:flies_to, from, to, :takeoff => start,
               :landing => stop,
               :flight_time => military_difference(start, stop),
               :cost => cost.to_f)
  end


  def airport(name)
    get_or_create_airport(name)
  end
end
