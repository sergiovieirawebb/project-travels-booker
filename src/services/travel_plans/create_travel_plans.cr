require "../../models/travel"
require "../../models/stop"

def create_travel_plans(stops : Array(Int64?))
  travel = Travel.create

  stops.each do |stop|
    Stop.create({
      travel_id: travel.id,
      stop:      stop,
    })
  end

  return {
    id:           travel.id,
    travel_stops: stops,
  }
end
