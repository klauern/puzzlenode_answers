require_relative "../spec_helper"
require_relative '../../lib/graph/db'
require_relative '../../lib/graph/db_utils'
require_relative '../../lib/graph/airport'


describe "creating airport nodes" do

  it "should create a new airport with name" do
    Neo4j::Transaction.run {
      Airport.new(name: "MSP", secret: "property it doesn't know about")
    }
    Airport.find('name: "MSP"').first[:secret].must_be(:==, "property it doesn't know about")
  end
end
