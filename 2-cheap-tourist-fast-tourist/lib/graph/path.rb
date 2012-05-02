
require_relative '../military_time'

class Path

  def evaluate_path(path)

  end

  def layover?(landing, takeoff)
    military_difference(landing, takeoff) > 0
  end

  def path_too_short(path)
    path.length >= 2 && path.end_node.name == "Z"
  end

end
