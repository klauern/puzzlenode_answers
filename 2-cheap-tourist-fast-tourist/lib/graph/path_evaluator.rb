
require_relative '../military_time'

# Utility methods for using the Traverser API to evaluate good and bad paths.
# See Neo4j's documentation: http://docs.neo4j.org/chunked/stable/tutorial-traversal-java-api.html
class PathEvaluator

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
      #return :exclude_and_continue
      return :include_and_continue
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
    path.length < 2 && path.end_node[:name] != "Z"
  end

  # Does it touch the end node at all?
  def self.touches_end_node?(path)
    path.end_node[:name] == "Z"
  end

  # Do the connecting flights overlap?  That is, does
  # the landing flight land AFTER the takeoff of it's next connection?
  def self.connecting_flights_overlap?(path)
    previous_landing = nil
    path.relationships.each { |rel|
      if previous_landing == nil
        previous_landing = rel[:landing]
      elsif military_difference(previous_landing, rel[:takeoff]) < 0
        return true
      else
        previous_landing = rel[:landing]
      end
    }
    false
  end


  # Find the cheapest path from a set of paths
  # Assumed that each path has been previously validated
  def self.cheapest_path(paths)
    cheapest = paths.first
    paths.each { |p|
      if cost_of_path(cheapest) > cost_of_path(p)
        cheapest = p
      end
    }
    cheapest
  end


  # Find the cost of flights for a given path
  def self.cost_of_path(path)
    total = 0.0
    path.relationships.each { |rel|
      total += rel[:cost]
    }
    total
  end

  # Find the flight duration for a path of flights
  def self.duration_of_flights(path)
    military_difference(path.relationships.first[:takeoff],
                        path.last_relationship[:landing])
  end

  def self.quickest_path(paths)
    quickest = paths.first
    old_quickest = duration_of_flights(paths.first)
    paths.each { |p|
      new_quickest = duration_of_flights(p)
      if new_quickest < old_quickest
        quickest = p
        old_quickest = new_quickest
      elsif new_quickest == old_quickest
        if cost_of_path(p) < cost_of_path(quickest)
          quickest = p
          old_quickest = new_quickest
        end
      end
    }
    quickest
  end

  def self.start_time_of_path(path)
    path.relationships.first[:takeoff]
  end

  def self.end_time_of_path(path)
    path.last_relationship[:landing]
  end
end
