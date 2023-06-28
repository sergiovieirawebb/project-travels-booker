require "../../services/travel_plans/delete_by_id_travel_plans"

delete "/travel_plans/:id" do |env|
  env.response.status_code = 204
  travel_id = env.params.url["id"].to_i64
  delete_by_id_travel_plans(travel_id)
end
