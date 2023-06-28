require "../../services/travel_plans/update_by_id_travel_plans"

put "/travel_plans/:id" do |env|
  env.response.status_code = 200
  travel_id = env.params.url["id"].to_i64
  travel_stops = env.params.json["travel_stops"].as(Array).map { |stop| stop.as_i64 }
  update_by_id_travel_plans(travel_id, travel_stops).to_json
end
