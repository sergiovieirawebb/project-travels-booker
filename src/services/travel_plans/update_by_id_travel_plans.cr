require "../../models/travel"
require "./helpers/update_travel_stops"

def update_by_id_travel_plans(travel_id : Int64?, travel_stops : Array(Int64?))
  return update_travel_stops(travel_id, travel_stops)
end
