class Flight

  include Neo4j::RelationshipMixin

  property :takeoff
  property :landing

  property :flight_time, :type => Fixnum
  property :cost, :type => Fixnum

end
