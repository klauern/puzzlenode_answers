require_relative "../spec_helper"
require_relative '../../lib/graph/db'
require_relative '../../lib/graph/db_utils'
require_relative '../../lib/graph/airport'


describe "Airport Nodes" do

  before do
    Neo4jDbUtils.new_temp_db
    #Neo4j::Node.index(:name)
  end

  after do
    Neo4j.shutdown
    Neo4jDbUtils.rm_db_storage
  end


  it "should create multiple Airport nodes" do
    Neo4j::Transaction.run {
      Airport.new(name: "Z")
      ref = Neo4j.ref_node
      require 'pry'
      binding.pry
    }

  end
end
