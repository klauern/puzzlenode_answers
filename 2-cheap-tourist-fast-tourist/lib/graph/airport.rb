require 'neo4j'

class Airport
  include Neo4j::NodeMixin

  property :name

  has_n :flights

  index :name
end
