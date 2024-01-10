require "sinatra"
require "sinatra/reloader"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Visit some routes like /square/new to begin</p>
  "
end

get("/square/new")do
erb(:square)
end

get("/square/results")do
@num = params.fetch("a_num").to_f
@square = @num ** 2.to_f
erb(:square_results)
end

get("/square_root/new")do
erb(:square_root)
end

get("/square_root/results")do
@num = params.fetch("a_num").to_f
@square_root = @num ** 0.5.to_f
erb(:square_root_results)
end

get("/payment/new")do
erb(:payment)
end

get("/payment/results")do
@apr = params.fetch("apr").to_f
@apr.to_fs(:percentage, { :precision => 4 })
@r = (@apr / 100) / 12.to_f
@years =  params.fetch("years").to_i
@n = @years * 12.to_i
@pv = params.fetch("principal").to_f
@pv.to_fs(:currency)
@numerator = (@r * @pv).to_f
@denominator = 1 - (1+@r) ** -@n
@p = (@numerator/@denominator).to_fs(:currency)
erb(:payment_results)
end

get("/random/new")do
erb(:random)
end

get("/random/results")do
@min = params.fetch("min").to_f
@max = params.fetch("max").to_f
@random = rand(@min..@max).to_f
erb(:random_results)
end
