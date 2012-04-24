class Flight

  include Neo4j::RelationshipMixin

  property :flight_time, :type => Fixnum
  property :cost, :type => Fixnum

end
