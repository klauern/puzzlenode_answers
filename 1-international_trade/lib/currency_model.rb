require 'neo4j'

class Currency
  include Neo4j::NodeMixin

  property :name
  rule :all # allows to search for "all" nodes
  index :name
  # Has many currencies it can convert from or to
  has_n :currencies

end
