require_relative "../spec_helper"
require_relative '../../lib/graph/db'
require_relative '../../lib/graph/db_utils'
require_relative '../../lib/graph/airport'

# Because some of these tests are for me, not just my code... :P
def i str, &block
  it str, &block
end


describe "Airport Nodes" do

  before do
    Neo4jDbUtils.new_temp_db
    #Neo4j::Node.index(:name)
  end

  after do
    Neo4j.shutdown
    Neo4jDbUtils.rm_db_storage
  end

  i "should know how to create multiple Airport nodes" do
    Neo4j::Transaction.run {
      Airport.new(name: "Z", some_other_property: "magical")
      ref = Neo4j.ref_node
    }
    Airport.find('name: Z').first[:some_other_property].must_be(:==, "magical")
  end

end
