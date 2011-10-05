require 'neo4j'

class Currency
  include Neo4j::NodeMixin

  property :name
  rule :all # allows to search for "all" nodes
  # Has many currencies it can convert from or to
  has_n(:converts).to(Currency)

  index :name

  def self.add_conversion(from, to, rate)
    f = Currency.find(:name => from).first
    t = Currency.find(:name => to).first
    # Add search for pre-existing conversion relationship
    Neo4j::Transaction.run do
      f = Currency.new(:name => from) unless f
      t = Currency.new(:name => to) unless t
      r = Neo4j::Relationship.new(:converts_to, f, t)
      r[:rate] = rate
    end
  end

end
