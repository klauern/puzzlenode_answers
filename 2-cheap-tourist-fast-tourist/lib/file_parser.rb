

def load_input_file(filename="../../files/sample-input.txt")
  file = File.open filename
  sets = []
  flight_sets = file.readline.chop!
  flight_sets.to_i.times { 
    f = read_flight(file)
    sets.push f 
  }
  sets
end

def read_flight(file)
  file.readline
  flights = []
  num_lines = file.readline.chop.to_i
  num_lines.times { 
    flight = file.readline.chop
    flight_a = flight.split
    flight = {}
    flight[:from] = flight_a[0]
    flight[:to] = flight_a[1]
    flight[:takeoff] = flight_a[2]
    flight[:landing] = flight_a[3]
    flight[:cost] = flight_a[4].to_f
    flights.push flight
  }
  flights
end
