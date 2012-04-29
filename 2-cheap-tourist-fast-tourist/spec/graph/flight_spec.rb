require_relative "../spec_helper"
require_relative '../../lib/graph/db'
require_relative '../../lib/graph/db_utils'
require_relative '../../lib/graph/airport'
require_relative "../../lib/graph/flight"

describe "creating a flight" do

  before do
    Neo4jDbUtils.new_temp_db
    Neo4j::Transaction.run {
      @from = Airport.new(name: "A", secret: "money")
      @to = Airport.new(name: "Z", secret: "maker")
      Flight.new(:flies_to, @from, @to, :takeoff => "10:30",
               :landing => "11:30", :flight_time => 3,
               :cost => 130.0)
    }
  end

  after do
    Neo4jDbUtils.rm_db_storage
  end

  it "should find a flight" do
    a = Airport.find('name: A').first
    rels = a.rels(:outgoing, :flies_to).to_other(Airport.find('name: Z').first)
    rels.to_a[0][:takeoff].must_be(:==, "10:30")
  end
  
end
