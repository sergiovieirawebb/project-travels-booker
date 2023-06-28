require "kemal"

get "/travel_plans" do |env|
  env.response.status_code = 200
  {message: "initial setup"}.to_json
end


Kemal.run
