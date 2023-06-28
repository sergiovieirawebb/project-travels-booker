require "../../services/travel_plans/get_all_travel_plans"
require "../../services/travel_plans/get_by_id_travel_plans"

get "/travel_plans" do |env|
  env.response.status_code = 200
  get_all_travel_plans().to_json
end

get "/travel_plans/:id" do |env|
  env.response.status_code = 200
  travel_id = env.params.url["id"].to_i64
  get_by_id_travel_plans(travel_id).to_json
end
