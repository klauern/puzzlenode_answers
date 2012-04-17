require 'neo4j'

class Flight
  include Neo4j::NodeMixin

  property :from
  property :to
  property :cost
  property :time

  has_n :connecting_flights

  index :from
  index :to
end
