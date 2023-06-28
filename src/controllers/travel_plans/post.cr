require "../../services/travel_plans/create_travel_plans"

post "/travel_plans" do |env|
  env.response.status_code = 201
  travel_stops = env.params.json["travel_stops"].as(Array).map { |value| value.as_i64 }
  create_travel_plans(travel_stops).to_json
end
