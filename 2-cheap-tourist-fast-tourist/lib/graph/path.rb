
require_relative '../military_time'

class Path

  def self.evaluate_path(path)

  end

  def self.layover?(landing, takeoff)
    military_difference(landing, takeoff) > 0
  end

  def self.path_too_short(path)
    path.length >= 2 && path.end_node.name == "Z"
  end

end
