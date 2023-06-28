require "../../../models/stop"

def get_travel_stops(travel_id : Int64?)
  stops = Stop.all.where { _travel_id == travel_id }
  result = [] of Int64?

  stops.each do |t|
    result << t.stop
  end

  return result
end
