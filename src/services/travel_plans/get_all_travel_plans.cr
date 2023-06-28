require "../../models/travel"
require "./helpers/get_travel_stops"

def get_all_travel_plans
  travels = Travel.all
  result = [] of NamedTuple(id: Int64?, travel_stops: Array(Int64?))

  travels.each do |travel|
    result << {
      id:           travel.id,
      travel_stops: get_travel_stops(travel.id),
    }
  end

  return result
end
