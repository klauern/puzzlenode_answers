# military time conversion

require 'time'

def military_difference(future,past)
  future_time = Time.parse future
  past_time = Time.parse past

  return (future_time - past_time) / 60 / 60 # return num hours difference
end

