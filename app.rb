require "sinatra"
require "sinatra/reloader"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end

get("/howdy") do
  erb(:hello)
end

get("/square/new")do
erb(:square)
end

get("/square/results")do
@num = params.fetch("a_num").to_i
@square = @num ** 2.to_f
erb(:square_results)
end
