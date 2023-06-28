require "../../models/travel"

def delete_by_id_travel_plans(travel_id : Int64?)
  return Travel.destroy(travel_id)
end
