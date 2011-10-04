require 'neo4j'

class Currency
  include Neo4j::NodeMixin

  property :name
  rule :all # allows to search for "all" nodes
  # Has many currencies it can convert from or to
  has_n(:converts).to(Currency)

  index :name
end

class ConvertsTo
  include Neo4j::RelationshipMixin

  property :amount

end
