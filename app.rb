require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:square)
end

get("/square/new") do
  erb(:square)
  
end
get("/square/results") do
  @square_num = params.fetch("number").to_f
  @squared = @square_num ** 2
  @squared = @squared.round(1)
  erb(:square_results)
end


get("/square_root/new") do
  erb(:root)
end
get("/square_root/results") do 
  @root_num = params.fetch("user_number").to_f
  @rooted = @root_num ** 1/2
  erb(:root_results)
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
  erb(:pay_new)
end
get("/payment/results") do
  @apr = params.fetch("user_apr").to_f 
  @years = params.fetch("user_years").to_i
  @principal = params.fetch("user_pv").to_f
  num = @apr * @principal/1200
  denom = 1 - (1 + @apr/1200) ** (@years * -12)
  @payment = num / denom
  @apr = @apr.to_fs(:percentage, {:precision => 4})
  @principal = @principal.to_fs(:currency, {:precision => 2})
  @payment = @payment.round(2)
  erb(:pay_result)
end
