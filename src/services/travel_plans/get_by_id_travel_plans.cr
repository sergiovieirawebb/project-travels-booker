require "../../models/travel"
require "./helpers/get_travel_stops"

def get_by_id_travel_plans(travel_id : Int64?)
  travel = Travel.find!(travel_id)

  return {
    id:           travel.id,
    travel_stops: get_travel_stops(travel.id),
  }
end
