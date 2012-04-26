require 'neo4j'

class Airport
  include Neo4j::NodeMixin
  rule :all
  #include :all, :functions => [Count.new]

  property :name

  has_n :flights

  index :name
end
