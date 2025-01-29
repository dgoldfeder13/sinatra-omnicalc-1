require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:homepage)
end

get("/square/new") do
  erb(:square)
  
end
get("/square/results") do
  @square_num = params.fetch("number")
end


get("/square_root/new") do
end
get("square_root/results") do 
  @root_numm = params.fetch("number")
end


get("/random/new") do
end
get("/random/results") do
  @min = params.fetch("user_min").to_f
  @max = params.fetch("user_max").to_f

  @random_num = rand(@min..@max).to_f
  "test"
end

get("/payment/new") do
end
get("/payment/results") do
  @apr = params.fetch("user_apr").to_f / 100 
  @years = params.fetch("user_years").to_i
  @principal = params.fetch("user_pv").to_f
  "test"
end
