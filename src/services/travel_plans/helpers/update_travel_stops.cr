require "../../../models/stop"

def update_travel_stops(travel_id : Int64?, travel_stops : Array(Int64?))
  stops = Stop.all.where { _travel_id == travel_id }

  i = 0
  stops.each do |t|
    Stop.find!(t.id).update(stop: travel_stops[i])
    i += 1
  end

  return {
    id: travel_id,
    travel_stops: travel_stops
  }
end
