class Flight

  include Neo4j::RelationshipMixin

  property :start_time
  property :end_time

  property :flight_time, :type => Fixnum
  property :cost, :type => Fixnum

end
