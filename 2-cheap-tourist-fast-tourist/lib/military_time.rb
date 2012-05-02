# military time conversion

require 'time'

def military_difference(start_time,end_time)
  the_start = Time.parse start_time
  the_end = Time.parse end_time

  return (the_end - the_start) / 60 / 60 # return num hours difference
end
