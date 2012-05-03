
require_relative '../military_time'

# Utility methods for using the Traverser API to evaluate good and bad paths.
# See Neo4j's documentation: http://docs.neo4j.org/chunked/stable/tutorial-traversal-java-api.html
class Path

  def self.evaluate_path(path)
    # QUESTION: not sure if I need this check, since the default return 
    # is :exclude_and_continue
    if path_too_short?(path)
      return :exclude_and_continue
    elsif connecting_flights_overlap?(path)
      return :exclude_and_prune
    elsif touches_end_node?(path)
      return :include_and_prune
    else
      return :exclude_and_continue
    end
  end

  # Is there a layover?  That is, does the landing flight happen 
  # BEFORE the next takeoff?
  def self.layover?(landing, takeoff)
    military_difference(landing, takeoff) > 0
  end

  # Is the path too short (that is, is it only 2 links deep and 
  # doesn't end at "Z"
  def self.path_too_short?(path)
    path.length < 2 && path.end_node.name != "Z"
  end

  # Does it touch the end node at all?
  def self.touches_end_node?(path)
    path.end_node.name == "Z"
  end

  # Do the connecting flights overlap?  That is, does
  # the landing flight land AFTER the takeoff of it's next connection?
  def self.connecting_flights_overlap?(path)
  end

end
